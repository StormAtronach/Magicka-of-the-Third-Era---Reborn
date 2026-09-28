-- modules/formulas.lua
-- Pure stateless computation: cast chance formula, the rules applied on top of it,
-- spell cost multipliers and armor coefficient breakdown.
-- The cast handlers and the UI both use these, so what the UI shows is what a cast applies.

local config = require("Magicka of the Third Era.config")
local determinist_effect_table = require("Magicka of the Third Era.data.determinist_effects")

-- Set form of determinist_effect_table for constant-time lookups.
local determinist_effect_set = {}
for _, effect_id in ipairs(determinist_effect_table) do
  determinist_effect_set[effect_id] = true
end

-- Coefficients of the cast chance formulas, by the Chance Calculation Formula setting.
-- Two formulas remain from an earlier three-formula set (the middle "Exp v1.2" was removed):
--   2, "Almost Flat" (originally v1.0): higher base chance, lower skill scaling, less punishing
--      cost exponent. Compresses the range between low-skill and high-skill builds.
--   3, "Complex" / Baseline (originally described as "Exp v1.2 with skill-curve tweaks"): steeper
--      skill scaling, more differentiation between builds. Recommended.
-- Any other setting uses the baseline.
local chance_formulas = {
  [2] = { flat = 40, willpower = 0.2, luck = 0.12, cost_exponent = 1.21, skill = 0.83 },
  [3] = { flat = 22, willpower = 0.4, luck = 0.25, cost_exponent = 1.4, skill = 1.65 },
}

-- A deterministic spell succeeds when its chance is above this. Mastery shows the chance as a share of it.
local CAST_THRESHOLD = 60
-- Sound raises costs by this share per point of magnitude.
local SOUND_COST_PER_POINT = 0.05
-- Magicka above this makes the player's spells cost more, see Overflowing Magicka.
local OVERFLOW_THRESHOLD = 100

-- The armor totals of get_armor_coefs, by the weight class of an item.
local weight_classes = { [0] = "light", [1] = "medium", [2] = "heavy" }

-- Share of the armor penalty each slot carries.
-- Thanks to nimble armor mod for this, using its values for now
local armorParts = {
  [0] = 0.1, -- helmet
  [1] = 0.25, -- cuirass
  [2] = 0.05, -- left pauldron
  [3] = 0.05, -- right pauldron
  [4] = 0.15, -- greaves
  [5] = 0.15, -- boots
  [6] = 0.05, -- left gauntlet
  [7] = 0.05, -- right gauntlet
  [8] = 0.15, -- shield
  -- [9] = 0.05, -- left bracer uses the same value as left gauntlet
  -- [10] = 0.05 -- right bracer uses the same value as right gauntlet
}

local function get_armor_coefs(armored_actor)
  local armor = {light = 0, medium = 0, heavy = 0}
  if armored_actor == nil then -- check for disabled actors
    return armor
  end
  for i, value in pairs(armorParts) do
    local stack = tes3.getEquippedItem{actor = armored_actor, objectType = tes3.objectType.armor, slot = i}
    if i == tes3.armorSlot.leftGauntlet or i == tes3.armorSlot.rightGauntlet then -- if no gloves - check for bracers
      if not stack then stack = tes3.getEquippedItem{actor = armored_actor, objectType = tes3.objectType.armor, slot = i+3} end
    end
    if stack then
      local class = weight_classes[stack.object.weightClass]
      if class then
        armor[class] = armor[class] + value
      end
    end
  end
  return armor
end

local function calculate_cast_chance(spell_cost, willpower, luck, magic_skill)
  -- Fatigue affects spell costs instead (after chance is calculated, so it does not affect chance).
  local formula = chance_formulas[config.chance_formula] or chance_formulas[3]
  -- fixing the skill values for better progression
  -- so we smooth the mid-levels 30-50 for early game balance
  -- 30 behaves as 30, but 50 behaves as 40
  if magic_skill >= 30 and magic_skill <= 50 then
    magic_skill = (magic_skill + 30) / 2
  elseif magic_skill > 50 and magic_skill <= 65 then
    -- then we get faster growth in 50-65 range, so while 50 behaves as 40, 65 behaves as 65 again
    magic_skill = (magic_skill - 50) * 5/3 + 40
  end
  -- willpower softcap, since it can get absurd, willpower_softcap = 0 - no cap, willpower_softcap = 100 - hard cap
  if willpower > 100 then
    willpower = 100 + (willpower - 100) ^ ((100 - config.willpower_softcap) / 100)
  end
  local cast_chance = formula.flat + formula.willpower * willpower + formula.luck * luck - (spell_cost ^ formula.cost_exponent) +
      formula.skill * magic_skill
  -- Clamping might actually be not the best approach if you want to visualise just how terrible your chances of casting are (-186 chance aka you'll never cast that)
  return math.clamp(math.round(cast_chance), 0, 100)
end

--- Applies hybrid mode shoulder transform to a raw cast chance.
--- Caller is responsible for ensuring sa_cut_in < sa_fulcrum < sa_cut_off.
--- @param chance number  Raw cast chance (0–100) from calculate_cast_chance.
--- @return number        Effective chance after piecewise linear remapping and quantisation.
local function apply_hybrid_mode(chance)
  local sa_ci = config.sa_cut_in_value
  local sa_fv = config.sa_fulcrum_value
  local sa_co = config.sa_cut_off_value
  local sa_bp = config.sa_base_probability
  -- A step of 0 would divide by zero. Configs saved by older versions can hold one.
  local sa_cs = math.max(config.sa_chance_step, 1)

  if chance >= sa_co then
    return 100
  elseif chance >= sa_fv then
    -- Upper arm: linear from sa_bp (at fulcrum) to ~100 (at cut-off), quantised.
    return math.floor((sa_bp + (chance - sa_fv) * (100 - sa_bp) / (sa_co - sa_fv)) / sa_cs) * sa_cs
  elseif chance >= sa_ci then
    -- Lower arm: linear from 0 (at cut-in) to sa_bp (at fulcrum), quantised.
    return math.floor(((chance - sa_ci) * sa_bp / (sa_fv - sa_ci)) / sa_cs) * sa_cs
  else
    return 0
  end
end

--- Whether semi-determinism mode (1) treats this spell as deterministic.
--- @param spell tes3spell
--- @return boolean
local function is_determinist_spell(spell)
  if config.determinism_mode ~= 1 then return false end
  if spell.alwaysSucceeds and not config.override_costs_alwaystosucceed then return false end
  for _, effect in ipairs(spell.effects) do
    if effect.object and determinist_effect_set[effect.id] then
      return true
    end
  end
  return false
end

--- Whether the spell comes from the player's birthsign and the setting keeps those at vanilla values.
--- Such spells are left to the engine: no cost or chance recalculation.
--- @param spell tes3spell
--- @return boolean
local function is_birthsign_spell(spell)
  if not config.skip_birthsign_spells then return false end
  local birthsign = tes3.mobilePlayer and tes3.mobilePlayer.birthsign
  if not birthsign then return false end
  for bs_spell in tes3.iterate(birthsign.spells.iterator) do
    if bs_spell.id == spell.id then return true end
  end
  return false
end

--- Whether the spell succeeds or fails outright, without a roll: full determinism, or a determinist spell in mode 1.
--- @param spell tes3spell
--- @return boolean
local function is_deterministic(spell)
  return config.determinism_mode == 2 or is_determinist_spell(spell)
end

--- The raw chance, or 100 for a spell that always succeeds while the setting keeps that.
--- @param chance number  Raw chance from calculate_cast_chance.
--- @param spell tes3spell
--- @return number
local function base_chance(chance, spell)
  if spell.alwaysSucceeds and not config.override_chances_alwaystosucceed then
    return 100
  end
  return chance
end

--- Applies MOTTE's rules to a raw cast chance, in the order a cast applies them:
--- always-succeeds spells, the NPC assist, determinism or the flat bonus, and hybrid mode.
--- The result is what the spellCast handler hands to the engine, before other mods'
--- handlers (e.g. Tamriel_Data's Fortify Casting) run.
--- @param chance number  Raw chance from calculate_cast_chance.
--- @param spell tes3spell
--- @param is_player boolean
--- @return number
local function final_cast_chance(chance, spell, is_player)
  chance = base_chance(chance, spell)
  -- Bandaid: if there are some absurdly strong spells that don't have "always succeeds", NPCs will suck at casting them.
  if chance <= CAST_THRESHOLD and not is_player and config.npc_assist then
    chance = CAST_THRESHOLD + 1
  end
  if is_deterministic(spell) then
    chance = (chance > CAST_THRESHOLD) and 100 or 0
  elseif config.determinism_mode ~= 3 and chance > 0 then
    -- Flat bonus only in modes 0 and 1; mode 3 uses the hybrid formula instead.
    chance = math.min(chance + config.flat_chance_bonus, 100)
  end
  if config.determinism_mode == 3 then
    chance = apply_hybrid_mode(chance)
  end
  return chance
end

--- Mastery shown for deterministic spells: how close the raw chance is to the threshold needed to succeed.
--- @param chance number  Raw chance from calculate_cast_chance.
--- @param spell tes3spell
--- @return number
local function mastery(chance, spell)
  return math.min(math.floor(base_chance(chance, spell) * 100 / CAST_THRESHOLD), 100)
end

--- Multiplier on a spell's stored cost from the caster's state: fatigue, sound, armor
--- (NPC-type casters, which includes the player) and overflowing magicka (player only).
--- None of these affect the cast chance.
--- @param mobile tes3mobileNPC|tes3mobilePlayer|tes3mobileCreature
--- @param wears_armor boolean  Only NPC-type casters have armor skills.
--- @param is_player boolean
--- @return number
local function cost_multiplier(mobile, wears_armor, is_player)
  -- Fatigue increases costs up to 50% more (by default, configurable).
  local fatigue_normalized = math.min(1, mobile.fatigue.normalized)
  -- Sound increases costs by 5% per magnitude.
  local sound_factor = 0
  if mobile.sound < 0 then
    sound_factor = mobile.sound * -SOUND_COST_PER_POINT
  end
  -- Armor increases costs up to 100% more (by default, configurable).
  local armor_factor = 0
  if wears_armor and config.armor_penalty_perc_max > 0 then
    local armor_table = get_armor_coefs(mobile)
    armor_factor = armor_table.light * math.max(config.armor_penalty_cap_light - mobile.lightArmor.current, 0) / config.armor_penalty_cap_light +
    armor_table.medium * math.max(config.armor_penalty_cap_medium - mobile.mediumArmor.current, 0) / config.armor_penalty_cap_medium +
    armor_table.heavy * math.max(config.armor_penalty_cap_heavy - mobile.heavyArmor.current, 0) / config.armor_penalty_cap_heavy
    armor_factor = armor_factor * (config.armor_penalty_perc_max / 100)
  end
  local mult = 1 + (config.fatigue_penalty_mult / 100) * (1 - fatigue_normalized) + sound_factor + armor_factor
  if is_player and mobile.magicka.current > OVERFLOW_THRESHOLD then
    mult = mult * (1 + (mobile.magicka.current - OVERFLOW_THRESHOLD) * config.overflowing_magicka_rate / 10000)
  end
  return mult
end

return {
  CAST_THRESHOLD        = CAST_THRESHOLD,
  calculate_cast_chance = calculate_cast_chance,
  get_armor_coefs       = get_armor_coefs,
  apply_hybrid_mode     = apply_hybrid_mode,
  is_determinist_spell  = is_determinist_spell,
  is_deterministic      = is_deterministic,
  is_birthsign_spell    = is_birthsign_spell,
  base_chance           = base_chance,
  final_cast_chance     = final_cast_chance,
  mastery               = mastery,
  cost_multiplier       = cost_multiplier,
}
