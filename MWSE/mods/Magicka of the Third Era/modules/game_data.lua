-- game_data.lua
-- Writes the mod's data into the game's records: magic effects and spells.
-- The original mod did this with a plugin. The tables in data/ replace it, and they win over
-- what the plugins of other mods say about the same records.

local config = require("Magicka of the Third Era.config")
local log = mwse.Logger.new{ modName = "Magicka of the Third Era", moduleName = "Game data", logLevel = config.log_level }

local magic_effects = require("Magicka of the Third Era.data.magic_effects")
local spells        = require("Magicka of the Third Era.data.spells")

local this = {}

local EFFECT_SLOTS = 8

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

local function apply_spells()
  local created = 0
  for id, data in pairs(spells) do
    local spell = tes3.getObject(id)
    if not spell then
      spell = tes3.createObject({ objectType = tes3.objectType.spell, id = id })
      created = created + 1
    end
    if spell.objectType == tes3.objectType.spell then
      ---@cast spell tes3spell
      spell.name = data.name
      spell.magickaCost = data.cost
      spell.autoCalc = data.auto_calc or false
      spell.playerStart = data.start_spell or false
      spell.alwaysSucceeds = data.always_succeeds or false
      write_effects(id, spell.effects, data.effects)
    else
      log:error("%s is in the game, but it is not a spell", id)
    end
  end
  log:debug("%d spells created", created)
end

--- Writes everything. Runs once, when the game has loaded its plugins.
function this.apply()
  apply_magic_effects()
  apply_spells()
  log:info("game data applied")
end

return this
