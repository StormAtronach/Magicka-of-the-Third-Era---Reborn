-- game_data.lua
-- Writes the mod's data into the game's records: magic effects, spells, scroll enchantments,
-- what NPCs know and carry, and the book on synergies.
-- The original mod did this with a plugin. The tables in data/ replace it, and they win over
-- what the plugins of other mods say about the same records.

local config = require("Magicka of the Third Era.config")
local log = mwse.Logger.new{ modName = "Magicka of the Third Era", moduleName = "Game data", logLevel = config.log_level }

local magic_effects = require("Magicka of the Third Era.data.magic_effects")
local spells        = require("Magicka of the Third Era.data.spells")
local enchantments  = require("Magicka of the Third Era.data.enchantments")
local merchants     = require("Magicka of the Third Era.data.merchants")
local synergy_book  = require("Magicka of the Third Era.data.synergy_book")

local this = {}

local EFFECT_SLOTS = 8

-- A Lua long string holds line ends as "\n". The game's books use "\r\n".
local book_text = synergy_book.text:gsub("\r?\n", "\r\n")

--- Writes a list of effects over the eight slots of a spell or an enchantment.
---@param owner_id string
---@param slots tes3effect[]
---@param effects table[]
local function write_effects(owner_id, slots, effects)
  for i = 1, EFFECT_SLOTS do
    local slot, effect = slots[i], effects[i] or {}
    if effects[i] and not effect.id then
      log:error("%s: effect %d has no id, so the slot stays empty", owner_id, i)
    end
    slot.id = effect.id or -1
    slot.attribute = effect.attribute or -1 ---@diagnostic disable-line: assign-type-mismatch
    slot.skill = effect.skill or -1 ---@diagnostic disable-line: assign-type-mismatch
    slot.rangeType = effect.range or tes3.effectRange.self
    slot.min = effect.min or 0
    slot.max = effect.max or 0
    slot.duration = effect.duration or 0
    slot.radius = effect.area or 0
  end
end

local function apply_magic_effects()
  for id, data in pairs(magic_effects) do
    local effect = tes3.getMagicEffect(id)
    if effect then
      if data.base_cost then effect.baseMagickaCost = data.base_cost end
      if data.spellmaking ~= nil then effect.allowSpellmaking = data.spellmaking end
      if data.enchanting ~= nil then effect.allowEnchanting = data.enchanting end
      if data.description then effect.description = data.description end
    else
      log:warn("magic effect %s is not in the game", id)
    end
  end
end

--- Writes a spell's data into the game. A spell that the game does not have is created.
---@param id string
---@param data table
---@return boolean created
local function write_spell(id, data)
  local spell = tes3.getObject(id)
  local created = spell == nil
  if not spell then
    spell = tes3.createObject({ objectType = tes3.objectType.spell, id = id })
  end
  if spell.objectType ~= tes3.objectType.spell then
    log:error("%s is in the game, but it is not a spell", id)
    return false
  end
  ---@cast spell tes3spell
  spell.name = data.name
  -- Another mod may have made a power of it. The original's plugin made it a spell again.
  spell.castType = tes3.spellType.spell
  spell.magickaCost = data.cost
  spell.autoCalc = data.auto_calc or false
  spell.playerStart = data.start_spell or false
  spell.alwaysSucceeds = data.always_succeeds or false
  write_effects(id, spell.effects, data.effects)
  return created
end

local function apply_spells()
  local created = 0
  for id, data in pairs(spells.changed) do
    if write_spell(id, data) then created = created + 1 end
  end
  -- In the order of the list, which the game keeps for the spells it creates.
  for _, data in ipairs(spells.added) do
    if write_spell(data.id, data) then created = created + 1 end
  end
  log:debug("%d spells created", created)
end

local function apply_enchantments()
  for id, data in pairs(enchantments) do
    local enchantment = tes3.getObject(id)
    if enchantment and enchantment.objectType == tes3.objectType.enchantment then
      ---@cast enchantment tes3enchantment
      enchantment.chargeCost = data.cost
      enchantment.maxCharge = data.charge
      -- MWSE's annotations call this a number. The game takes a boolean.
      enchantment.autoCalc = data.auto_calc or false ---@diagnostic disable-line: assign-type-mismatch
      write_effects(id, enchantment.effects, data.effects)
    else
      log:warn("the enchantment %s is not in the game", id)
    end
  end
end

--- Gives an NPC an item, unless the NPC has it already.
--- tes3.addItem needs a reference, and an NPC that the player has not met yet has none.
---@param npc tes3npc
---@param item_id string
---@param count number
local function give_item(npc, item_id, count)
  local item = tes3.getObject(item_id)
  ---@cast item tes3item
  if not item then
    log:warn("%s cannot get %s, which is not in the game", npc.id, item_id)
  elseif not npc.inventory:contains(item) then
    npc.inventory:addItem({ item = item, count = count })
  end
end

---@param id string
---@return tes3npc?
local function find_npc(id)
  local npc = tes3.getObject(id)
  if npc and npc.objectType == tes3.objectType.npc then
    ---@cast npc tes3npc
    return npc
  end
  log:debug("the NPC %s is not in the game", id)
end

local function apply_npcs()
  for id, data in pairs(merchants) do
    local npc = find_npc(id)
    if npc then
      for _, spell_id in ipairs(data.add or {}) do
        local spell = tes3.getObject(spell_id)
        ---@cast spell tes3spell
        if spell then
          tes3.addSpell({ actor = npc, spell = spell, updateGUI = false })
        else
          log:warn("%s cannot learn %s, which is not in the game", id, spell_id)
        end
      end
      for _, spell_id in ipairs(data.remove or {}) do
        if npc.spells:contains(spell_id) then
          tes3.removeSpell({ actor = npc, spell = spell_id, updateGUI = false })
        end
      end
      if data.offers_spells and npc.aiConfig then npc.aiConfig.offersSpells = true end
      for item_id, count in pairs(data.items or {}) do give_item(npc, item_id, count) end
    end
  end
  for id, count in pairs(synergy_book.owners) do
    local npc = find_npc(id)
    if npc then give_item(npc, synergy_book.id, count) end
  end
end

---@param list tes3leveledItem
---@param item tes3object
local function list_holds(list, item)
  for _, node in pairs(list.list) do
    if node.object == item then return true end
  end
  return false
end

---@param e bookGetTextEventData
local function on_book_text(e)
  e.text = book_text
end

local function apply_book()
  local book = tes3.getObject(synergy_book.id)
  if not book then
    book = tes3.createObject({
      objectType = tes3.objectType.book, id = synergy_book.id, name = synergy_book.name,
      mesh = synergy_book.mesh, icon = synergy_book.icon, weight = synergy_book.weight, value = synergy_book.value,
    })
  end
  ---@cast book tes3book
  local options = { filter = book }
  if not event.isRegistered(tes3.event.bookGetText, on_book_text, options) then
    event.register(tes3.event.bookGetText, on_book_text, options)
  end

  for list_id, level in pairs(synergy_book.leveled_lists) do
    local list = tes3.getObject(list_id)
    if list and list.objectType == tes3.objectType.leveledItem then
      ---@cast list tes3leveledItem
      if not list_holds(list, book) then list:insert(book, level) end
    else
      log:warn("the leveled list %s is not in the game", list_id)
    end
  end
end

--- The parts of the write by name, for a profiler that times them one by one.
this.parts = {
  magic_effects = apply_magic_effects,
  spells = apply_spells,
  enchantments = apply_enchantments,
  book = apply_book,
  npcs = apply_npcs,
}

--- Magic effects, spells and enchantments. Runs while the game still loads, at magicEffectsResolved.
--- The game works out four things after that point, and has to find the mod's numbers when it does:
--- the cost of auto-calculated spells, the cost and charge of auto-calculated enchantments,
--- the value of auto-calculated potions, and the spells of auto-calculated NPCs.
function this.apply_magic()
  apply_magic_effects()
  apply_spells()
  apply_enchantments()
  log:info("magic effects, spells and enchantments written")
end

--- The book, and what NPCs know and carry. Runs at initialized. These follow links between
--- records, which the game has not resolved yet at magicEffectsResolved. Reading them there crashes.
function this.apply_world()
  apply_book()
  apply_npcs()
  log:info("book and NPCs written")
end

--- Everything at once, for a game that has loaded.
function this.apply()
  this.apply_magic()
  this.apply_world()
end

--- Everything again. Runs after a save has loaded. A save holds its own copy of the spells
--- the mod created and of the NPCs it changed, and that copy is what the game has after the load.
function this.apply_after_load()
  apply_magic_effects()
  apply_spells()
  apply_enchantments()
  apply_npcs()
  log:debug("game data written again after a load")
end

return this
