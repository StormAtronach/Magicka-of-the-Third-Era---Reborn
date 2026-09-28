-- modules/ui.lua
-- UI event callbacks: spellmaker, spell merchant, and magic menu updates.

local config        = require("Magicka of the Third Era.config")
local SM            = require("Magicka of the Third Era.modules.spell_manager")
local Known_Effects = require("Magicka of the Third Era.modules.known_effects")
local Formulas      = require("Magicka of the Third Era.modules.formulas")

local premade_spells           = require("Magicka of the Third Era.data.premade_spells")
local custom_price_spells      = require("Magicka of the Third Era.data.custom_price_spells")

local log = mwse.Logger.new{ modName = "Magicka of the Third Era", logLevel = config.log_level }

local calculate_cast_chance   = Formulas.calculate_cast_chance

local spellmaker_cost  = 0
local self_spellmaking = false

-- Assigning text forces the element to re-render, so skip it when nothing changed.
local function set_text(element, text)
  if element.text ~= text then
    element.text = text
  end
end

-------------------------------------------------------------------------------

---@param e calcSpellmakingSpellPointCostEventData
local function spellmaker_update(e)
  -- This function updates the spell cost/chance in spellmaker. Also shows the synergies and recalculates the price based on cost.
  log:trace("Spellmaking menu is being updated!")
  local menu = tes3ui.findMenu("MenuSpellmaking")
  if menu then
    -- Find effects in the UI
    local ms_sel = menu:findChild("MenuSpellmaking_SpellEffectsLayout")
    if not ms_sel then return end
    local psp_p = ms_sel:findChild("PartScrollPane_pane")
    if not psp_p then return end
    local effect_database = psp_p.children
    local effects = {}
    -- Disposition matters, but by default only a little, because you only need 1 NPC with max disposition
    local disp_factor = 1
    local service_actor_sm = tes3ui.getServiceActor()
    if service_actor_sm then
      local disp = service_actor_sm.object.disposition
      if disp then
        disp_factor = 1 + (100 - disp) * config.economy_spellmaker_diff / 10000
      end
    end
    -- The rows show the range as text, which the engine takes from these GMSTs. They differ per game language.
    local range_touch = tes3.findGMST(tes3.gmst.sRangeTouch).value
    local range_target = tes3.findGMST(tes3.gmst.sRangeTarget).value
    -- Calculations for effects
    for i=1, #effect_database do
      local elem = effect_database[i]
      local effect_obj = elem:getPropertyObject("MenuSpellmaking_Effect")
      local duration = elem:getPropertyInt("MenuSpellmaking_Duration")
      -- Some stupid bug when default duration is 0, ruins the calculations and is factually incorrect (you can never have a duration of 0 in a spell, without MCP at least)
      if duration == 0 then duration = 1 end
      local mag_min = elem:getPropertyInt("MenuSpellmaking_MagLow")
      local mag_max = elem:getPropertyInt("MenuSpellmaking_MagHigh")
      local radius = elem:getPropertyInt("MenuSpellmaking_Area")
      -- Why can't you just be normal
      local range_text = elem.text
      local range = (range_text == range_target) and 2 or (range_text == range_touch) and 1 or 0
      local e_attribute = elem:getPropertyInt("MenuSpellmaking_Attribute")
      local e_skill = elem:getPropertyInt("MenuSpellmaking_Skill")

      -- object gives effects missing from the spell table their school's defaults, like the created spell gets.
      effects[i] = {id = effect_obj.id, object = effect_obj, min = mag_min, max = mag_max, duration = duration, radius = radius, rangeType = range, attribute = e_attribute, skill = e_skill}
    end
    -- MODLABEL 1
    -- If spell is legit, re-calculate the cost. The created spell is priced by the same function.
    local priced = SM.price_effects(effects)
    if priced then
      local spell_cost = priced.cost
      local mobile = tes3.mobilePlayer
      local skill_for_spell = SM.compute_skill(priced.skill_table, mobile)
      local spell_chance = calculate_cast_chance(spell_cost, mobile.willpower.current, mobile.luck.current, skill_for_spell)
      log:trace("Spell info updated. Skill for spell: %d, Cost: %.2f, Chance: %.2f", skill_for_spell, spell_cost, spell_chance)

      -- display discount
      local cost_text = tostring (math.round(spell_cost))
      if priced.discount > 0 then
        cost_text = cost_text .. " (-" .. tostring(math.floor(priced.discount*100)) .. "%)"
      end

      -- forward data for mods that use this value
      e.spellPointCost = math.round(spell_cost)

      --Needs a small delay since vanilla gets calculated right after this event, and we need to overwrite vanilla
      timer.start{type = timer.real, duration = 0.07, callback = function()
        -- The menu can close before the timer fires.
        local open_menu = tes3ui.findMenu("MenuSpellmaking")
        if not open_menu then log:debug("spellmaker_update: the menu closed before its labels were written") return end
        local label_texts = {
          MenuSpellmaking_SpellPointCost = cost_text,
          MenuSpellmaking_SpellChance = tostring (math.round(spell_chance)),
          MenuSpellmaking_PriceValueLabel = tostring (math.floor(spell_cost * config.economy_spellmaker_mult * disp_factor)),
        }
        for id, text in pairs(label_texts) do
          local label = open_menu:findChild(id)
          if label then
            label.text = text
          else
            log:warn("spellmaker_update: %s not found", id)
          end
        end
        end}

      -- save for cost checker, use disp_factor here
      spellmaker_cost = math.round(spell_cost * disp_factor)

    end
  end
end

-- attempt to fit with spellmaker mod

-- block spellmaking if you don't have enough gold, thanks to SpellMaker mod for this
---@param _ uiActivatedEventData
local function spellmaking_block(_)
  local menu = tes3ui.findMenu("MenuSpellmaking")
  if menu then
    local buyButton = menu:findChild("MenuSpellmaking_Buybutton")
    local gold_amount = tes3.getPlayerGold()
    self_spellmaking = (tes3ui.getServiceActor() == nil)
    if self_spellmaking then
      return
    end
    if not buyButton then return end
    buyButton:registerBefore(tes3.uiEvent.mouseClick,
        function(mouseClickEventData)
          if gold_amount < math.floor(spellmaker_cost * config.economy_spellmaker_mult) then
            tes3.messageBox("You don't have enough gold to create this spell")
            return false -- this will prevent the regular mouseclick event from being run
          end
        end
      )
  end
end

---@param _ spellCreatedEventData
local function spellmaking_payment(_)
  if not self_spellmaking and tes3.player then
    tes3.removeItem({reference = tes3.player, item = "gold_001", count = math.floor(spellmaker_cost * config.economy_spellmaker_mult)})
  end
end

-- Update the spell merchant UI
-- Does not work with this part of UI Expansion, unfortunately (UI Expansion uses different elements and bugs out sometimes), so I've made an even better UI (based on UI expansion)

---@param e uiActivatedEventData
local function spellmerchant_update(e)
  if not e.newlyCreated then return end
  -- Very similar to MenuMagic
  --e.element:registerAfter("preUpdate", function()
  local gold_amount = tes3.getPlayerGold()
  local service_actor = tes3ui.getServiceActor()
  if not service_actor then return end
  local disp = service_actor.object.disposition
  local disp_factor = 1
  if disp then
    disp_factor = 1 + (100 - disp) * config.economy_spellmerchant_diff / 10000
  end

  -- UI Expansion integration
  local menu = e.element
  local MenuServiceSpells_ServiceList = menu:findChild("MenuServiceSpells_ServiceList")
  if not MenuServiceSpells_ServiceList then return end
  local MenuServiceSpells_ServiceList_PartScrollPane_pane = MenuServiceSpells_ServiceList:findChild("PartScrollPane_pane")
  if not MenuServiceSpells_ServiceList_PartScrollPane_pane then return end
  local MenuServiceSpells_Spell = tes3ui.registerProperty("MenuServiceSpells_Spell")
  local serviceSpells = {} --- @type tes3spell[]
  for _, child in ipairs(MenuServiceSpells_ServiceList_PartScrollPane_pane.children) do
    table.insert(serviceSpells, child:getPropertyObject(MenuServiceSpells_Spell))
  end

  local knownEffects = Known_Effects.getKnownEffectsTable(tes3.mobilePlayer)

  -- my stuff
  local all_spells = e.element:findChild("MenuServiceSpells_ServiceList")
  if not all_spells then return end
  local names_pane = all_spells:findChild("PartScrollPane_pane")
  if not names_pane then return end
  local names = names_pane.children
  local service_text = {base_texts = {}, gold_texts = {}, cost_texts = {}, chance_texts = {}}
  local service_chances = {}
  local gold_costs = {}
  -- The click handlers get their spell from the row's property, so they look the price up by id.
  local gold_costs_by_id = {}
  local service_school = {}

  -- process spells
  for i=1, #serviceSpells do
    local spell = serviceSpells[i]
    local spell_id = spell.id

    local spell_cost = 0
    local spell_chance = 0
    local skill_for_spell = 0

    local storage_result = SM.get_or_calculate(spell, premade_spells, true, tes3.mobilePlayer)
    if storage_result then
      spell_cost = storage_result.cost
      skill_for_spell = storage_result.skill_for_spell
    end

    if spell_cost > 0 then
      log:trace("Spell processed. ID: %s. Your skill for this spell: %d", spell_id, skill_for_spell)
      spell_chance = calculate_cast_chance(spell_cost, tes3.mobilePlayer.willpower.current, tes3.mobilePlayer.luck.current, skill_for_spell)

      local cost_text = tostring (math.floor(spell_cost))
      gold_costs[spell] = math.floor(spell_cost * config.economy_spellmerchant_mult * disp_factor)
      local gold_text = tostring (gold_costs[spell])
      if custom_price_spells[spell_id] then
        gold_costs[spell] = math.floor(custom_price_spells[spell_id].cost * disp_factor)
        gold_text = tostring (gold_costs[spell])
      end
      gold_costs_by_id[spell_id] = gold_costs[spell]
      -- The same rules a cast applies.
      local deterministic = Formulas.is_deterministic(spell)
      local chance_text
      if deterministic then
        chance_text = tostring(Formulas.mastery(spell_chance, spell))
        -- Mastery stops at 100, so sorting and the uncastable colour use the chance behind it.
        spell_chance = Formulas.base_chance(spell_chance, spell)
      else
        spell_chance = Formulas.final_cast_chance(spell_chance, spell, true)
        chance_text = tostring(math.floor(spell_chance))
      end

      local chance_label = deterministic and "Mastery" or "Cast Chance"
      names[i].text = tostring(spell.name) .. " | " .. gold_text .. " Gold | " .. cost_text .. " Base Cost | " .. chance_text .. " " .. chance_label
      if not (config.ui_extended_spell_merchant) then
        service_text.base_texts[spell] = names[i].text
      else
        service_text.base_texts[spell] = tostring(spell.name)
      end

      service_chances[spell] = spell_chance

      local max_school = {value = 0, school = 0}
      local stored_spell = tes3.player.data.motte_spell_storage[spell_id]
      if stored_spell then
        for k=1, 6 do
          if max_school.value < stored_spell.skill_table[k] then
            max_school.value = stored_spell.skill_table[k]
            max_school.school = k - 1  -- convert +1 packed index back to raw school index (0-5)
          end
        end
      end

      service_school[spell] = max_school.school
      service_text.gold_texts[spell] = gold_text .. " Gold"
      service_text.cost_texts[spell] = cost_text .. " Base Cost"
      service_text.chance_texts[spell] = chance_text .. " " .. chance_label

    end
  end

  menu.width = 750

  -- Only sort spells that were processed (have a gold cost entry).
  -- Spells with zero calculated cost have no entry in any lookup table and are excluded.
  local sortable = {}
  for _, spell in ipairs(serviceSpells) do
    if gold_costs[spell] then
      table.insert(sortable, spell)
    end
  end

  if config.ui_spell_merchant_sort == 1 then
    table.sort(sortable, function(a, b) return a.name < b.name end)
  elseif config.ui_spell_merchant_sort == 2 then
    table.sort(sortable, function(a, b) return gold_costs[a] < gold_costs[b] end)
  elseif config.ui_spell_merchant_sort == 3 then
    table.sort(sortable, function(a, b) return service_chances[a] > service_chances[b] end)
  elseif config.ui_spell_merchant_sort == 4 then
    table.sort(sortable, function(a, b)
      local sa, sb = service_school[a], service_school[b]
      return sa < sb or (sa == sb and a.name < b.name)
    end)
  elseif config.ui_spell_merchant_sort == 5 then
    table.sort(sortable, function(a, b)
      local sa, sb = service_school[a], service_school[b]
      return sa < sb or (sa == sb and gold_costs[a] < gold_costs[b])
    end)
  end
  serviceSpells = sortable

  -- UI Expansion strikes again

  MenuServiceSpells_ServiceList_PartScrollPane_pane:destroyChildren()
  MenuServiceSpells_ServiceList_PartScrollPane_pane.flowDirection = "left_to_right"
  local MenuServiceSpells_Icons = MenuServiceSpells_ServiceList_PartScrollPane_pane:createBlock({ id = "MenuServiceSpells_Icons" })
  MenuServiceSpells_Icons.flowDirection = "top_to_bottom"
  MenuServiceSpells_Icons.autoWidth = true
  MenuServiceSpells_Icons.autoHeight = true
  MenuServiceSpells_Icons.paddingRight = 4
  MenuServiceSpells_Icons.paddingLeft = 2
  local MenuServiceSpells_Spells = MenuServiceSpells_ServiceList_PartScrollPane_pane:createBlock({ id = "MenuServiceSpells_Spells" })
  MenuServiceSpells_Spells.flowDirection = "top_to_bottom"
  if config.ui_extended_spell_merchant then
    MenuServiceSpells_Spells.width = 300
  else
    MenuServiceSpells_Spells.autoWidth = true
  end
  MenuServiceSpells_Spells.autoHeight = true

  local MenuServiceSpells_Gold
  local MenuServiceSpells_Cost
  local MenuServiceSpells_Chance

  if config.ui_extended_spell_merchant then
    MenuServiceSpells_Gold = MenuServiceSpells_ServiceList_PartScrollPane_pane:createBlock({ id = "MenuServiceSpells_Gold" })
    MenuServiceSpells_Gold.flowDirection = "top_to_bottom"
    MenuServiceSpells_Gold.width = 90
    MenuServiceSpells_Gold.autoHeight = true
    MenuServiceSpells_Cost = MenuServiceSpells_ServiceList_PartScrollPane_pane:createBlock({ id = "MenuServiceSpells_Cost" })
    MenuServiceSpells_Cost.flowDirection = "top_to_bottom"
    MenuServiceSpells_Cost.width = 120
    MenuServiceSpells_Cost.autoHeight = true
    MenuServiceSpells_Chance = MenuServiceSpells_ServiceList_PartScrollPane_pane:createBlock({ id = "MenuServiceSpells_Chance" })
    MenuServiceSpells_Chance.flowDirection = "top_to_bottom"
    MenuServiceSpells_Chance.autoHeight = true
    MenuServiceSpells_Chance.autoWidth = true
  end

  local GUI_ID_MenuServiceSpells_Icon = tes3ui.registerID("MenuServiceSpells_Icon")
  local GUI_ID_MenuServiceSpells_Spell = tes3ui.registerID("MenuServiceSpells_Spell")

  local GUI_ID_MenuServiceSpells_Gold
  local GUI_ID_MenuServiceSpells_Cost
  local GUI_ID_MenuServiceSpells_Chance

  if config.ui_extended_spell_merchant then
    GUI_ID_MenuServiceSpells_Gold = tes3ui.registerID("MenuServiceSpells_Gold")
    GUI_ID_MenuServiceSpells_Cost = tes3ui.registerID("MenuServiceSpells_Cost")
    GUI_ID_MenuServiceSpells_Chance = tes3ui.registerID("MenuServiceSpells_Chance")
  end

  local MenuServiceSpells_Spell_Click = 0x616690
  local MenuServiceSpells_Spell_Help = 0x616810

  -- colors
  local new_effect_color = tes3ui.getPalette("link_color")
  local uncastable_color = {1, 0.2, 0.2}

  -- Fill out the service list.
  for _, spell in ipairs(serviceSpells) do
    -- Create an icon for usability/prettiness.
    local icon = MenuServiceSpells_Icons:createImage({ id = GUI_ID_MenuServiceSpells_Icon, path = string.format("icons\\%s", spell.effects[1].object.icon) })
    icon.borderTop = 2
    icon:setPropertyObject("MenuServiceSpells_Spell", spell)
    icon:register("mouseClick", MenuServiceSpells_Spell_Click)
    icon:register("help", MenuServiceSpells_Spell_Help)


    -- Reimplement text
    local label = MenuServiceSpells_Spells:createTextSelect({ id = GUI_ID_MenuServiceSpells_Spell, text = service_text.base_texts[spell] })
    label:setPropertyObject("MenuServiceSpells_Spell", spell)
    label:register("mouseClick", MenuServiceSpells_Spell_Click)
    label:register("help", MenuServiceSpells_Spell_Help)

    if gold_costs[spell] > gold_amount then
      label.disabled = true
      label.widget.state = 2
    elseif service_chances[spell] <= 60 then
      label.widget.state = 4
      label.widget.idleActive = uncastable_color
    elseif (not Known_Effects.getKnowsAllSpellEffects(knownEffects, spell)) then
      -- Known effect? Make it blue.
      label.widget.state = 4
      label.widget.idleActive = new_effect_color
    end

    -- moar text
    if config.ui_extended_spell_merchant then
      label = MenuServiceSpells_Gold:createTextSelect({ id = GUI_ID_MenuServiceSpells_Gold, text = service_text.gold_texts[spell] })
      label:setPropertyObject("MenuServiceSpells_Spell", spell)

      label = MenuServiceSpells_Cost:createTextSelect({ id = GUI_ID_MenuServiceSpells_Cost, text = service_text.cost_texts[spell] })
      label:setPropertyObject("MenuServiceSpells_Spell", spell)

      label = MenuServiceSpells_Chance:createTextSelect({ id = GUI_ID_MenuServiceSpells_Chance, text = service_text.chance_texts[spell] })
      label:setPropertyObject("MenuServiceSpells_Spell", spell)
    end

  end
  menu:updateLayout()

  -- block if you don't have the gold
  -- note that only names and icons are clickable

  local upd_names = menu:findChild("MenuServiceSpells_Spells").children
  local upd_icons = menu:findChild("MenuServiceSpells_Icons").children
  for _, item in ipairs(upd_icons) do
    table.insert(upd_names, item)
  end

  for i=1, #upd_names do
    upd_names[i]:registerBefore(tes3.uiEvent.mouseClick,
        function(_)
          local spell = upd_names[i]:getPropertyObject("MenuServiceSpells_Spell")
          -- The price shown in the list is the price charged.
          local gold_cost = gold_costs_by_id[spell.id]
          if not gold_cost then
            log:error("Spell %s, which you attempt to purchase, has no price. This should not happen.", spell.id)
            return false -- without a price the spell is not sold
          end
          if tes3.getPlayerGold() < gold_cost then
            tes3.messageBox("You don't have enough gold to purchase this spell.")
            return false -- this will prevent the regular mouseclick event from being run
          else
            tes3.removeItem({reference = tes3.player, item = "gold_001", count = gold_cost})
            tes3.addItem({reference = service_actor, item = "gold_001", count = gold_cost})
            service_actor.barterGold = service_actor.barterGold + gold_cost
          end
        end
      )
  end

  --end)
end

-- Tamriel_Data's Fortify Casting and Blood Magic, when it is installed. Its cast handlers
-- run after MOTTE's (see cast_events.lua): Fortify Casting adds its magnitude to MOTTE's
-- chance and Blood Magic halves MOTTE's cost, so the UI applies them the same way.
---@param mobile tes3mobilePlayer
---@return number fortify  Summed magnitude of Fortify Casting.
---@return boolean blood_magic
---@return boolean active  Either effect is present. Tamriel_Data writes the chance column
---                        whenever one is, even before its magnitude is resolved.
local function td_casting_effects(mobile)
  local fortify, fortify_count, blood_magic = 0, 0, false
  local fortify_id = tes3.effect.T_restoration_FortifyCasting
  if fortify_id then
    local effects = mobile:getActiveMagicEffects({ effect = fortify_id })
    fortify_count = #effects
    for _, active in pairs(effects) do
      fortify = fortify + active.magnitude
    end
  end
  local blood_magic_id = tes3.effect.T_mysticism_BloodMagic
  if blood_magic_id then
    blood_magic = #mobile:getActiveMagicEffects({ effect = blood_magic_id }) > 0
  end
  return fortify, blood_magic, fortify_count > 0 or blood_magic
end

--- The player's state a spell's chance depends on, read once per update.
---@param mobile tes3mobilePlayer
local function chance_context(mobile)
  local fortify, blood_magic, td_active = td_casting_effects(mobile)
  return {
    mobile = mobile,
    storage = tes3.player.data.motte_spell_storage,
    willpower = mobile.willpower.current,
    luck = mobile.luck.current,
    skills = {
      mobile.alteration.current, mobile.conjuration.current, mobile.destruction.current,
      mobile.illusion.current, mobile.mysticism.current, mobile.restoration.current,
    },
    fortify = fortify,
    blood_magic = blood_magic,
    td_active = td_active,
  }
end

--- The stored cost and the raw chance of a spell for the player, or nil if MOTTE has no cost for it.
---@param spell tes3spell
---@return number? cost
---@return number? raw_chance
local function stored_cost_and_chance(spell, ctx)
  local cost, skill_for_spell
  local data = ctx.storage[spell.id]
  local t = data and data.skill_table
  if t and t[1] and t[2] and t[3] and t[4] and t[5] and t[6] then
    local s = ctx.skills
    cost = data.cost
    skill_for_spell = t[1] * s[1] + t[2] * s[2] + t[3] * s[3] + t[4] * s[4] + t[5] * s[5] + t[6] * s[6]
  else
    -- Not stored yet (or corrupt): calculate and store it.
    local result = SM.get_or_calculate(spell, premade_spells, true, ctx.mobile)
    if not result then return nil end
    cost, skill_for_spell = result.cost, result.skill_for_spell
  end
  if cost <= 0 then return nil end
  return cost, calculate_cast_chance(cost, ctx.willpower, ctx.luck, skill_for_spell)
end

--- The chance a cast will roll: MOTTE's rules, then Tamriel_Data's Fortify Casting.
---@param spell tes3spell
---@param raw_chance number
local function applied_chance(spell, raw_chance, ctx)
  local chance = Formulas.final_cast_chance(raw_chance, spell, true) + ctx.fortify
  return math.max(0, math.min(chance, 100))
end

--- The magicka a cast will take: rounded like the cast handler, then halved by Blood Magic.
---@param cost number  Stored cost.
local function applied_cost(cost, ctx)
  local applied = math.round(cost * ctx.cost_mult)
  if ctx.blood_magic then
    applied = math.floor(applied / 2)
  end
  return applied
end

-- Birthsign spells keep their vanilla cost and chance when the setting is on: the cast
-- handlers leave them to the engine, and Tamriel_Data's effects still apply on top.
---@param spell tes3spell
local function vanilla_cost(spell, ctx)
  local cost = spell.magickaCost
  if ctx.blood_magic then
    cost = math.floor(cost / 2)
  end
  return cost
end

---@param spell tes3spell
local function vanilla_chance(spell, ctx)
  local chance = spell:calculateCastChance({ caster = tes3.player, checkMagicka = false }) + ctx.fortify
  return math.floor(math.max(0, math.min(chance, 100)))
end

-------------------------------------------------------------------------------
-- Magic menu: cost and chance columns
-------------------------------------------------------------------------------

-- The menu updates on every scroll step, so a full refresh (every spell) only runs
-- when something the numbers depend on changed. Scrolling changes none of it.

-- Set on the first and last row once refreshed; the engine drops it when it recreates the rows.
local PROP_Refreshed = "MOTTE:MagicMenu:Refreshed"
local last_refresh = { key = nil, first = nil, last = nil }

-- The cost and chance text of a row, to notice other code rewriting them.
local function row_text(costs, chances, i)
  return costs[i].text .. chances[i].text
end

--- Everything the shown numbers depend on besides the stored spell data.
local function refresh_key(ctx)
  local s = ctx.skills
  return table.concat({
    ctx.willpower, ctx.luck, s[1], s[2], s[3], s[4], s[5], s[6], ctx.cost_mult,
    ctx.fortify, tostring(ctx.blood_magic),
    config.determinism_mode, config.flat_chance_bonus, config.chance_formula, config.willpower_softcap,
    tostring(config.override_chances_alwaystosucceed), tostring(config.override_costs_alwaystosucceed),
    config.sa_cut_in_value, config.sa_fulcrum_value, config.sa_cut_off_value,
    config.sa_base_probability, config.sa_chance_step, tostring(config.skip_birthsign_spells),
  }, "|")
end

--- True if these are the rows last refreshed and they still show what was written.
local function rows_unchanged(names, costs, chances)
  local n = #names
  if n == 0 or n ~= #costs or n ~= #chances then return false end
  if not (names[1]:getPropertyBool(PROP_Refreshed) and names[n]:getPropertyBool(PROP_Refreshed)) then
    return false
  end
  return row_text(costs, chances, 1) == last_refresh.first and row_text(costs, chances, n) == last_refresh.last
end

---@param e tes3uiEventData
local function refresh_magic_menu(e)
  local mobile = tes3.mobilePlayer
  if not mobile then return end
  local menu = e.source
  local names = menu:findChild("MagicMenu_spell_names").children
  local costs = menu:findChild("MagicMenu_spell_costs").children
  local chances = menu:findChild("MagicMenu_spell_percents").children

  local ctx = chance_context(mobile)
  ctx.cost_mult = Formulas.cost_multiplier(mobile, tes3.player.object.objectType == tes3.objectType.npc, true)
  local key = refresh_key(ctx)
  -- Tamriel_Data rewrites the chance column on every update while its effects are active.
  if not ctx.td_active and key == last_refresh.key and rows_unchanged(names, costs, chances) then
    return
  end

  local cost_title = menu:findChild("MagicMenu_spell_cost_title")
  if cost_title then
    set_text(cost_title, (config.determinism_mode == 2) and "Cost/Mastery" or "Cost/Chance")
  end

  for i = 1, #names do
    local spell = names[i]:getPropertyObject("MagicMenu_Spell")
    if Formulas.is_birthsign_spell(spell) then
      set_text(costs[i], tostring(vanilla_cost(spell, ctx)))
      set_text(chances[i], "/" .. tostring(vanilla_chance(spell, ctx)))
    else
      local cost, raw_chance = stored_cost_and_chance(spell, ctx)
      if cost and raw_chance then
        set_text(costs[i], tostring(applied_cost(cost, ctx)))
        -- Deterministic spells show mastery: how close the spell is to always succeeding.
        if Formulas.is_deterministic(spell) then
          set_text(chances[i], "/" .. tostring(Formulas.mastery(raw_chance, spell)))
        else
          set_text(chances[i], "/" .. tostring(math.floor(applied_chance(spell, raw_chance, ctx))))
        end
      end
    end
  end

  local n = #names
  if n > 0 then
    names[1]:setPropertyBool(PROP_Refreshed, true)
    names[n]:setPropertyBool(PROP_Refreshed, true)
    last_refresh.first, last_refresh.last = row_text(costs, chances, 1), row_text(costs, chances, n)
  end
  last_refresh.key = key
end

-- Runs after other mods' handlers (Tamriel_Data writes the chance column too), so MOTTE's numbers are the ones shown.
local UI_PRIORITY = -10

---@param e uiActivatedEventData
local function magic_menu_update(e)
  if not e.newlyCreated then return end
  e.element:registerAfter(tes3.uiEvent.preUpdate, refresh_magic_menu, UI_PRIORITY)
end

-------------------------------------------------------------------------------
-- HUD: magic fill bar
-------------------------------------------------------------------------------

--- The fill bar under the HUD's magic icon shows the chance a cast of the selected spell will roll.
---@param e tes3uiEventData
local function refresh_magic_fill(e)
  local mobile = tes3.mobilePlayer
  if not mobile then return end
  local fill = e.source:findChild("MenuMulti_magic_fill")
  local icon = e.source:findChild("MenuMulti_magic_icon")
  if not (fill and icon) then return end
  local spell = icon:getPropertyObject("MagicMenu_Spell")
  if not spell or spell.castType ~= tes3.spellType.spell then return end

  local ctx = chance_context(mobile)
  local chance
  if Formulas.is_birthsign_spell(spell) then
    chance = vanilla_chance(spell, ctx)
  else
    local _, raw_chance = stored_cost_and_chance(spell, ctx)
    if not raw_chance then return end
    chance = math.floor(applied_chance(spell, raw_chance, ctx))
  end

  -- Set on every update: the engine and Tamriel_Data both set this bar too.
  fill.widget.max = 100
  fill.widget.current = chance
  fill:updateLayout()
end

---@param e uiActivatedEventData
local function hud_update(e)
  if not e.newlyCreated then return end
  e.element:registerAfter(tes3.uiEvent.preUpdate, refresh_magic_fill, UI_PRIORITY)
end

-------------------------------------------------------------------------------

local M = {}

function M.register()
  event.register("uiActivated", magic_menu_update,    { filter = "MenuMagic" })
  event.register("uiActivated", hud_update,           { filter = "MenuMulti" })
  event.register("uiActivated", spellmaking_block,    { filter = "MenuSpellmaking" })
  event.register("uiActivated", spellmerchant_update, { filter = "MenuServiceSpells" })
  -- Spells created by scripts fire this event too. Only the spellmaking menu charges gold.
  event.register("spellCreated", spellmaking_payment, { filter = tes3.spellSource.service })
  event.register(tes3.event.calcSpellmakingSpellPointCost, spellmaker_update)
end

return M
