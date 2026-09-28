-- modules/cast_events.lua
-- Event handlers for spell casting: chance manipulation, cost manipulation, and experience gain.

local config  = require("Magicka of the Third Era.config")
local SM      = require("Magicka of the Third Era.modules.spell_manager")
local Formulas = require("Magicka of the Third Era.modules.formulas")

local premade_spells           = require("Magicka of the Third Era.data.premade_spells")

local log = mwse.Logger.new{ modName = "Magicka of the Third Era", logLevel = config.log_level }

-- MOTTE sets the chance and cost outright, so it runs before other mods' handlers,
-- which then adjust MOTTE's values (e.g. Tamriel_Data's Fortify Casting adds to the
-- chance, its Blood Magic halves the cost). At equal priorities the order is not fixed.
local CAST_PRIORITY = 10

-------------------------------------------------------------------------------

-- Hybrid mode divides by the gaps between these sliders, so fix invalid settings before use.
local function validate_hybrid_config()
  if config.sa_cut_in_value >= config.sa_fulcrum_value then
    config.sa_cut_in_value = 50
    config.sa_fulcrum_value = 60
    tes3.messageBox("[Magicka of the Third Era] Cut-in value must be lower than the fulcrum. Reverted to defaults.")
  end
  if config.sa_fulcrum_value >= config.sa_cut_off_value then
    config.sa_fulcrum_value = 60
    config.sa_cut_off_value = 65
    tes3.messageBox("[Magicka of the Third Era] Fulcrum value must be lower than the cut-off. Reverted to defaults.")
  end
end

---@param e spellCastEventData
local function spell_chance_manipulation(e)
  -- disable for non-spells
  if e.source.castType ~= tes3.spellType.spell then
    return
  end
  if Formulas.is_birthsign_spell(e.source) then
    log:trace("Spell %s is a birthsign spell. Skipping chance recalculation.", e.source.id)
    return
  end
  local caster = e.caster.object.mobile
  local spell_id = e.source.id

  -- The storage is filled when spells are shown in a menu or first used; the magicka use event runs get_or_calculate.
  local chance = e.castChance
  local spell_data = tes3.player.data.motte_spell_storage[spell_id]
  if spell_data then
    local skill_for_spell
    if caster.alteration and caster.conjuration and caster.destruction and caster.illusion and caster.mysticism and caster.restoration then
      skill_for_spell = SM.compute_skill(spell_data.skill_table, caster)
    else
      skill_for_spell = 9999 -- creature casters
    end
    chance = Formulas.calculate_cast_chance(spell_data.cost, caster.willpower.current, caster.luck.current, skill_for_spell)
    log:trace("Spell %s: cost %.2f, skill for spell %d, raw chance %d.", spell_id, spell_data.cost, skill_for_spell, chance)
  else
    log:error("Spell %s should have been calculated but wasn't. This is an error, let me know the scenario how this did happen.", spell_id)
  end

  if config.determinism_mode == 3 then
    validate_hybrid_config()
  end
  e.castChance = Formulas.final_cast_chance(chance, e.source, caster == tes3.mobilePlayer)
  log:trace("Spell %s: cast chance after MOTTE's rules %d.", spell_id, e.castChance)
end

---@param e spellMagickaUseEventData
local function spell_cost_manipulation(e)
  -- disable for non-spells
  if e.spell.castType ~= tes3.spellType.spell then
    return
  end
  if Formulas.is_birthsign_spell(e.spell) then
    log:trace("Spell %s is a birthsign spell. Skipping cost recalculation.", e.spell.id)
    return
  end
  local caster = e.caster.object.mobile
  local is_player = caster == tes3.mobilePlayer

  local storage_result = SM.get_or_calculate(e.spell, premade_spells, false, caster)
  if not storage_result then
    -- MOTTE has no cost for this spell. The magic menu shows the vanilla cost for it, so charge that.
    log:debug("Spell %s has no calculated cost. Keeping the vanilla cost of %d.", e.spell.id, e.cost)
    return
  end
  local spell_cost = storage_result.cost * Formulas.cost_multiplier(caster, e.caster.object.objectType == tes3.objectType.npc, is_player)

  -- We need to help dumb NPC AI to handle new costs. I think they fail to cast at low magicka: they cast the spell thinking it costs the old cost (cheaper). They repeat this process, constantly failing at this stage.
  -- The alternative is to rewrite the entire AI so deal with it
  if not is_player and config.npc_assist and caster.magicka.current < spell_cost then
    log:debug("NPC casting this spell has magicka of %.2f. However, spell costs %.2f. Spell discounted to magicka - 0.5 to help the AI handle this.", caster.magicka.current, spell_cost)
    spell_cost = math.max(caster.magicka.current - 0.5, 0)
    -- This should allow this spell to be cast one last time before NPC will have almost no magicka and switch to something else. Seems to work after testing
  end
  e.cost = math.round(spell_cost)

  log:trace("Resulting cost for spell: %.2f. Cost calculation stage is finished.", e.cost)
end

-- The schools in the order of a stored skill table, with the skill each one trains
-- and the setting that scales its experience.
local school_training = {
  { skill = "alteration",  rate = "leveling_rate_alteration" },
  { skill = "conjuration", rate = "leveling_rate_conjuration" },
  { skill = "destruction", rate = "leveling_rate_destruction" },
  { skill = "illusion",    rate = "leveling_rate_illusion" },
  { skill = "mysticism",   rate = "leveling_rate_mysticism" },
  { skill = "restoration", rate = "leveling_rate_restoration" },
}
-- Spell cost that gives one point of experience, before the leveling rates apply.
local EXPERIENCE_DIVIDER = 7.5
-- A skill at or above this only gains experience with Uncapped Leveling.
local SKILL_CAP = 100

---@param e spellCastedEventData
local function exp_gain(e)
  if (not tes3.player) or (e.caster ~= tes3.player) then return end

  local caster = e.caster.mobile
  if not(config.experience_gain) or e.source.castType ~= tes3.spellType.spell then
    return
  end
  ---@cast caster tes3mobilePlayer

  local spell_id = e.source.id
  local school = tes3.magicSchoolSkill[e.expGainSchool]
  -- Disable vanilla exp gain
  e.expGainSchool = tes3.magicSchool.none
  local spell_data = tes3.player.data.motte_spell_storage[spell_id]
  if spell_data then
    -- if spell is in the DB, where it should be.
    for i, training in ipairs(school_training) do
      if caster[training.skill].base < SKILL_CAP or config.leveling_uncapped then
        caster:exerciseSkill(tes3.skill[training.skill],
          spell_data.cost * spell_data.skill_table[i] / EXPERIENCE_DIVIDER * config.leveling_rate_global / 100 * config[training.rate] / 100)
      end
    end
  else
    -- If spell is not in the DB for some reason.
    log:warn("Spell %s not found in database! Using simplified approach.", spell_id)
    caster:exerciseSkill(school, e.source.magickaCost / EXPERIENCE_DIVIDER * config.leveling_rate_global / 100)
  end
end

-------------------------------------------------------------------------------

local M = {}

function M.register()
  event.register("spellCast",       spell_chance_manipulation, { priority = CAST_PRIORITY })
  event.register("spellMagickaUse", spell_cost_manipulation,   { priority = CAST_PRIORITY })
  event.register("spellCasted",     exp_gain)
end

return M
