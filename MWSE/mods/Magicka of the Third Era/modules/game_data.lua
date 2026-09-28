-- game_data.lua
-- Writes the mod's data into the game's records: magic effects.
-- The original mod did this with a plugin. The tables in data/ replace it, and they win over
-- what the plugins of other mods say about the same records.

local config = require("Magicka of the Third Era.config")
local log = mwse.Logger.new{ modName = "Magicka of the Third Era", moduleName = "Game data", logLevel = config.log_level }

local magic_effects = require("Magicka of the Third Era.data.magic_effects")

local this = {}

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

--- Writes everything. Runs once, when the game has loaded its plugins.
function this.apply()
  apply_magic_effects()
  log:info("game data applied")
end

return this
