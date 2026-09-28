-- enchantments.lua
-- The enchantments of the game that the mod changes. All of them are on scrolls of
-- Calm, Frenzy, Rally or Demoralize, which work by the target's level under the mod.
--   cost, charge  as the game stores them
--   auto_calc     the game works both out by itself
--   effects       up to eight. min, max, duration and area are 0 when left out.

return {
  sc_balefulsuffering_en = {
    cost = 114, charge = 114, auto_calc = true,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.target, min = 0, max = 25, duration = 30, area = 10 },
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 0, max = 25, duration = 30, area = 10 },
      { id = tes3.effect.demoralizeCreature, range = tes3.effectRange.target, min = 20, max = 20, duration = 30, area = 10 },
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 20, max = 20, duration = 30, area = 10 },
      { id = tes3.effect.disintegrateArmor, range = tes3.effectRange.target, min = 5, max = 5, duration = 5, area = 10 },
      { id = tes3.effect.disintegrateWeapon, range = tes3.effectRange.target, min = 5, max = 5, duration = 5, area = 10 },
    },
  },
  sc_dedresmasterfuleye_en = {
    cost = 16, charge = 16, auto_calc = true,
    effects = {
      { id = tes3.effect.calmCreature, range = tes3.effectRange.target, min = 20, max = 20, duration = 10, area = 20 },
    },
  },
  sc_feldramstrepidation_en = {
    cost = 114, charge = 114, auto_calc = true,
    effects = {
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 50, max = 50, duration = 30 },
    },
  },
  sc_gonarsgoad_en = {
    cost = 7, charge = 7, auto_calc = true,
    effects = {
      { id = tes3.effect.frenzyCreature, range = tes3.effectRange.target, min = 10, max = 10, duration = 30 },
    },
  },
  sc_mondensinstigator_en = {
    cost = 65, charge = 65, auto_calc = true,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 10, max = 10, duration = 60 },
    },
  },
  sc_telvinscourage_en = {
    cost = 63, charge = 126,
    effects = {
      { id = tes3.effect.rallyHumanoid, range = tes3.effectRange.target, min = 25, max = 25, duration = 60, area = 15 },
      { id = tes3.effect.rallyCreature, range = tes3.effectRange.target, min = 25, max = 25, duration = 60, area = 15 },
    },
  },
  sc_tendilstrembling_en = {
    cost = 63, charge = 126,
    effects = {
      { id = tes3.effect.demoralizeCreature, range = tes3.effectRange.target, min = 25, max = 25, duration = 60, area = 15 },
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 25, max = 25, duration = 60, area = 15 },
    },
  },
  sc_tevilspeace_en = {
    cost = 70, charge = 140,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.touch, min = 25, max = 25, duration = 20 },
      { id = tes3.effect.calmCreature, range = tes3.effectRange.touch, min = 25, max = 25, duration = 20 },
    },
  },
  sc_toususabidingbeast_en = {
    cost = 25, charge = 25, auto_calc = true,
    effects = {
      { id = tes3.effect.rallyCreature, range = tes3.effectRange.touch, min = 40, max = 40, duration = 60 },
    },
  },
}
