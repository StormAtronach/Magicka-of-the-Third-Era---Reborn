
-- main.lua
-- Bootstrap: registers events, writes the game data, manages spell storage and Magicka Expanded distribution.
--
-- Module map:
--   modules/cast_events.lua      spellCast / spellMagickaUse / spellCasted handlers
--   modules/ui.lua               spellmaker, spell merchant, and magic menu UI
--   modules/formulas.lua         pure math: cast chance, armor coefficient breakdown
--   modules/spell_manager.lua    spell cost computation, synergy detection, spell storage cache
--   modules/known_effects.lua    tracks which spell effects the player has seen (UI highlight)
--   modules/mcm.lua              Mod Configuration Menu
--   modules/game_data.lua        writes the data below into the game's records
--   effect_mechanics.lua         Calm, Frenzy, Rally and Demoralize work by the target's level
--
-- Data (static, read-only):
--   data/premade_spells.lua      vanilla/DLC spell IDs (skips re-calculation)
--   data/custom_price_spells.lua gold price overrides for spells with no meaningful base cost
--   data/determinist_effects.lua effect IDs forced deterministic under semi-determinism mode (1)
--   data/spell_table.lua         base cost table per effect
--   data/synergy_table.lua       synergy discount rules for multi-effect spells
--   data/me_distribution.lua     Magicka Expanded spell-to-merchant distribution map
--
-- Data written into the game's records, which the original mod kept in a plugin:
--   data/magic_effects.lua       base costs, what spellmakers and enchanters offer, descriptions
--   data/spells.lua              the spells the mod changes or adds
--   data/enchantments.lua        the scroll enchantments the mod changes
--   data/merchants.lua           spells and items NPCs gain or lose
--   data/synergy_book.lua        the book on synergies and where it turns up

local config = require("Magicka of the Third Era.config")
local log = mwse.Logger.new{
    modName = "Magicka of the Third Era",
    logLevel = config.log_level,
}
local UI           = require("Magicka of the Third Era.modules.ui")
local CastEvents   = require("Magicka of the Third Era.modules.cast_events")
local SpellManager = require("Magicka of the Third Era.modules.spell_manager")
local GameData     = require("Magicka of the Third Era.modules.game_data")

-- Registers its own events.
require("Magicka of the Third Era.effect_mechanics")

--[[ (WIP, not yet active)
local New_Effects      = require("Magicka of the Third Era.modules.new_effects")
]]


local version = "2.0"

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Spell storage.
local function load_storage()
  SpellManager.prepare_storage(version)
end

-- ME Stuff

local me_known_packs = {"lore_friendly", "summoning", "teleportation", "tr", "weather", "cortex"}

local me_packs = {lore_friendly = false, summoning = false, teleportation = false, tr = false, weather = false, cortex = false}

local me_distribution = require("Magicka of the Third Era.data.me_distribution")
local function magicka_expanded_spells()

  if not config.distribute_magicka_expanded_spells then return end

  log:trace("Looking for Magicka Expanded Spell Packs...")
  -- I don't know if it's a good way to make sure ME creates spells before this check applies
  timer.start{type = timer.real, duration = 3, callback = function()

    if tes3.getObject('OJ_ME_BanishDaedraSpell') then
      log:trace("ME Packs: Found Lore-Friendly Pack!")
      me_packs.lore_friendly = true
    end
    if tes3.getObject('OJ_ME_SummWarDurzogSpell') then
      log:trace("ME Packs: Found Summoning Pack!")
      me_packs.summoning = true
    end
    if tes3.getObject('OJ_ME_TeleportToAldRuhn') then
      log:trace("ME Packs: Found Teleportation Pack!")
      me_packs.teleportation = true
    end
    if tes3.getObject('OJ_ME_TeleportToAkamora') then
      log:trace("ME Packs: Found TR Pack!")
      me_packs.tr = true
    end
    if tes3.getObject('OJ_ME_WeatherBlizzard') then
      log:trace("ME Packs: Found Weather Pack!")
      me_packs.weather = true
    end
    if tes3.getObject('OJ_ME_BlinkSpell') then
      log:trace("ME Packs: Found Cortex Pack!")
      me_packs.cortex = true
    end

    -- distribute spells to merchants, using same logic as Enhanced Detection (thanks for the code!)
    for _, pack_name in ipairs(me_known_packs) do
      if me_packs[pack_name] then
        log:trace(string.format("Distributing spells from the %s pack...", pack_name))

        for npc_id, dist_spell_id in pairs(me_distribution[pack_name]) do
          local npc = tes3.getObject(npc_id)
          ---@cast npc tes3npc
          if (npc) then
            if (type(dist_spell_id) ~= "table") then
              local spell = tes3.getObject(dist_spell_id)
              ---@cast spell tes3spell
              if (spell) then
                tes3.addSpell({ actor = npc, spell = spell })
              end
            else
              for _, spell_id in pairs(dist_spell_id) do
                local spell = tes3.getObject(spell_id)
                ---@cast spell tes3spell
                if (spell) then
                  tes3.addSpell({ actor = npc, spell = spell })
                end
              end
            end
          end
        end
      end
    end


  end}
end

local function initialized()
  UI.register()
  CastEvents.register()

  event.register(tes3.event.loaded, load_storage)
  event.register(tes3.event.loaded, magicka_expanded_spells)
  event.register(tes3.event.loaded, GameData.apply_after_load)
  -- Disable vanilla spellmaking value and spellprice mechanics, if mods enable it again via script, it won't be pretty.
  tes3.findGMST("fSpellMakingValueMult").value = 0
  tes3.findGMST("fSpellValueMult").value = 0

  --if is_mod_installed("ui expansion") then
  --  local ui_cfg = mwse.loadConfig("ui expansion", {components={serviceSpells=false}})
  --  ui_cfg.components.serviceSpells = false
  --  log:trace(ui_cfg.components.serviceSpells)
  --  mwse.saveConfig("UI Expansion", ui_cfg)
  --  log:trace("Disabling spell services menu component from UI Expansion.")
  --end
  print(string.format("[Vengyre] Magicka of the Third Era initialized. Version: %s.", version))
end

local function override_uiexpansion()
  local ui_common = include("ui expansion.common")
  if ui_common then
    if ui_common.config.components.serviceSpells == true then
      log:trace("Disabling spell services menu component from UI Expansion.")
      ui_common.config.components.serviceSpells = false
    end
  end
end

event.register("initialized", override_uiexpansion, { priority = 99 })
event.register("initialized", initialized)
-- The original's plugin had its records in the game before any Lua ran.
-- The data takes the same place, ahead of the handlers of other mods.
event.register("magicEffectsResolved", GameData.apply_magic, { priority = 1000 })
event.register("initialized", GameData.apply_world, { priority = 1000 })

-- MCM --

local function modConfigReady()
  require("Magicka of the Third Era.modules.mcm")
end
event.register('modConfigReady', modConfigReady)
