-- config.lua
-- Loads and returns the mod configuration.
-- Both main.lua and mcm.lua require this to share the same live config table.

local config_name = "Magicka of the Third Era"

local default_config = {
  determinism_mode = 2,
  flat_chance_bonus = 0,
  npc_assist = true,
  override_costs_alwaystosucceed = true,
  override_chances_alwaystosucceed = false,
  fatigue_penalty_mult = 50,
  log_level = mwse.logLevel.info,
  chance_formula = 3,
  willpower_softcap = 30,
  experience_gain = true,
  armor_penalty_perc_max = 100,
  armor_penalty_cap_light = 50,
  armor_penalty_cap_medium = 60,
  armor_penalty_cap_heavy = 70,
  --armor_min_penalty_enabled = false, -- not done yet
  --armor_penalty_min_light = 10,
  --armor_penalty_min_medium = 30,
  --armor_penalty_min_heavy = 50,
  leveling_rate_global = 100,
  leveling_rate_destruction = 90,
  leveling_rate_alteration = 85,
  leveling_rate_illusion = 140,
  leveling_rate_conjuration = 160,
  leveling_rate_mysticism = 130,
  leveling_rate_restoration = 80,
  leveling_uncapped = false,
  overflowing_magicka_rate = 50,
  --ui_determinism_chance_display = "both", -- not done yet
  skip_birthsign_spells = true,
  distribute_magicka_expanded_spells = true,
  economy_spellmerchant_mult = 12,
  economy_spellmaker_mult = 40,
  economy_spellmerchant_diff = 100,
  economy_spellmaker_diff = 30,
  ui_extended_spell_merchant = true,
  ui_spell_merchant_sort = 2,
  --SA edit: New added values for probabilistic shoulder
  sa_cut_in_value = 50,
  sa_fulcrum_value = 60,
  sa_cut_off_value = 65,
  sa_base_probability = 80,
  sa_chance_step = 5,
}

local config = mwse.loadConfig(config_name, default_config)

-- Older versions saved the level as a string. The MCM dropdown and the logger use numbers.
local saved_level = config.log_level ---@type any
if type(saved_level) == "string" then
  config.log_level = mwse.logLevel[saved_level:lower()] or default_config.log_level
end

-- confPath and default are read through the metatable, so they stay out of the saved JSON.
-- Older versions saved them as regular keys.
config.confPath = nil
config.default  = nil
return setmetatable(config, { __index = { confPath = config_name, default = default_config } })
