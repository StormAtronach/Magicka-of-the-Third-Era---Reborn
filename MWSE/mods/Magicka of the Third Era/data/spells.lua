-- spells.lua
-- The spells the mod changes or adds, as the game holds them once the mod has loaded.
-- A spell that is missing from the game is created.
--   name, cost       cost is what the game stores. What a cast costs comes from spell_manager.lua.
--   auto_calc        the game works the stored cost out by itself, and may give the spell to NPCs
--   start_spell      a new character may start with the spell
--   always_succeeds  the game never lets a cast fail
--   effects          up to eight. min, max, duration and area are 0 when left out.

return {
  ---------------------------------------------------------------------------
  -- Spells of the game, changed
  ---------------------------------------------------------------------------
  ["absorb agility"] = {
    name = "Absorb Agility", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb agility [ranged]"] = {
    name = "Devour Agility", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb endurance"] = {
    name = "Absorb Endurance", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb endurance [ranged]"] = {
    name = "Devour Endurance", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb fatigue"] = {
    name = "Absorb Fatigue", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 4, max = 4, duration = 10 },
    },
  },
  ["absorb fatigue [ranged]"] = {
    name = "Devour Fatigue", cost = 15,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.target, min = 10, max = 10, duration = 20 },
    },
  },
  ["absorb health"] = {
    name = "Absorb Health", cost = 5,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 10, max = 10, duration = 1 },
    },
  },
  ["absorb health [ranged]"] = {
    name = "Devour Health", cost = 15,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.target, min = 20, max = 20, duration = 1 },
    },
  },
  ["absorb intelligence"] = {
    name = "Absorb Intelligence", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb intelligence [ranged]"] = {
    name = "Devour Intelligence", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb luck"] = {
    name = "Absorb Luck", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb luck [ranged]"] = {
    name = "Devour Luck", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb personality"] = {
    name = "Absorb Personality", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb personality [ranged]"] = {
    name = "Devour Personality", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb speed"] = {
    name = "Absorb Speed", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb speed [ranged]"] = {
    name = "Devour Speed", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb spell points"] = {
    name = "Spell Sponge", cost = 21,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 20, max = 20, duration = 20 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 20, max = 20, duration = 20 },
    },
  },
  ["absorb spell points [ranged]"] = {
    name = "Nullifier", cost = 27,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 25, max = 25, duration = 20 },
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 25, max = 25, duration = 20 },
    },
  },
  ["absorb strength"] = {
    name = "Absorb Strength", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb strength [ranged]"] = {
    name = "Devour Strength", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["absorb willpower"] = {
    name = "Absorb Willpower", cost = 15,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["absorb willpower [ranged]"] = {
    name = "Devour Willpower", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["alad's caliginy"] = {
    name = "Alad's Caliginy", cost = 30,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 50, max = 70, duration = 20 },
    },
  },
  ["almalexia's grace"] = {
    name = "Almalexia's Grace", cost = 12,
    effects = {
      { id = tes3.effect.dispel, range = tes3.effectRange.touch, min = 100, max = 100, duration = 1, area = 50 },
    },
  },
  ["armor eater"] = {
    name = "Armor Eater", cost = 6,
    effects = {
      { id = tes3.effect.disintegrateArmor, range = tes3.effectRange.touch, min = 200, max = 400, duration = 1 },
    },
  },
  ["ash feast"] = {
    name = "Ash Feast", cost = 18,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.touch, min = 60, max = 120, duration = 30 },
    },
  },
  ["balyna's antidote"] = {
    name = "Balyna's Antidote", cost = 15,
    effects = {
      { id = tes3.effect.curePoison, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 25, max = 25, duration = 1 },
    },
  },
  ["balyna's efficacious balm"] = {
    name = "Balyna's Efficacious Balm", cost = 24,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 80, max = 120, duration = 1 },
    },
  },
  ["balyna's perfect balm"] = {
    name = "Balyna's Perfect Balm", cost = 36,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 120, max = 160, duration = 1 },
    },
  },
  ["balyna's soothing balm"] = {
    name = "Balyna's Soothing Balm", cost = 18,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 60, max = 80, duration = 1 },
    },
  },
  ["black hand"] = {
    name = "Black Hand", cost = 26,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 10, max = 10, duration = 3 },
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 10, max = 10, duration = 3 },
    },
  },
  ["blessed touch"] = {
    name = "Blessed Touch", cost = 45,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.touch, min = 100, max = 100, duration = 60, area = 50 },
    },
  },
  ["blessed word"] = {
    name = "Blessed Word", cost = 30,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.target, min = 100, max = 100, duration = 60, area = 50 },
    },
  },
  blightguard = {
    name = "Blightguard", cost = 30,
    effects = {
      { id = tes3.effect.resistBlightDisease, range = tes3.effectRange.self, min = 100, max = 100, duration = 360 },
    },
  },
  blind = {
    name = "Blind", cost = 15,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 30, max = 30, duration = 10 },
    },
  },
  ["blood despair"] = {
    name = "Blood Despair", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 20, max = 40, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 20, max = 40, duration = 30 },
    },
  },
  ["blood gift"] = {
    name = "Blood Gift", cost = 30,
    effects = {
      { id = tes3.effect.fortifyHealth, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["blood sacrifice"] = {
    name = "Blood Sacrifice", cost = 60, auto_calc = true,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 50, max = 100, duration = 1 },
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 100, max = 200, duration = 1 },
    },
  },
  ["bone guard"] = {
    name = "Bone Guard", cost = 13, auto_calc = true,
    effects = {
      { id = tes3.effect.summonSkeletalMinion, range = tes3.effectRange.self, min = 1, max = 1, duration = 20 },
    },
  },
  ["bound battle-axe"] = {
    name = "Bound Battle Axe", cost = 6, auto_calc = true,
    effects = {
      { id = tes3.effect.boundBattleAxe, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  ["bound dagger"] = {
    name = "Bound Dagger", cost = 6, auto_calc = true,
    effects = {
      { id = tes3.effect.boundDagger, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  ["bound longbow"] = {
    name = "Bound Long Bow", cost = 6, auto_calc = true,
    effects = {
      { id = tes3.effect.boundLongbow, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  ["brevusa's averted eyes"] = {
    name = "Brevusa's Averted Eyes", cost = 5,
    effects = {
      { id = tes3.effect.invisibility, range = tes3.effectRange.self, min = 1, max = 1, duration = 10 },
    },
  },
  buoyancy = {
    name = "Buoyancy", cost = 3,
    effects = {
      { id = tes3.effect.swiftSwim, range = tes3.effectRange.self, min = 30, max = 30, duration = 30 },
    },
  },
  burden = {
    name = "Burden", cost = 9,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 100, max = 100, duration = 10 },
    },
  },
  ["burden of sin"] = {
    name = "Burden of Sin", cost = 12,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 100, max = 200, duration = 15, area = 10 },
    },
  },
  ["burden touch"] = {
    name = "Burden Touch", cost = 6,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 100, max = 100, duration = 10 },
    },
  },
  ["burning touch"] = {
    name = "Burning Touch", cost = 18,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 20, max = 40, duration = 2, area = 5 },
    },
  },
  ["calm creature"] = {
    name = "Calm Creature", cost = 18,
    effects = {
      { id = tes3.effect.calmCreature, range = tes3.effectRange.target, min = 5, max = 5, duration = 10 },
    },
  },
  ["calm humanoid"] = {
    name = "Calm Humanoid", cost = 24,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  ["calming touch"] = {
    name = "Calming Touch", cost = 15,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.touch, min = 10, max = 10, duration = 10 },
    },
  },
  chameleon = {
    name = "Chameleon", cost = 15,
    effects = {
      { id = tes3.effect.chameleon, range = tes3.effectRange.self, min = 10, max = 10, duration = 10 },
    },
  },
  charisma = {
    name = "Charisma", cost = 15,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["charm mortal"] = {
    name = "Charm Mortal", cost = 20,
    effects = {
      { id = tes3.effect.charm, range = tes3.effectRange.touch, min = 25, max = 25, duration = 20 },
    },
  },
  ["charming touch"] = {
    name = "Charming Touch", cost = 10, start_spell = true,
    effects = {
      { id = tes3.effect.charm, range = tes3.effectRange.touch, min = 10, max = 10, duration = 20 },
    },
  },
  clench = {
    name = "Clench", cost = 10,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  clumsiness = {
    name = "Clumsiness", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 10, max = 20, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 10, max = 20, duration = 30 },
    },
  },
  ["clumsy touch"] = {
    name = "Clumsy Touch", cost = 10,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["command beast"] = {
    name = "Command Beast", cost = 15,
    effects = {
      { id = tes3.effect.commandCreature, range = tes3.effectRange.touch, min = 6, max = 6, duration = 30 },
    },
  },
  ["command creature"] = {
    name = "Command Creature", cost = 30,
    effects = {
      { id = tes3.effect.commandCreature, range = tes3.effectRange.target, min = 6, max = 6, duration = 60 },
    },
  },
  ["command humanoid"] = {
    name = "Command Humanoid", cost = 18,
    effects = {
      { id = tes3.effect.commandHumanoid, range = tes3.effectRange.target, min = 3, max = 3, duration = 60 },
    },
  },
  ["commanding touch"] = {
    name = "Commanding Touch", cost = 9,
    effects = {
      { id = tes3.effect.commandHumanoid, range = tes3.effectRange.touch, min = 3, max = 3, duration = 30 },
    },
  },
  concealment = {
    name = "Concealment", cost = 30,
    effects = {
      { id = tes3.effect.invisibility, range = tes3.effectRange.self, min = 1, max = 1, duration = 40 },
    },
  },
  ["crimson despair"] = {
    name = "Crimson Despair", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  ["cruel earwig"] = {
    name = "Cruel Earwig", cost = 17,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 20, max = 20, duration = 10 },
    },
  },
  ["cruel firebloom"] = {
    name = "Cruel Firebloom", cost = 42,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 10, max = 30, duration = 5, area = 10 },
    },
  },
  ["cruel noise"] = {
    name = "Cruel Noise", cost = 18,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.touch, min = 20, max = 20, duration = 20 },
    },
  },
  ["cruel weary"] = {
    name = "Cruel Weary", cost = 24,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.target, min = 200, max = 300, duration = 10 },
    },
  },
  ["crushing burden"] = {
    name = "Crushing Burden", cost = 45,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 500, max = 500, duration = 10 },
    },
  },
  ["crushing burden of sin"] = {
    name = "Crushing Burden of Sin", cost = 30,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 300, max = 600, duration = 15, area = 25 },
    },
  },
  ["crushing burden touch"] = {
    name = "Crushing Burden Touch", cost = 30,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 500, max = 500, duration = 15 },
    },
  },
  ["crying eye"] = {
    name = "Crying Eye", cost = 18,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.target, min = 30, max = 50, duration = 20 },
    },
  },
  ["daedric agility"] = {
    name = "Daedric Agility", cost = 60,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["daedric bite"] = {
    name = "Daedric Bite", cost = 72,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 40, max = 40, duration = 5 },
    },
  },
  ["daedric endurance"] = {
    name = "Daedric Endurance", cost = 45,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["daedric fatigue"] = {
    name = "Daedric Fatigue", cost = 60,
    effects = {
      { id = tes3.effect.fortifyFatigue, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  ["daedric health"] = {
    name = "Daedric Health", cost = 60,
    effects = {
      { id = tes3.effect.fortifyHealth, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  ["daedric intelligence"] = {
    name = "Daedric Intelligence", cost = 45,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.self, min = 20, max = 20, duration = 60 },
    },
  },
  ["daedric luck"] = {
    name = "Daedric Luck", cost = 45,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.self, min = 20, max = 20, duration = 60 },
    },
  },
  ["daedric personality"] = {
    name = "Daedric Personality", cost = 45,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 20, max = 20, duration = 60 },
    },
  },
  ["daedric speed"] = {
    name = "Daedric Speed", cost = 60,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["daedric strength"] = {
    name = "Daedric Strength", cost = 60,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["daedric willpower"] = {
    name = "Daedric Willpower", cost = 30,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 20, max = 40, duration = 60 },
    },
  },
  ["deadly poison"] = {
    name = "Deadly Poison", cost = 25,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 15, max = 20, duration = 10 },
    },
  },
  ["deadly poison [ranged]"] = {
    name = "Deadly Poison Bolt", cost = 35,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 15, max = 20, duration = 10 },
    },
  },
  ["demoralize beast"] = {
    name = "Demoralize Beast", cost = 6,
    effects = {
      { id = tes3.effect.demoralizeCreature, range = tes3.effectRange.touch, min = 10, max = 10, duration = 10 },
    },
  },
  ["demoralize creature"] = {
    name = "Demoralize Creature", cost = 9,
    effects = {
      { id = tes3.effect.demoralizeCreature, range = tes3.effectRange.target, min = 5, max = 5, duration = 10 },
    },
  },
  ["demoralize humanoid"] = {
    name = "Demoralize Humanoid", cost = 18,
    effects = {
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  ["demoralizing touch"] = {
    name = "Demoralizing Touch", cost = 12,
    effects = {
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.touch, min = 10, max = 10, duration = 10 },
    },
  },
  ["detect enchantment"] = {
    name = "Detect Enchantment", cost = 5,
    effects = {
      { id = tes3.effect.detectEnchantment, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  detect_creature = {
    name = "Detect Life", cost = 5,
    effects = {
      { id = tes3.effect.detectAnimal, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  detect_key = {
    name = "Detect Key", cost = 5,
    effects = {
      { id = tes3.effect.detectKey, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  ["dire earwig"] = {
    name = "Dire Earwig", cost = 28,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 40, max = 40, duration = 10 },
    },
  },
  ["dire noise"] = {
    name = "Dire Noise", cost = 26,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.touch, min = 35, max = 35, duration = 20 },
    },
  },
  ["dire shockball"] = {
    name = "Dire Shockball", cost = 24,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 40, max = 50, duration = 1 },
    },
  },
  ["dire weakness to fire"] = {
    name = "Dire Weakness to Fire", cost = 30,
    effects = {
      { id = tes3.effect.weaknesstoFire, range = tes3.effectRange.target, min = 40, max = 60, duration = 20, area = 10 },
    },
  },
  ["dire weakness to frost"] = {
    name = "Dire Weakness to Frost", cost = 30,
    effects = {
      { id = tes3.effect.weaknesstoFrost, range = tes3.effectRange.target, min = 40, max = 60, duration = 20, area = 10 },
    },
  },
  ["dire weakness to magicka"] = {
    name = "Dire Weakness to Magicka", cost = 30,
    effects = {
      { id = tes3.effect.weaknesstoMagicka, range = tes3.effectRange.target, min = 40, max = 60, duration = 20, area = 10 },
    },
  },
  ["dire weakness to poison"] = {
    name = "Dire Weakness to Poison", cost = 30,
    effects = {
      { id = tes3.effect.weaknesstoPoison, range = tes3.effectRange.target, min = 40, max = 60, duration = 20, area = 10 },
    },
  },
  ["dire weakness to shock"] = {
    name = "Dire Weakness to Shock", cost = 30,
    effects = {
      { id = tes3.effect.weaknesstoShock, range = tes3.effectRange.target, min = 40, max = 60, duration = 20, area = 10 },
    },
  },
  ["dire weary"] = {
    name = "Dire Weary", cost = 45,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 300, max = 400, duration = 10 },
    },
  },
  ["disintegrate armor"] = {
    name = "Disintegrate Armor", cost = 9,
    effects = {
      { id = tes3.effect.disintegrateArmor, range = tes3.effectRange.target, min = 200, max = 600, duration = 1 },
    },
  },
  ["disintegrate weapon"] = {
    name = "Disintegrate Weapon", cost = 9,
    effects = {
      { id = tes3.effect.disintegrateWeapon, range = tes3.effectRange.target, min = 100, max = 300, duration = 1 },
    },
  },
  dispel = {
    name = "Dispel", cost = 9,
    effects = {
      { id = tes3.effect.dispel, range = tes3.effectRange.target, min = 100, max = 100, duration = 1 },
    },
  },
  ["distracting touch"] = {
    name = "Distracting Touch", cost = 3,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  distraction = {
    name = "Distraction", cost = 5,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["divine aid"] = {
    name = "Divine Aid", cost = 9,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  doze = {
    name = "Doze", cost = 13,
    effects = {
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 40, max = 40, duration = 3 },
    },
  },
  ["drain alteration"] = {
    name = "Drain Alteration", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.alteration, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain athletics"] = {
    name = "Drain Athletics", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.athletics, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain axe"] = {
    name = "Drain Axe", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.axe, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain block"] = {
    name = "Drain Block", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.block, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain blood"] = {
    name = "Drain Blood", cost = 30,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.touch, min = 180, max = 180, duration = 1 },
    },
  },
  ["drain blunt weapon"] = {
    name = "Drain Blunt Weapon", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.bluntWeapon, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain conjuration"] = {
    name = "Drain Conjuration", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.conjuration, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain destruction"] = {
    name = "Drain Destruction", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.destruction, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain hand-to-hand"] = {
    name = "Drain Hand-to-Hand", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.speechcraft, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain health_fatigue"] = {
    name = "Life Force", cost = 30,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 25, max = 25, duration = 5 },
    },
  },
  ["drain heavy armor"] = {
    name = "Drain Heavy Armor", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.heavyArmor, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain illusion"] = {
    name = "Drain Illusion", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.illusion, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain light armor"] = {
    name = "Drain Light Armor", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.lightArmor, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain marksman"] = {
    name = "Drain Marksman", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.marksman, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain medium armor"] = {
    name = "Drain Medium Armor", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.mediumArmor, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain mysticism"] = {
    name = "Drain Mysticism", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.mysticism, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain restoration"] = {
    name = "Drain Restoration", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.restoration, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain spear"] = {
    name = "Drain Spear", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.spear, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["drain unarmored"] = {
    name = "Drain Unarmored", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.unarmored, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["dread curse: endurance"] = {
    name = "Dread Curse: Endurance", cost = 15,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.touch, min = 5, max = 12, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
    },
  },
  ["dread curse: strength"] = {
    name = "Dread Curse: Strength", cost = 15,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 5, max = 12, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 2, max = 5, duration = 1 },
    },
  },
  earwig = {
    name = "Earwig", cost = 10,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  emasculate = {
    name = "Emasculate", cost = 10,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  ["energy leech"] = {
    name = "Energy Leech", cost = 30,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 10, max = 20, duration = 20 },
    },
  },
  enervate = {
    name = "Enervate", cost = 5,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["enervating touch"] = {
    name = "Enervating Touch", cost = 3,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  enrichment = {
    name = "Enrichment", cost = 15,
    effects = {
      { id = tes3.effect.fortifyFatigue, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["erelvam's wild sty"] = {
    name = "Erelvam's Wild Sty", cost = 45,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.target, min = 60, max = 80, duration = 20 },
    },
  },
  ["evil eye"] = {
    name = "Evil Eye", cost = 3,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  ["exhausting touch"] = {
    name = "Exhausting Touch", cost = 18,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.touch, min = 200, max = 300, duration = 10 },
    },
  },
  exhaustion = {
    name = "Exhaustion", cost = 36,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.target, min = 200, max = 300, duration = 10, area = 10 },
    },
  },
  ["far silence"] = {
    name = "Far Silence", cost = 22,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.target, min = 1, max = 1, duration = 25 },
    },
  },
  ["father's hand"] = {
    name = "Father's Hand", cost = 9,
    effects = {
      { id = tes3.effect.sanctuary, range = tes3.effectRange.self, min = 10, max = 10, duration = 20 },
    },
  },
  feather = {
    name = "Feather", cost = 3,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 50, max = 50, duration = 90 },
    },
  },
  ["feet of notorgo"] = {
    name = "Feet of Notorgo", cost = 30,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 20, max = 40, duration = 60 },
    },
  },
  ["fenrick's doorjam"] = {
    name = "Fenrick's Doorjam", cost = 5,
    effects = {
      { id = tes3.effect.lock, range = tes3.effectRange.touch, min = 10, max = 10, duration = 1 },
    },
  },
  ["fierce fire shield"] = {
    name = "Fierce Fire Shield", cost = 60,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 40, max = 40, duration = 40 },
    },
  },
  ["fierce frost shield"] = {
    name = "Fierce Frost Shield", cost = 60,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 40, max = 40, duration = 40 },
    },
  },
  ["fierce shock shield"] = {
    name = "Fierce Lightning Shield", cost = 60,
    effects = {
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 40, max = 40, duration = 40 },
    },
  },
  ["fifth barrier"] = {
    name = "Fifth Barrier", cost = 60,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 50, max = 50, duration = 40 },
    },
  },
  ["fire barrier"] = {
    name = "Fire Barrier", cost = 15,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 40 },
    },
  },
  ["fire bite"] = {
    name = "Firebite", cost = 6,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 20, max = 25, duration = 1 },
    },
  },
  ["fire shield"] = {
    name = "Fire Shield", cost = 30,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 20, max = 20, duration = 40 },
    },
  },
  ["fire storm"] = {
    name = "Fire Storm", cost = 24,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 4, max = 6, duration = 10, area = 20 },
    },
  },
  fire_fathasa_unique = {
    name = "Fire Barrier", cost = 60, auto_calc = true,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
    },
  },
  fireball = {
    name = "Fireball", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 10, max = 13, duration = 1, area = 5 },
    },
  },
  Fireball_large = {
    name = "Greater Fireball", cost = 12,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 25, max = 30, duration = 1, area = 10 },
    },
  },
  firebloom = {
    name = "Firebloom", cost = 30,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 5, max = 25, duration = 5, area = 10 },
    },
  },
  firefist = {
    name = "Firefist", cost = 11,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 15, max = 20, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 15, max = 20, duration = 1 },
    },
  },
  ["first barrier"] = {
    name = "First Barrier", cost = 12,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 10, max = 10, duration = 40 },
    },
  },
  ["five fingers of pain"] = {
    name = "Five Fingers of Pain", cost = 30,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 25, max = 25, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 10, max = 30, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 10, max = 30, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 10, max = 30, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 10, max = 30, duration = 1 },
    },
  },
  flame = {
    name = "Flame", cost = 8, auto_calc = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 25, max = 40, duration = 1 },
    },
  },
  flamebolt = {
    name = "Flamebolt", cost = 21,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 20, max = 30, duration = 2, area = 5 },
    },
  },
  flameguard = {
    name = "Flameguard", cost = 60,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["flay spirit"] = {
    name = "Flay Spirit Touch", cost = 24,
    effects = {
      { id = tes3.effect.drainMagicka, range = tes3.effectRange.touch, min = 80, max = 120, duration = 30 },
    },
  },
  ["flay spirit [ranged]"] = {
    name = "Flay Spirit", cost = 36,
    effects = {
      { id = tes3.effect.drainMagicka, range = tes3.effectRange.target, min = 80, max = 120, duration = 30 },
    },
  },
  fleabite = {
    name = "Fleabite", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 10, max = 10, duration = 5 },
    },
  },
  ["force bolt"] = {
    name = "Force Bolt", cost = 451, auto_calc = true,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 50, max = 100, duration = 20 },
    },
  },
  fortitude = {
    name = "Fortitude", cost = 15,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["fourth barrier"] = {
    name = "Fourth Barrier", cost = 48,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 40, max = 40, duration = 40 },
    },
  },
  ["free action"] = {
    name = "Free Action", cost = 15,
    effects = {
      { id = tes3.effect.resistParalysis, range = tes3.effectRange.self, min = 100, max = 100, duration = 30 },
    },
  },
  ["freezing touch"] = {
    name = "Freezing Touch", cost = 18,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 25, max = 35, duration = 2, area = 5 },
    },
  },
  ["frenzy beast"] = {
    name = "Frenzy Beast", cost = 9,
    effects = {
      { id = tes3.effect.frenzyCreature, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  ["frenzy creature"] = {
    name = "Frenzy Creature", cost = 15,
    effects = {
      { id = tes3.effect.frenzyCreature, range = tes3.effectRange.target, min = 5, max = 5, duration = 10 },
    },
  },
  ["frenzy humanoid"] = {
    name = "Frenzy Humanoid", cost = 36,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  ["frenzying touch"] = {
    name = "Frenzying Touch", cost = 24,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.touch, min = 10, max = 10, duration = 10 },
    },
  },
  ["frost barrier"] = {
    name = "Frost Barrier", cost = 15,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 40 },
    },
  },
  ["frost bolt"] = {
    name = "Frostbolt", cost = 14,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 10, max = 15, duration = 3 },
    },
  },
  ["frost shield"] = {
    name = "Frost Shield", cost = 30,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 20, max = 20, duration = 40 },
    },
  },
  ["frost storm"] = {
    name = "Frost Storm", cost = 24,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 4, max = 7, duration = 10, area = 20 },
    },
  },
  frost_shield = {
    name = "Frost Shield", cost = 90, auto_calc = true,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 30, max = 30, duration = 30 },
    },
  },
  frostball = {
    name = "Frostball", cost = 6,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 10, max = 15, duration = 1, area = 5 },
    },
  },
  Frostball_large = {
    name = "Greater Frostball", cost = 10,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 20, max = 30, duration = 1, area = 5 },
    },
  },
  frostbite = {
    name = "Frostbite", cost = 4,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 15, max = 20, duration = 1 },
    },
  },
  frostbloom = {
    name = "Frostbloom", cost = 30,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 10, max = 20, duration = 5, area = 10 },
    },
  },
  frostfist = {
    name = "Frostfist", cost = 16,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 20, max = 25, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 25, max = 30, duration = 1 },
    },
  },
  frostguard = {
    name = "Frostguard", cost = 60,
    effects = {
      { id = tes3.effect.resistFrost, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  fuddle = {
    name = "Fuddle", cost = 3,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  ["gash spirit"] = {
    name = "Gash Spirit Touch", cost = 12,
    effects = {
      { id = tes3.effect.drainMagicka, range = tes3.effectRange.touch, min = 40, max = 80, duration = 30 },
    },
  },
  ["gash spirit [ranged]"] = {
    name = "Gash Spirit", cost = 18,
    effects = {
      { id = tes3.effect.drainMagicka, range = tes3.effectRange.target, min = 40, max = 80, duration = 30 },
    },
  },
  ["Ghost Curse"] = {
    name = "Ghost Curse", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.touch, min = 10, max = 20, duration = 60 },
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.touch, min = 100, max = 200, duration = 60 },
    },
  },
  ["god's fire"] = {
    name = "God's Fire", cost = 35,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 10, max = 15, duration = 12, area = 10 },
    },
  },
  ["god's frost"] = {
    name = "God's Frost", cost = 35,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 15, max = 20, duration = 7 },
    },
  },
  ["god's spark"] = {
    name = "God's Spark", cost = 37,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 30, max = 40, duration = 3 },
    },
  },
  ["golanar's eye-maze"] = {
    name = "Golanar's Eye-Maze", cost = 30,
    effects = {
      { id = tes3.effect.chameleon, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  ["grave curse: endurance"] = {
    name = "Grave Curse: Endurance", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["grave curse: intelligence"] = {
    name = "Grave Curse: Intelligence", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["grave curse: luck"] = {
    name = "Grave Curse: Luck", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["grave curse: speed"] = {
    name = "Grave Curse: Speed", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["grave curse: strength"] = {
    name = "Grave Curse: Strength", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["grave curse: willpower"] = {
    name = "Grave Curse: Willpower", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.target, min = 10, max = 20, duration = 60 },
    },
  },
  ["great burden of sin"] = {
    name = "Great Burden of Sin", cost = 36,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 200, max = 400, duration = 15, area = 10 },
    },
  },
  ["great feather"] = {
    name = "Great Feather", cost = 9,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 200, max = 200, duration = 60 },
    },
  },
  ["great heal companion"] = {
    name = "Great Heal Companion", cost = 30,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 120, max = 120, duration = 1 },
    },
  },
  ["great levitate"] = {
    name = "Great Levitate", cost = 18,
    effects = {
      { id = tes3.effect.levitate, range = tes3.effectRange.self, min = 50, max = 70, duration = 20 },
    },
  },
  ["great open"] = {
    name = "Great Open", cost = 20,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 70, max = 70, duration = 1 },
    },
  },
  ["great resist common disease"] = {
    name = "Great Resist Disease", cost = 9,
    effects = {
      { id = tes3.effect.resistCommonDisease, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["great resist fire"] = {
    name = "Great Resist Fire", cost = 45,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["great resist frost"] = {
    name = "Great Resist Frost", cost = 45,
    effects = {
      { id = tes3.effect.resistFrost, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["great resist magicka"] = {
    name = "Great Resist Magicka", cost = 45,
    effects = {
      { id = tes3.effect.resistMagicka, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["great resist shock"] = {
    name = "Great Resist Shock", cost = 45,
    effects = {
      { id = tes3.effect.resistShock, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["greater resist poison"] = {
    name = "Great Resist Poison", cost = 45,
    effects = {
      { id = tes3.effect.resistPoison, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  gripes = {
    name = "Gripes", cost = 3,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  ["heal companion"] = {
    name = "Heal Companion", cost = 9,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 40, max = 40, duration = 1 },
    },
  },
  HealingTouch_SP_uniq = {
    name = "Vivec's Touch", cost = 60, always_succeeds = true,
    effects = {
      { id = tes3.effect.cureBlightDisease, range = tes3.effectRange.touch, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.cureCommonDisease, range = tes3.effectRange.touch, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 240, max = 240, duration = 1 },
    },
  },
  heartbite = {
    name = "Heartbite", cost = 36,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 100, max = 100, duration = 1 },
    },
  },
  ["hearth heal"] = {
    name = "Hearth Heal", cost = 6,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 30, max = 30, duration = 1 },
    },
  },
  ["heavy burden"] = {
    name = "Heavy Burden", cost = 24,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 300, max = 300, duration = 10 },
    },
  },
  ["heavy burden touch"] = {
    name = "Heavy Burden Touch", cost = 18,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.touch, min = 300, max = 300, duration = 10 },
    },
  },
  hex = {
    name = "Hex", cost = 3,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  hide = {
    name = "Hide", cost = 15,
    effects = {
      { id = tes3.effect.invisibility, range = tes3.effectRange.self, min = 1, max = 1, duration = 20 },
    },
  },
  ["holy touch"] = {
    name = "Holy Touch", cost = 10,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.touch, min = 50, max = 50, duration = 20, area = 10 },
    },
  },
  ["holy word"] = {
    name = "Holy Word", cost = 15,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.target, min = 50, max = 50, duration = 20, area = 5 },
    },
  },
  hornhand = {
    name = "Hornhand", cost = 20,
    effects = {
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 60, max = 60, duration = 4 },
    },
  },
  invisibility = {
    name = "Invisibility", cost = 10,
    effects = {
      { id = tes3.effect.invisibility, range = tes3.effectRange.self, min = 1, max = 1, duration = 10 },
    },
  },
  ["iron will"] = {
    name = "Iron Will", cost = 30,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 20, max = 40, duration = 60 },
    },
  },
  ironhand = {
    name = "Ironhand", cost = 27,
    effects = {
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 70, max = 70, duration = 6 },
    },
  },
  ["jack of trades"] = {
    name = "Jack of Trades", cost = 9,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  jump = {
    name = "Jump", cost = 5,
    effects = {
      { id = tes3.effect.jump, range = tes3.effectRange.self, min = 10, max = 10, duration = 20 },
    },
  },
  ["knuckle luck"] = {
    name = "Knuckle Luck", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 50, max = 100, duration = 1 },
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 25, max = 50, duration = 1 },
    },
  },
  levitate = {
    name = "Levitate", cost = 6,
    effects = {
      { id = tes3.effect.levitate, range = tes3.effectRange.self, min = 10, max = 30, duration = 20 },
    },
  },
  light = {
    name = "Light", cost = 3,
    effects = {
      { id = tes3.effect.light, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
    },
  },
  ["lightning bolt"] = {
    name = "Lightning Bolt", cost = 20,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 30, max = 45, duration = 1 },
    },
  },
  ["lightning shield"] = {
    name = "Lightning Shield", cost = 30,
    effects = {
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 20, max = 20, duration = 40 },
    },
  },
  ["lightning storm"] = {
    name = "Lightning Storm", cost = 33,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 10, max = 10, duration = 5, area = 20 },
    },
  },
  ["llivam's reversal"] = {
    name = "Llivam's Reversal", cost = 30,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 75, max = 75, duration = 10 },
    },
  },
  lock = {
    name = "Lock", cost = 3,
    effects = {
      { id = tes3.effect.lock, range = tes3.effectRange.touch, min = 20, max = 20, duration = 1 },
    },
  },
  ["magicka leech"] = {
    name = "Magicka Leech", cost = 30,
    effects = {
      { id = tes3.effect.damageMagicka, range = tes3.effectRange.touch, min = 6, max = 18, duration = 10 },
    },
  },
  magickguard = {
    name = "Magickguard", cost = 60,
    effects = {
      { id = tes3.effect.resistMagicka, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["medusa's gaze"] = {
    name = "Medusa's Gaze", cost = 30,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 15 },
    },
  },
  ["misfortunate touch"] = {
    name = "Misfortunate Touch", cost = 3,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  misfortune = {
    name = "Misfortune", cost = 5,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["mother's kiss"] = {
    name = "Mother's Kiss", cost = 6,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 8, max = 8, duration = 3 },
    },
  },
  ["night-eye"] = {
    name = "Night-Eye", cost = 10,
    effects = {
      { id = tes3.effect.nightEye, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  nimbleness = {
    name = "Nimbleness", cost = 30,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 20, max = 40, duration = 60 },
    },
  },
  noise = {
    name = "Noise", cost = 10,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.touch, min = 10, max = 10, duration = 20 },
    },
  },
  ["ondusi's open door"] = {
    name = "Ondusi's Open Door", cost = 10,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 35, max = 35, duration = 1 },
    },
  },
  open = {
    name = "Open", cost = 6,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 20, max = 20, duration = 1 },
    },
  },
  ["orc's strength"] = {
    name = "Orc Strength", cost = 9,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["ordeal of st. olms"] = {
    name = "Ordeal of St. Olms", cost = 30,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.touch, min = 300, max = 400, duration = 10 },
    },
  },
  panacea = {
    name = "Panacea", cost = 30,
    effects = {
      { id = tes3.effect.curePoison, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 120, max = 120, duration = 1 },
    },
  },
  paralysis = {
    name = "Paralysis", cost = 5,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.touch, min = 1, max = 1, duration = 5 },
    },
  },
  ["poet's whim"] = {
    name = "Poet's Whim", cost = 3,
    effects = {
      { id = tes3.effect.resistBlightDisease, range = tes3.effectRange.self, min = 25, max = 25, duration = 180 },
    },
  },
  poison = {
    name = "Poison", cost = 7,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 10, max = 20, duration = 1 },
    },
  },
  poison_powerful = {
    name = "Toxic Cloud", cost = 30,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 5, max = 7, duration = 10, area = 20 },
    },
  },
  poisonbloom = {
    name = "Poisonbloom", cost = 36,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 10, max = 20, duration = 5, area = 10 },
    },
  },
  poisonguard = {
    name = "Poisonguard", cost = 60,
    effects = {
      { id = tes3.effect.resistPoison, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["poisonous touch"] = {
    name = "Poisonous Touch", cost = 15,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 15, max = 30, duration = 2 },
    },
  },
  ["potent poison"] = {
    name = "Potent Poison", cost = 42,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 25, max = 30, duration = 5 },
    },
  },
  ["potent poison [ranged]"] = {
    name = "Potent Poison Bolt", cost = 30,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 25, max = 30, duration = 5 },
    },
  },
  powerwell = {
    name = "Powerwell", cost = 15,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 15, max = 15, duration = 40 },
    },
  },
  ["purge magic"] = {
    name = "Purge Magic", cost = 18,
    effects = {
      { id = tes3.effect.dispel, range = tes3.effectRange.target, min = 100, max = 100, duration = 1, area = 50 },
    },
  },
  Quicksilver = {
    name = "Quicksilver", cost = 9,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["rally beast"] = {
    name = "Rally Beast", cost = 3,
    effects = {
      { id = tes3.effect.rallyCreature, range = tes3.effectRange.touch, min = 10, max = 10, duration = 30 },
    },
  },
  ["rally creature"] = {
    name = "Rally Creature", cost = 5,
    effects = {
      { id = tes3.effect.rallyCreature, range = tes3.effectRange.target, min = 10, max = 10, duration = 30 },
    },
  },
  ["rally humanoid"] = {
    name = "Rally Humanoid", cost = 6,
    effects = {
      { id = tes3.effect.rallyHumanoid, range = tes3.effectRange.target, min = 10, max = 10, duration = 30 },
    },
  },
  ["rallying touch"] = {
    name = "Rallying Touch", cost = 4,
    effects = {
      { id = tes3.effect.rallyHumanoid, range = tes3.effectRange.touch, min = 10, max = 10, duration = 30 },
    },
  },
  ["rapid regenerate"] = {
    name = "Rapid Regenerate", cost = 13,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 4, max = 6, duration = 30 },
    },
  },
  ["red despair"] = {
    name = "Red Despair", cost = 30,
    effects = {
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
      { id = tes3.effect.absorbAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 10, max = 20, duration = 30 },
    },
  },
  reflect = {
    name = "Reflect", cost = 6,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  regenerate = {
    name = "Regenerate", cost = 24,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 3, max = 3, duration = 30 },
    },
  },
  ["resist cold"] = {
    name = "Resist Cold", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  ["resist common disease"] = {
    name = "Resist Disease", cost = 3,
    effects = {
      { id = tes3.effect.resistCommonDisease, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["resist fire"] = {
    name = "Resist Fire", cost = 6,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["resist frost"] = {
    name = "Resist Frost", cost = 6,
    effects = {
      { id = tes3.effect.resistFrost, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["resist magicka"] = {
    name = "Resist Magicka", cost = 6,
    effects = {
      { id = tes3.effect.resistMagicka, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["resist paralysis"] = {
    name = "Resist Paralysis", cost = 3,
    effects = {
      { id = tes3.effect.resistParalysis, range = tes3.effectRange.self, min = 25, max = 25, duration = 30 },
    },
  },
  ["resist poison"] = {
    name = "Resist Poison", cost = 6,
    effects = {
      { id = tes3.effect.resistPoison, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["resist shock"] = {
    name = "Resist Shock", cost = 6,
    effects = {
      { id = tes3.effect.resistShock, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["rest of st. merris"] = {
    name = "Rest of St. Meris", cost = 8, start_spell = true,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 10, max = 10, duration = 20 },
    },
  },
  ["restore agility"] = {
    name = "Restore Agility", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore endurance"] = {
    name = "Restore Endurance", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore intelligence"] = {
    name = "Restore Intelligence", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore luck"] = {
    name = "Restore Luck", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore personality"] = {
    name = "Restore Personality", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore speed"] = {
    name = "Restore Speed", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore strength"] = {
    name = "Restore Strength", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  ["restore willpower"] = {
    name = "Restore Willpower", cost = 10,
    effects = {
      { id = tes3.effect.restoreAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
    },
  },
  righteousness = {
    name = "Righteousness", cost = 30,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 70, max = 70, duration = 1 },
    },
  },
  ["rilm's cure"] = {
    name = "Rilms' Cure", cost = 45,
    effects = {
      { id = tes3.effect.cureCommonDisease, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 180, max = 180, duration = 1 },
    },
  },
  ["rilm's gift"] = {
    name = "Rilms' Gift", cost = 45,
    effects = {
      { id = tes3.effect.cureCommonDisease, range = tes3.effectRange.touch, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.cureBlightDisease, range = tes3.effectRange.touch, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 180, max = 180, duration = 1 },
    },
  },
  ["saintly touch"] = {
    name = "Saintly Touch", cost = 15,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.touch, min = 100, max = 100, duration = 30, area = 25 },
    },
  },
  ["saintly word"] = {
    name = "Saintly Word", cost = 30,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.target, min = 100, max = 100, duration = 30, area = 25 },
    },
  },
  sanctuary = {
    name = "Sanctuary", cost = 30,
    effects = {
      { id = tes3.effect.sanctuary, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  ["scourge blade"] = {
    name = "Scourge Blade", cost = 15,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.longBlade, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.shortBlade, range = tes3.effectRange.target, min = 10, max = 20, duration = 40 },
    },
  },
  ["second barrier"] = {
    name = "Second Barrier", cost = 24,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 20, max = 20, duration = 40 },
    },
  },
  ["self dispel"] = {
    name = "Self Dispel", cost = 3,
    effects = {
      { id = tes3.effect.dispel, range = tes3.effectRange.self, min = 100, max = 100, duration = 1 },
    },
  },
  ["seryn's blessing"] = {
    name = "Seryn's Blessing", cost = 15,
    effects = {
      { id = tes3.effect.resistCommonDisease, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  ["shadow form"] = {
    name = "Shadow Form", cost = 30,
    effects = {
      { id = tes3.effect.chameleon, range = tes3.effectRange.self, min = 25, max = 25, duration = 10 },
    },
  },
  ["shadow weave"] = {
    name = "Shadow Weave", cost = 45,
    effects = {
      { id = tes3.effect.chameleon, range = tes3.effectRange.self, min = 25, max = 25, duration = 10 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 20, max = 20, duration = 20 },
    },
  },
  shadowmask = {
    name = "Shadowmask", cost = 60,
    effects = {
      { id = tes3.effect.chameleon, range = tes3.effectRange.self, min = 50, max = 50, duration = 10 },
    },
  },
  ["shalidor's mirror"] = {
    name = "Shalidor's Mirror", cost = 15,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 50, max = 50, duration = 10 },
    },
  },
  shard = {
    name = "Shard", cost = 8, auto_calc = true,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 20, max = 25, duration = 1 },
    },
  },
  shield = {
    name = "Shield", cost = 6,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 5, max = 5, duration = 60 },
    },
  },
  ["shield of the armiger"] = {
    name = "Shield of the Armiger", cost = 6,
    effects = {
      { id = tes3.effect.resistBlightDisease, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  shock = {
    name = "Shock", cost = 5,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 10, max = 15, duration = 1, area = 5 },
    },
  },
  ["shock barrier"] = {
    name = "Lightning Barrier", cost = 15,
    effects = {
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 40 },
    },
  },
  ["shock shield"] = {
    name = "Shock Shield", cost = 120, auto_calc = true,
    effects = {
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 40, max = 40, duration = 30 },
    },
  },
  shockball = {
    name = "Greater Shockball", cost = 16,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 20, max = 30, duration = 1, area = 10 },
    },
  },
  shockball_large = {
    name = "Shockball", cost = 15,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 15, max = 20, duration = 1, area = 5 },
    },
  },
  shockbite = {
    name = "Shockbite", cost = 7,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 15, max = 25, duration = 1, area = 10 },
    },
  },
  shockbloom = {
    name = "Shockbloom", cost = 36,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 10, max = 15, duration = 4, area = 5 },
    },
  },
  shockguard = {
    name = "Shockguard", cost = 60,
    effects = {
      { id = tes3.effect.resistShock, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["shocking touch"] = {
    name = "Shocking Touch", cost = 15,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 15, max = 25, duration = 2, area = 10 },
    },
  },
  silence = {
    name = "Silence", cost = 12,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.touch, min = 1, max = 1, duration = 15 },
    },
  },
  ["sixth barrier"] = {
    name = "Sixth Barrier", cost = 72,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 60, max = 60, duration = 40 },
    },
  },
  skillmephala_sp = {
    name = "Mephala's Skill", cost = 5, always_succeeds = true,
    effects = {
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.block, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.unarmored, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.armorer, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.alchemy, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.sneak, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.athletics, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
      { id = tes3.effect.fortifySkill, skill = tes3.skill.acrobatics, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  sleep = {
    name = "Sleep", cost = 45,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.touch, min = 1000, max = 1000, duration = 10 },
    },
  },
  slowfall = {
    name = "Slowfall", cost = 3,
    effects = {
      { id = tes3.effect.slowFall, range = tes3.effectRange.self, min = 1, max = 1, duration = 30 },
    },
  },
  ["smite the ungodly"] = {
    name = "Smite the Ungodly", cost = 54, auto_calc = true,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 30, max = 100, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 50, max = 75, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 50, max = 75, duration = 1 },
    },
  },
  ["soothe the savage beast"] = {
    name = "Calm Beast", cost = 12,
    effects = {
      { id = tes3.effect.calmCreature, range = tes3.effectRange.touch, min = 10, max = 10, duration = 10 },
    },
  },
  ["sotha's grace"] = {
    name = "Sotha's Grace", cost = 24,
    effects = {
      { id = tes3.effect.sanctuary, range = tes3.effectRange.self, min = 25, max = 25, duration = 20 },
    },
  },
  ["sotha's mirror"] = {
    name = "Sotha's Mirror", cost = 5,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 25, max = 25, duration = 10 },
    },
  },
  ["soul trap"] = {
    name = "Soul Trap", cost = 10,
    effects = {
      { id = tes3.effect.soultrap, range = tes3.effectRange.touch, min = 1, max = 1, duration = 20 },
    },
  },
  soulpinch = {
    name = "Soulpinch", cost = 15,
    effects = {
      { id = tes3.effect.damageMagicka, range = tes3.effectRange.touch, min = 60, max = 60, duration = 1 },
    },
  },
  spark = {
    name = "Spark", cost = 8,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 8, max = 10, duration = 1 },
    },
  },
  ["spell absorption"] = {
    name = "Spell Absorption", cost = 5,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 25, max = 25, duration = 10 },
    },
  },
  ["spell drain"] = {
    name = "Spell Drain", cost = 39, auto_calc = true,
    effects = {
      { id = tes3.effect.damageMagicka, range = tes3.effectRange.target, min = 25, max = 50, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 5, max = 5, duration = 5 },
    },
  },
  ["sphere of negation"] = {
    name = "Sphere of Negation", cost = 30,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 75, max = 75, duration = 10, area = 15 },
    },
  },
  ["spirit knife"] = {
    name = "Spirit Knife", cost = 7,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 15, max = 15, duration = 1 },
    },
  },
  spite = {
    name = "Spite", cost = 5,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["spite touch"] = {
    name = "Spite Touch", cost = 3,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  stamina = {
    name = "Stamina", cost = 30,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 20, max = 20, duration = 60 },
    },
  },
  sting = {
    name = "Sting", cost = 12, auto_calc = true,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 5, max = 6, duration = 5 },
    },
  },
  stormhand = {
    name = "Stormhand", cost = 9,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 10, max = 10, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1, area = 10 },
    },
  },
  strain = {
    name = "Strain", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["straining touch"] = {
    name = "Straining Touch", cost = 10,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  ["strength leech"] = {
    name = "Strength Leech", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 20, max = 40, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 20, max = 40, duration = 30 },
    },
  },
  ["strong feather"] = {
    name = "Strong Feather", cost = 6,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 100, max = 100, duration = 120 },
    },
  },
  ["strong fire shield"] = {
    name = "Strong Fire Shield", cost = 45,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 30, max = 30, duration = 40 },
    },
  },
  ["strong frost shield"] = {
    name = "Strong Frost Shield", cost = 45,
    effects = {
      { id = tes3.effect.frostShield, range = tes3.effectRange.self, min = 30, max = 30, duration = 40 },
    },
  },
  ["strong heal companion"] = {
    name = "Strong Heal Companion", cost = 18,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 80, max = 80, duration = 1 },
    },
  },
  ["strong levitate"] = {
    name = "Strong Levitate", cost = 12,
    effects = {
      { id = tes3.effect.levitate, range = tes3.effectRange.self, min = 30, max = 50, duration = 20 },
    },
  },
  ["strong open"] = {
    name = "Strong Open", cost = 14,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 50, max = 50, duration = 1 },
    },
  },
  ["strong reflect"] = {
    name = "Strong Reflect", cost = 18,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 25, max = 25, duration = 30 },
    },
  },
  ["strong resist fire"] = {
    name = "Strong Resist Fire", cost = 24,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["strong resist frost"] = {
    name = "Strong Resist Frost", cost = 24,
    effects = {
      { id = tes3.effect.resistFrost, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["strong resist magicka"] = {
    name = "Strong Resist Magicka", cost = 24,
    effects = {
      { id = tes3.effect.resistMagicka, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["strong resist poison"] = {
    name = "Strong Resist Poison", cost = 24,
    effects = {
      { id = tes3.effect.resistPoison, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["strong resist shock"] = {
    name = "Strong Resist Shock", cost = 24,
    effects = {
      { id = tes3.effect.resistShock, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["strong shock shield"] = {
    name = "Strong Lightning Shield", cost = 45,
    effects = {
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 30, max = 30, duration = 40 },
    },
  },
  ["strong spelldrinker"] = {
    name = "Strong Spelldrinker", cost = 18,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 25, max = 25, duration = 30 },
    },
  },
  stumble = {
    name = "Stumble", cost = 10,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  ["summon ancestral ghost"] = {
    name = "Summon Ancestral Ghost", cost = 21, auto_calc = true,
    effects = {
      { id = tes3.effect.summonAncestralGhost, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  ["Swimmer's_Blessing"] = {
    name = "Swimmer's Blessing", cost = 9,
    effects = {
      { id = tes3.effect.swiftSwim, range = tes3.effectRange.self, min = 60, max = 60, duration = 60 },
    },
  },
  ["Tap Energy"] = {
    name = "Tap Energy", cost = 30,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 20, max = 20, duration = 30 },
    },
  },
  telekinesis = {
    name = "Telekinesis", cost = 9, start_spell = true,
    effects = {
      { id = tes3.effect.telekinesis, range = tes3.effectRange.self, min = 10, max = 10, duration = 10 },
    },
  },
  temptation = {
    name = "Temptation", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["tempting touch"] = {
    name = "Tempting Touch", cost = 10,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  ["tevral's hawkshaw"] = {
    name = "Tevral's Hawkshaw", cost = 3,
    effects = {
      { id = tes3.effect.detectKey, range = tes3.effectRange.self, min = 100, max = 100, duration = 20 },
      { id = tes3.effect.detectEnchantment, range = tes3.effectRange.self, min = 100, max = 100, duration = 20 },
      { id = tes3.effect.detectAnimal, range = tes3.effectRange.self, min = 100, max = 100, duration = 20 },
    },
  },
  ["third barrier"] = {
    name = "Third Barrier", cost = 36,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 30, max = 30, duration = 40 },
    },
  },
  ["tinur's hoptoad"] = {
    name = "Tinur's Hoptoad", cost = 15,
    effects = {
      { id = tes3.effect.jump, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
    },
  },
  torpor = {
    name = "Torpor", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["torpor touch"] = {
    name = "Torpor Touch", cost = 10,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  ["touch dispel"] = {
    name = "Touch Dispel", cost = 6,
    effects = {
      { id = tes3.effect.dispel, range = tes3.effectRange.touch, min = 100, max = 100, duration = 1 },
    },
  },
  ["tranasa's spelltrap"] = {
    name = "Tranasa's Spelltrap", cost = 30,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 75, max = 75, duration = 10 },
    },
  },
  ["Troll Strength"] = {
    name = "Troll Strength", cost = 30,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 20, max = 40, duration = 60 },
    },
  },
  ["troll's blood"] = {
    name = "Troll's Blood", cost = 30,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 5, max = 5, duration = 60 },
    },
  },
  ["turn of the wheel"] = {
    name = "Turn of the Wheel", cost = 15,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["turn undead"] = {
    name = "Turn Undead", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.turnUndead, range = tes3.effectRange.touch, min = 50, max = 50, duration = 20 },
    },
  },
  ["ulms juicedaw's feather"] = {
    name = "Ulms' Juicedaw Feather", cost = 15,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 500, max = 500, duration = 60 },
    },
  },
  ["variable resist common disease"] = {
    name = "Strong Resist Disease", cost = 6,
    effects = {
      { id = tes3.effect.resistCommonDisease, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  ["variable resist fire"] = {
    name = "Variable Resist Fire", cost = 12,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["variable resist frost"] = {
    name = "Variable Resist Frost", cost = 12,
    effects = {
      { id = tes3.effect.resistFrost, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["variable resist magicka"] = {
    name = "Variable Resist Magicka", cost = 12,
    effects = {
      { id = tes3.effect.resistMagicka, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["variable resist poison"] = {
    name = "Variable Resist Poison", cost = 12,
    effects = {
      { id = tes3.effect.resistPoison, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["variable resist shock"] = {
    name = "Variable Resist Shock", cost = 12,
    effects = {
      { id = tes3.effect.resistShock, range = tes3.effectRange.self, min = 10, max = 20, duration = 60 },
    },
  },
  ["veloth's benison"] = {
    name = "Veloth's Benison", cost = 12,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 10, max = 10, duration = 5 },
    },
  },
  ["veloth's gift"] = {
    name = "Veloth's Gift", cost = 6,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 10, max = 10, duration = 3 },
    },
  },
  ["veloth's grace"] = {
    name = "Veloth's Grace", cost = 9,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 10, max = 10, duration = 4 },
    },
  },
  vigor = {
    name = "Vigor", cost = 30,
    effects = {
      { id = tes3.effect.fortifyFatigue, range = tes3.effectRange.self, min = 50, max = 50, duration = 60 },
    },
  },
  viper = {
    name = "Viper", cost = 57, auto_calc = true,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 7, max = 10, duration = 15 },
    },
  },
  viperbite = {
    name = "Viperbite", cost = 19, auto_calc = true,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 7, max = 10, duration = 5 },
    },
  },
  viperbolt = {
    name = "Viperbolt", cost = 24,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.target, min = 20, max = 35, duration = 2, area = 5 },
    },
  },
  vitality = {
    name = "Vitality", cost = 15,
    effects = {
      { id = tes3.effect.fortifyHealth, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  ["vivec's feast"] = {
    name = "Vivec's Feast", cost = 15,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 50, max = 50, duration = 10 },
    },
  },
  ["vivec's kiss"] = {
    name = "Vivec's Kiss", cost = 6,
    effects = {
      { id = tes3.effect.waterBreathing, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  ["vivec's mercy"] = {
    name = "Vivec's Mercy", cost = 9,
    effects = {
      { id = tes3.effect.resistBlightDisease, range = tes3.effectRange.self, min = 75, max = 75, duration = 60 },
    },
  },
  ["vivec's tears"] = {
    name = "Vivec's Tears", cost = 60,
    effects = {
      { id = tes3.effect.cureBlightDisease, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 240, max = 240, duration = 1 },
    },
  },
  ["vivec's_wrath"] = {
    name = "Vivec's Wrath", cost = 38, auto_calc = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 30, max = 30, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 30, max = 30, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 30, max = 30, duration = 1 },
    },
  },
  ["water breathing"] = {
    name = "Water Breathing", cost = 3,
    effects = {
      { id = tes3.effect.waterBreathing, range = tes3.effectRange.self, min = 1, max = 1, duration = 20 },
    },
  },
  ["water walking"] = {
    name = "Water Walking", cost = 6,
    effects = {
      { id = tes3.effect.waterWalking, range = tes3.effectRange.self, min = 1, max = 1, duration = 30 },
    },
  },
  ["weak spelldrinker"] = {
    name = "Spelldrinker", cost = 6,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  ["weakening touch"] = {
    name = "Weakening Touch", cost = 10,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 10, max = 30, duration = 30 },
    },
  },
  weakness = {
    name = "Weakness", cost = 15,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 10, max = 30, duration = 30 },
    },
  },
  ["weakness to common disease"] = {
    name = "Weakness to Disease", cost = 3,
    effects = {
      { id = tes3.effect.weaknesstoCommonDisease, range = tes3.effectRange.self, min = 100, max = 100, duration = 60 },
    },
  },
  ["weakness to fire"] = {
    name = "Weakness to Fire", cost = 15,
    effects = {
      { id = tes3.effect.weaknesstoFire, range = tes3.effectRange.target, min = 20, max = 30, duration = 15, area = 10 },
    },
  },
  ["weakness to frost"] = {
    name = "Weakness to Frost", cost = 15,
    effects = {
      { id = tes3.effect.weaknesstoFrost, range = tes3.effectRange.target, min = 20, max = 30, duration = 15, area = 10 },
    },
  },
  ["weakness to magicka"] = {
    name = "Weakness to Magicka", cost = 15,
    effects = {
      { id = tes3.effect.weaknesstoMagicka, range = tes3.effectRange.target, min = 20, max = 30, duration = 15, area = 10 },
    },
  },
  ["weakness to poison"] = {
    name = "Weakness to Poison", cost = 15,
    effects = {
      { id = tes3.effect.weaknesstoPoison, range = tes3.effectRange.target, min = 20, max = 30, duration = 15, area = 10 },
    },
  },
  ["weakness to shock"] = {
    name = "Weakness to Shock", cost = 15,
    effects = {
      { id = tes3.effect.weaknesstoShock, range = tes3.effectRange.target, min = 20, max = 30, duration = 15, area = 10 },
    },
  },
  ["weapon eater"] = {
    name = "Weapon Eater", cost = 15,
    effects = {
      { id = tes3.effect.disintegrateWeapon, range = tes3.effectRange.touch, min = 400, max = 600, duration = 1 },
    },
  },
  weariness = {
    name = "Weariness", cost = 12,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.target, min = 100, max = 200, duration = 20, area = 10 },
    },
  },
  weary = {
    name = "Weary", cost = 9,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.target, min = 100, max = 200, duration = 10 },
    },
  },
  ["wearying touch"] = {
    name = "Wearying Touch", cost = 6,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.touch, min = 100, max = 200, duration = 10 },
    },
  },
  ["weeping wound"] = {
    name = "Weeping Wound", cost = 18,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 40, max = 60, duration = 10 },
    },
  },
  ["wild clumsiness"] = {
    name = "Wild Clumsiness", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 20, max = 40, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 20, max = 40, duration = 30 },
    },
  },
  ["wild distraction"] = {
    name = "Wild Distraction", cost = 6,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild earwig"] = {
    name = "Wild Earwig", cost = 33,
    effects = {
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 50, max = 50, duration = 10 },
    },
  },
  ["wild exhaustion"] = {
    name = "Wild Exhaustion", cost = 60,
    effects = {
      { id = tes3.effect.drainFatigue, range = tes3.effectRange.target, min = 300, max = 400, duration = 10, area = 10 },
    },
  },
  ["wild flay spirit"] = {
    name = "Wild Flay Spirit", cost = 25,
    effects = {
      { id = tes3.effect.drainMagicka, range = tes3.effectRange.target, min = 80, max = 160, duration = 30 },
    },
  },
  ["wild levitate"] = {
    name = "Wild Levitate", cost = 24,
    effects = {
      { id = tes3.effect.levitate, range = tes3.effectRange.self, min = 70, max = 90, duration = 20 },
    },
  },
  ["wild misfortune"] = {
    name = "Wild Misfortune", cost = 6,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild open"] = {
    name = "Wild Open", cost = 30,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 100, max = 100, duration = 1 },
    },
  },
  ["wild reflect"] = {
    name = "Wild Reflect", cost = 36,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  ["wild shockbloom"] = {
    name = "Wild Shockbloom", cost = 35,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 5, max = 20, duration = 5, area = 15 },
    },
  },
  ["wild spelldrinker"] = {
    name = "Wild Spelldrinker", cost = 36,
    effects = {
      { id = tes3.effect.spellAbsorption, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  ["wild spite"] = {
    name = "Wild Spite", cost = 6,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild strain"] = {
    name = "Wild Strain", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild temptation"] = {
    name = "Wild Temptation", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild torpor"] = {
    name = "Wild Torpor", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.target, min = 20, max = 60, duration = 30 },
    },
  },
  ["wild weakness"] = {
    name = "Wild Weakness", cost = 30,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 20, max = 60, duration = 20 },
    },
  },
  ["wild weeping wound"] = {
    name = "Wild Weeping Wound", cost = 24,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 60, max = 90, duration = 10 },
    },
  },
  wisdom = {
    name = "Wisdom", cost = 15,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.self, min = 10, max = 10, duration = 60 },
    },
  },
  ["wizard rend"] = {
    name = "Wizard Rend", cost = 53, auto_calc = true,
    effects = {
      { id = tes3.effect.damageMagicka, range = tes3.effectRange.target, min = 25, max = 75, duration = 1 },
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.target, min = 50, max = 100, duration = 1 },
    },
  },
  ["wizard's fire"] = {
    name = "Wizard's Fire", cost = 68, auto_calc = true,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.target, min = 50, max = 75, duration = 1 },
      { id = tes3.effect.damageMagicka, range = tes3.effectRange.target, min = 25, max = 75 },
    },
  },
  woe = {
    name = "Woe", cost = 10,
    effects = {
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.touch, min = 10, max = 20, duration = 1 },
    },
  },
  wound = {
    name = "Wound", cost = 9,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 20, max = 30, duration = 10 },
    },
  },
  ["wounding touch"] = {
    name = "Wounding Touch", cost = 6,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.touch, min = 20, max = 30, duration = 10 },
    },
  },
  Zenithar_gospel = {
    name = "Zenithar's Gospel", cost = 15,
    effects = {
      { id = tes3.effect.curePoison, range = tes3.effectRange.touch, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.touch, min = 20, max = 20, duration = 3 },
    },
  },

  ---------------------------------------------------------------------------
  -- Spells the mod adds
  ---------------------------------------------------------------------------
  a_ve_basicsp_cacr_01 = {
    name = "Potent Calm Creature", cost = 10,
    effects = {
      { id = tes3.effect.calmCreature, range = tes3.effectRange.touch, min = 20, max = 20, duration = 10 },
    },
  },
  a_ve_basicsp_cahu_01 = {
    name = "Basic Calm", cost = 3,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.touch, min = 5, max = 5, duration = 10 },
    },
  },
  a_ve_basicsp_cahu_02 = {
    name = "Potent Calm", cost = 8,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.touch, min = 15, max = 15, duration = 10 },
    },
  },
  a_ve_basicsp_cahu_03 = {
    name = "Supreme Calm", cost = 15,
    effects = {
      { id = tes3.effect.calmHumanoid, range = tes3.effectRange.touch, min = 30, max = 30, duration = 10 },
    },
  },
  a_ve_basicsp_decr_01 = {
    name = "Potent Demoralize Creature", cost = 15,
    effects = {
      { id = tes3.effect.demoralizeCreature, range = tes3.effectRange.target, min = 20, max = 20, duration = 10 },
    },
  },
  a_ve_basicsp_dehu_01 = {
    name = "Potent Demoralize", cost = 11,
    effects = {
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 15, max = 15, duration = 10 },
    },
  },
  a_ve_basicsp_dehu_02 = {
    name = "Supreme Demoralize", cost = 23,
    effects = {
      { id = tes3.effect.demoralizeHumanoid, range = tes3.effectRange.target, min = 30, max = 30, duration = 10 },
    },
  },
  a_ve_basicsp_frcr_01 = {
    name = "Potent Frenzy Creature", cost = 5,
    effects = {
      { id = tes3.effect.frenzyCreature, range = tes3.effectRange.target, min = 20, max = 20, duration = 10 },
    },
  },
  a_ve_basicsp_frhu_01 = {
    name = "Basic Frenzy", cost = 5,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 5, max = 5, duration = 10 },
    },
  },
  a_ve_basicsp_frhu_02 = {
    name = "Potent Frenzy", cost = 16,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 15, max = 15, duration = 10 },
    },
  },
  a_ve_basicsp_frhu_03 = {
    name = "Supreme Frenzy", cost = 32,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 30, max = 30, duration = 10 },
    },
  },
  a_ve_basicsp_light_01 = {
    name = "Great Light", cost = 15,
    effects = {
      { id = tes3.effect.light, range = tes3.effectRange.self, min = 30, max = 30, duration = 60 },
    },
  },
  a_ve_basicsp_renw_01 = {
    name = "Resist Normal Weapons", cost = 15,
    effects = {
      { id = tes3.effect.resistNormalWeapons, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  a_ve_startsp_alt_01 = {
    name = "Basic Feather", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 40, max = 40, duration = 60 },
    },
  },
  a_ve_startsp_alt_02 = {
    name = "Wavestep", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.waterWalking, range = tes3.effectRange.self, min = 1, max = 1, duration = 10 },
    },
  },
  a_ve_startsp_con_01 = {
    name = "Skeletal Servant", cost = 7, start_spell = true,
    effects = {
      { id = tes3.effect.summonSkeletalMinion, range = tes3.effectRange.self, min = 1, max = 1, duration = 20 },
    },
  },
  a_ve_startsp_ilu_01 = {
    name = "Basic Light", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.light, range = tes3.effectRange.self, min = 10, max = 10, duration = 10 },
    },
  },
  a_ve_startsp_resto_01 = {
    name = "Heal Minor Wounds", cost = 5, start_spell = true,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 5, max = 5, duration = 3 },
    },
  },
  a_ve_uniqsp_01_lifetap = {
    name = "Life Tap", cost = 10,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.self, min = 2, max = 3, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.self, min = 2, max = 3, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.self, min = 2, max = 3, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.self, min = 2, max = 3, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 2, max = 3, duration = 1 },
      { id = tes3.effect.restoreMagicka, range = tes3.effectRange.self, min = 25, max = 25, duration = 1 },
    },
  },
  a_ve_uniqsp_02_dragonbite = {
    name = "Dragonbite", cost = 15,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 30, max = 30, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 10, max = 10, duration = 1 },
    },
  },
  a_ve_uniqsp_03_drakeguard = {
    name = "Drakeguard", cost = 22,
    effects = {
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 35, max = 35, duration = 20 },
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 35, max = 35, duration = 20 },
    },
  },
  a_ve_uniqsp_04_sumrit = {
    name = "Summoning Rites", cost = 25,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.conjuration, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 20, max = 20, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.self, min = 3, max = 3, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.self, min = 3, max = 3, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.self, min = 3, max = 3, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 3, max = 3, duration = 1 },
    },
  },
  a_ve_uniqsp_05_fireball = {
    name = "Marayn's Fireball", cost = 11,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 15, max = 15, duration = 1, area = 5 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 5, max = 5, duration = 5, area = 5 },
    },
  },
  a_ve_uniqsp_06_burden = {
    name = "Burden of Condemnation", cost = 28,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 500, max = 500, duration = 20 },
    },
  },
  a_ve_uniqsp_07_panacea = {
    name = "Panacea", cost = 22,
    effects = {
      { id = tes3.effect.cureBlightDisease, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.cureCommonDisease, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
    },
  },
  a_ve_uniqsp_08_manaleech = {
    name = "Manaleech", cost = 23,
    effects = {
      { id = tes3.effect.absorbMagicka, range = tes3.effectRange.touch, min = 4, max = 4, duration = 30 },
    },
  },
  a_ve_uniqsp_09_waterstrider = {
    name = "Water Strider", cost = 11,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 3, max = 3, duration = 60 },
      { id = tes3.effect.waterWalking, range = tes3.effectRange.self, min = 1, max = 1, duration = 60 },
    },
  },
  a_ve_uniqsp_10_absarmor = {
    name = "Absorb Armor", cost = 15,
    effects = {
      { id = tes3.effect.absorbSkill, skill = tes3.skill.lightArmor, range = tes3.effectRange.touch, min = 30, max = 30, duration = 40 },
      { id = tes3.effect.absorbSkill, skill = tes3.skill.mediumArmor, range = tes3.effectRange.touch, min = 30, max = 30, duration = 40 },
      { id = tes3.effect.absorbSkill, skill = tes3.skill.heavyArmor, range = tes3.effectRange.touch, min = 30, max = 30, duration = 40 },
    },
  },
  a_ve_uniqsp_11_foolsleap = {
    name = "Fool's Leap", cost = 25,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.acrobatics, range = tes3.effectRange.self, min = 1000, max = 1000, duration = 7 },
    },
  },
  a_ve_uniqsp_12_pray_la = {
    name = "Prayer of Nimbleness", cost = 13,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.lightArmor, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  a_ve_uniqsp_13_pray_ma = {
    name = "Prayer of Sturdiness", cost = 13,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.mediumArmor, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  a_ve_uniqsp_14_pray_ha = {
    name = "Prayer of Toughness", cost = 13,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.heavyArmor, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  a_ve_uniqsp_15_lifetapgr = {
    name = "Greater Life Tap", cost = 20,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.restoreMagicka, range = tes3.effectRange.self, min = 40, max = 40, duration = 1 },
    },
  },
  a_ve_uniqsp_16_discountmark = {
    name = "Discount Mark", cost = 12,
    effects = {
      { id = tes3.effect.mark, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.self, min = 10, max = 10, duration = 1 },
    },
  },
  a_ve_uniqsp_17_discountrecall = {
    name = "Discount Recall", cost = 12,
    effects = {
      { id = tes3.effect.recall, range = tes3.effectRange.self, min = 1, max = 1, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 10, max = 10, duration = 1 },
    },
  },
  a_ve_uniqsp_18_fortifyall = {
    name = "Ancestral Blessing", cost = 34,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.endurance, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.luck, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 50, max = 50, duration = 25 },
    },
  },
  a_ve_uniqsp_19_aquaform = {
    name = "Aquatic Form", cost = 12,
    effects = {
      { id = tes3.effect.waterBreathing, range = tes3.effectRange.self, min = 1, max = 1, duration = 30 },
      { id = tes3.effect.swiftSwim, range = tes3.effectRange.self, min = 40, max = 40, duration = 30 },
    },
  },
  a_ve_uniqsp_20_vampiricform = {
    name = "Vampiric Form", cost = 25,
    effects = {
      { id = tes3.effect.resistNormalWeapons, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.weaknesstoFire, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.resistParalysis, range = tes3.effectRange.self, min = 100, max = 100, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
    },
  },
  a_ve_uniqsp_21_mehrunesprot = {
    name = "Mehrune's Protection", cost = 28,
    effects = {
      { id = tes3.effect.boundShield, range = tes3.effectRange.self, min = 1, max = 1, duration = 30 },
      { id = tes3.effect.resistFire, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.resistNormalWeapons, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  a_ve_uniqsp_22_giftofmana = {
    name = "Gift of Mana", cost = 10,
    effects = {
      { id = tes3.effect.restoreMagicka, range = tes3.effectRange.touch, min = 100, max = 100, duration = 1 },
    },
  },
  a_ve_uniqsp_23_manawell = {
    name = "Mana Well", cost = 24,
    effects = {
      { id = tes3.effect.restoreMagicka, range = tes3.effectRange.self, min = 2, max = 2, duration = 30 },
    },
  },
  a_ve_uniqsp_24_chaoticspark = {
    name = "Chaotic Spark", cost = 15,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 1, max = 10, duration = 3, area = 5 },
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.target, min = 1, max = 20, duration = 3, area = 5 },
    },
  },
  a_ve_uniqsp_25_blackstorm = {
    name = "Black Storm", cost = 24,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.target, min = 6, max = 6, duration = 10, area = 50 },
    },
  },
  a_ve_uniqsp_26_curseoftheproud = {
    name = "Curse of the Proud", cost = 18,
    effects = {
      { id = tes3.effect.weaknesstoNormalWeapons, range = tes3.effectRange.touch, min = 100, max = 100, duration = 20 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.touch, min = 50, max = 50, duration = 20 },
    },
  },
  a_ve_uniqsp_27_annihilatearmor = {
    name = "Annihilate Armor", cost = 29,
    effects = {
      { id = tes3.effect.disintegrateArmor, range = tes3.effectRange.target, min = 1250, max = 1250, duration = 4 },
    },
  },
  a_ve_uniqsp_28_gravecurse = {
    name = "Grave Curse", cost = 25,
    effects = {
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.target, min = 50, max = 50, duration = 30 },
    },
  },
  a_ve_uniqsp_29_pray_bl = {
    name = "Prayer of Vigilance", cost = 13,
    effects = {
      { id = tes3.effect.fortifySkill, skill = tes3.skill.block, range = tes3.effectRange.self, min = 25, max = 25, duration = 60 },
    },
  },
  a_ve_uniqsp_30_chaoticshockst = {
    name = "Chaotic Shockstorm", cost = 26,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 1, max = 25, duration = 5, area = 50 },
    },
  },
  a_ve_uniqsp_31_desperateprayer = {
    name = "Desperate Prayer", cost = 29,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 250, max = 250, duration = 1 },
    },
  },
  a_ve_uniqsp_32_blackspite = {
    name = "Black Spite", cost = 17,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.target, min = 20, max = 20, duration = 3 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.self, min = 2, max = 2, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.self, min = 2, max = 2, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.self, min = 2, max = 2, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 2, max = 2, duration = 1 },
      { id = tes3.effect.damageHealth, range = tes3.effectRange.self, min = 2, max = 2, duration = 1 },
    },
  },
  a_ve_uniqsp_33_vespite = {
    name = "Vehement Spite", cost = 28,
    effects = {
      { id = tes3.effect.damageHealth, range = tes3.effectRange.target, min = 40, max = 40, duration = 3 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
      { id = tes3.effect.damageHealth, range = tes3.effectRange.self, min = 4, max = 4, duration = 1 },
    },
  },
  a_ve_uniqsp_34_hardenbone = {
    name = "Harden Bones", cost = 20,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.touch, min = 75, max = 75, duration = 20 },
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 60, max = 60, duration = 1 },
    },
  },
  a_ve_uniqsp_35_livingbomb = {
    name = "Living Bomb", cost = 18,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 5, max = 5, duration = 10 },
      { id = tes3.effect.damageHealth, range = tes3.effectRange.touch, min = 5, max = 5, duration = 10 },
      { id = tes3.effect.weaknesstoFire, range = tes3.effectRange.touch, min = 50, max = 50, duration = 20 },
      { id = tes3.effect.fireShield, range = tes3.effectRange.touch, min = 50, max = 50, duration = 20 },
    },
  },
  a_ve_uniqsp_36_holyfire = {
    name = "Holy Fire [Restoration]", cost = 28,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 20, max = 20, duration = 5, area = 15 },
    },
  },
  a_ve_uniqsp_37_smite = {
    name = "Smite [Restoration]", cost = 22,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 25, max = 25, duration = 1 },
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 25, max = 25, duration = 1 },
    },
  },
  a_ve_uniqsp_38_handofjustice = {
    name = "Hand of Justice [Restoration]", cost = 19,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 30, max = 30, duration = 1 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 10, max = 10, duration = 5 },
    },
  },
  a_ve_uniqsp_39_berserk = {
    name = "Berserk", cost = 14,
    effects = {
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 30, max = 30, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 20, max = 20, duration = 30 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.lightArmor, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.mediumArmor, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.heavyArmor, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  a_ve_uniqsp_40_burstofspeed = {
    name = "Burst of Speed", cost = 23,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 250, max = 250, duration = 3 },
    },
  },
  a_ve_uniqsp_41_coupdegrace = {
    name = "Coup de Gr\226ce", cost = 30,
    effects = {
      { id = tes3.effect.drainHealth, range = tes3.effectRange.target, min = 300, max = 300, duration = 1 },
      { id = tes3.effect.silence, range = tes3.effectRange.self, min = 1, max = 1, duration = 30 },
    },
  },
  a_ve_uniqsp_42_fightingprowess = {
    name = "Fighting Prowess", cost = 13,
    effects = {
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 20, max = 20, duration = 20 },
      { id = tes3.effect.sanctuary, range = tes3.effectRange.self, min = 10, max = 10, duration = 20 },
    },
  },
  a_ve_uniqsp_43_warriorblessing = {
    name = "Warrior's Blessing", cost = 14,
    effects = {
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 15, max = 15, duration = 20 },
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 8, max = 8, duration = 20 },
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 3, max = 3, duration = 20 },
    },
  },
  a_ve_uniqsp_44_akamiblessing = {
    name = "Akami's Blessing", cost = 12,
    effects = {
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 5, max = 5, duration = 300 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.self, min = 5, max = 5, duration = 300 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.speed, range = tes3.effectRange.self, min = 5, max = 5, duration = 300 },
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 2, max = 2, duration = 300 },
    },
  },
  a_ve_uniqsp_45_incompetence = {
    name = "Incompetence", cost = 13,
    effects = {
      { id = tes3.effect.drainSkill, skill = tes3.skill.axe, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.bluntWeapon, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.handToHand, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.longBlade, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.marksman, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.shortBlade, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
      { id = tes3.effect.drainSkill, skill = tes3.skill.spear, range = tes3.effectRange.touch, min = 35, max = 35, duration = 80 },
    },
  },
  a_ve_uniqsp_46_counterspell = {
    name = "Counterspell", cost = 20,
    effects = {
      { id = tes3.effect.reflect, range = tes3.effectRange.self, min = 100, max = 100, duration = 4 },
    },
  },
  a_ve_uniqsp_47_bargainopen = {
    name = "Bargain Open", cost = 10,
    effects = {
      { id = tes3.effect.open, range = tes3.effectRange.touch, min = 50, max = 50, duration = 1 },
      { id = tes3.effect.damageAttribute, attribute = tes3.attribute.personality, range = tes3.effectRange.self, min = 15, max = 15, duration = 1 },
    },
  },
  a_ve_uniqsp_48_paralyzer = {
    name = "Paralyzer", cost = 32,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 20 },
    },
  },
  a_ve_uniqsp_49_c1_frost = {
    name = "Cycle of Elements: Chill", cost = 14,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 4, max = 4, duration = 7 },
      { id = tes3.effect.weaknesstoShock, range = tes3.effectRange.target, min = 25, max = 25, duration = 10 },
    },
  },
  a_ve_uniqsp_50_c2_shock = {
    name = "Cycle of Elements: Shock", cost = 14,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 12, max = 12, duration = 2 },
      { id = tes3.effect.weaknesstoFire, range = tes3.effectRange.target, min = 25, max = 25, duration = 20 },
    },
  },
  a_ve_uniqsp_51_c3_fire = {
    name = "Cycle of Elements: Fire", cost = 14,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 4, max = 4, duration = 10 },
      { id = tes3.effect.weaknesstoFrost, range = tes3.effectRange.target, min = 25, max = 25, duration = 10 },
    },
  },
  a_ve_uniqsp_52_exhaustfrost = {
    name = "Exhausting Frost", cost = 12,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 25, max = 25, duration = 1 },
      { id = tes3.effect.damageFatigue, range = tes3.effectRange.touch, min = 50, max = 50, duration = 1 },
    },
  },
  a_ve_uniqsp_53_murderous_i = {
    name = "Murderous Intent", cost = 25,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 20, max = 20, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.target, min = 100, max = 100, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.agility, range = tes3.effectRange.target, min = 100, max = 100, duration = 30 },
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.target, min = 50, max = 50, duration = 30 },
    },
  },
  a_ve_uniqsp_54_aoefrenzy = {
    name = "Insanity Cloud", cost = 32,
    effects = {
      { id = tes3.effect.frenzyHumanoid, range = tes3.effectRange.target, min = 20, max = 20, duration = 10, area = 50 },
    },
  },
  a_ve_uniqsp_55_crabbless = {
    name = "Crab's Blessing", cost = 17,
    effects = {
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 2000, max = 2000, duration = 300 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 100, max = 100, duration = 300 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.willpower, range = tes3.effectRange.self, min = 100, max = 100, duration = 300 },
      { id = tes3.effect.drainAttribute, attribute = tes3.attribute.intelligence, range = tes3.effectRange.self, min = 100, max = 100, duration = 300 },
    },
  },
  a_ve_uniqsp_56_retrishield = {
    name = "Holy Retribution [Restoration]", cost = 25,
    effects = {
      { id = tes3.effect.fireShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
      { id = tes3.effect.lightningShield, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  a_ve_uniqsp_57_frostfist = {
    name = "Frost Fist", cost = 32,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 100, max = 100, duration = 2 },
    },
  },
  a_ve_uniqsp_58_wizprank = {
    name = "Wizard's Prank", cost = 15,
    effects = {
      { id = tes3.effect.levitate, range = tes3.effectRange.target, min = 1, max = 1, duration = 20 },
    },
  },
  a_ve_uniqsp_59_blindrage = {
    name = "Blind Rage", cost = 15,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.self, min = 75, max = 75, duration = 30 },
      { id = tes3.effect.fortifyAttack, range = tes3.effectRange.self, min = 125, max = 125, duration = 30 },
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 10, max = 10, duration = 30 },
    },
  },
  a_ve_uniqsp_60_noillness = {
    name = "Repel Disease", cost = 15,
    effects = {
      { id = tes3.effect.resistBlightDisease, range = tes3.effectRange.self, min = 100, max = 100, duration = 600 },
      { id = tes3.effect.resistCommonDisease, range = tes3.effectRange.self, min = 100, max = 100, duration = 600 },
    },
  },
  a_ve_uniqsp_61_legichrg = {
    name = "Charge of the Legion", cost = 24,
    effects = {
      { id = tes3.effect.fortifyAttribute, attribute = tes3.attribute.strength, range = tes3.effectRange.self, min = 35, max = 35, duration = 40 },
      { id = tes3.effect.feather, range = tes3.effectRange.self, min = 300, max = 300, duration = 40 },
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 4, max = 4, duration = 40 },
    },
  },
  a_ve_uniqsp_62_flamehf = {
    name = "Flame of the Hearthfire", cost = 34,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 60, max = 60, duration = 1, area = 10 },
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 12, max = 12, duration = 10, area = 10 },
    },
  },
  a_ve_uniqsp_63_melamed = {
    name = "Melancholy Medicine", cost = 34,
    effects = {
      { id = tes3.effect.poison, range = tes3.effectRange.touch, min = 43, max = 49, duration = 6, area = 5 },
      { id = tes3.effect.poison, range = tes3.effectRange.self, min = 43, max = 49, duration = 6 },
    },
  },
  a_ve_uniqsp_64_sparkmaster = {
    name = "Master's Spark", cost = 35,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 75, max = 75, duration = 1, area = 50 },
    },
  },
  a_ve_uniqsp_65_manaspark = {
    name = "Absorbing Spark", cost = 16,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 25, max = 25, duration = 1 },
      { id = tes3.effect.absorbMagicka, range = tes3.effectRange.target, min = 5, max = 5, duration = 1 },
    },
  },
  ["NPC Absorb Fatigue 1"] = {
    name = "Consume Fatigue", cost = 10, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 5, max = 5, duration = 10 },
    },
  },
  ["NPC Absorb Fatigue 2"] = {
    name = "Drain Fatigue", cost = 20, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 5, max = 5, duration = 20 },
    },
  },
  ["NPC Absorb Fatigue 3"] = {
    name = "Leech Fatigue", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 5, max = 5, duration = 30 },
    },
  },
  ["NPC Absorb Fatigue 4"] = {
    name = "Devour Fatigue", cost = 40, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbFatigue, range = tes3.effectRange.touch, min = 5, max = 5, duration = 40 },
    },
  },
  ["NPC Absorb Health 1"] = {
    name = "Consume Health", cost = 7, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 15, max = 20, duration = 1 },
    },
  },
  ["NPC Absorb Health 2"] = {
    name = "Drain Health", cost = 16, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 30, max = 50, duration = 1 },
    },
  },
  ["NPC Absorb Health 3"] = {
    name = "Leech Health", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 60, max = 90, duration = 1 },
    },
  },
  ["NPC Absorb Health 4"] = {
    name = "Devour Health", cost = 40, auto_calc = true,
    effects = {
      { id = tes3.effect.absorbHealth, range = tes3.effectRange.touch, min = 80, max = 120, duration = 1 },
    },
  },
  ["NPC Blind 1"] = {
    name = "Momentary Blindness", cost = 15, auto_calc = true,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 25, max = 75, duration = 10 },
    },
  },
  ["NPC Blind 2"] = {
    name = "Temporal Blindness", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 25, max = 75, duration = 20 },
    },
  },
  ["NPC Blind 3"] = {
    name = "Severe Blindness", cost = 45, auto_calc = true,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 25, max = 75, duration = 30 },
    },
  },
  ["NPC Blind 4"] = {
    name = "Prolonged Blindness", cost = 60, auto_calc = true,
    effects = {
      { id = tes3.effect.blind, range = tes3.effectRange.touch, min = 25, max = 75, duration = 40 },
    },
  },
  ["NPC Burden 1"] = {
    name = "Minor Burden", cost = 8, auto_calc = true,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 100, max = 150, duration = 10 },
    },
  },
  ["NPC Burden 2"] = {
    name = "Major Burden", cost = 15, auto_calc = true,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 200, max = 300, duration = 10 },
    },
  },
  ["NPC Burden 3"] = {
    name = "Severe Burden", cost = 23, auto_calc = true,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 300, max = 450, duration = 10 },
    },
  },
  ["NPC Burden 4"] = {
    name = "Empowered Burden", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.burden, range = tes3.effectRange.target, min = 400, max = 600, duration = 10 },
    },
  },
  ["NPC Fire 1"] = {
    name = "Fire Arrow", cost = 10, auto_calc = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 25, max = 30, duration = 1 },
    },
  },
  ["NPC Fire 2"] = {
    name = "Fire Blast", cost = 21, auto_calc = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.target, min = 45, max = 65, duration = 1 },
    },
  },
  ["NPC Fire 3"] = {
    name = "Ignition", cost = 26, auto_calc = true,
    effects = {
      { id = tes3.effect.fireDamage, range = tes3.effectRange.touch, min = 30, max = 40, duration = 3 },
    },
  },
  ["NPC Ice 1"] = {
    name = "Icy Touch", cost = 10, auto_calc = true,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 40, max = 40, duration = 1 },
    },
  },
  ["NPC Ice 2"] = {
    name = "Ice Arrow", cost = 20, auto_calc = true,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.target, min = 50, max = 55, duration = 1 },
    },
  },
  ["NPC Ice 3"] = {
    name = "Freezing Touch", cost = 28, auto_calc = true,
    effects = {
      { id = tes3.effect.frostDamage, range = tes3.effectRange.touch, min = 50, max = 60, duration = 2 },
    },
  },
  ["NPC Lightning 1"] = {
    name = "Shocking Touch", cost = 15, auto_calc = true,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 35, max = 50, duration = 1 },
    },
  },
  ["NPC Lightning 2"] = {
    name = "Electric Touch", cost = 19, auto_calc = true,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.touch, min = 50, max = 60, duration = 1 },
    },
  },
  ["NPC Lightning 3"] = {
    name = "Shock Arrow", cost = 32, auto_calc = true,
    effects = {
      { id = tes3.effect.shockDamage, range = tes3.effectRange.target, min = 50, max = 70, duration = 1 },
    },
  },
  ["NPC Paralyze 1"] = {
    name = "Minor Paralyze", cost = 12, auto_calc = true,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 5 },
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 10, max = 10, duration = 5 },
    },
  },
  ["NPC Paralyze 2"] = {
    name = "Improved Paralyze", cost = 23, auto_calc = true,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 10 },
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 10, max = 10, duration = 10 },
    },
  },
  ["NPC Paralyze 3"] = {
    name = "Extended Paralyze", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 13 },
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 10, max = 10, duration = 13 },
    },
  },
  ["NPC Paralyze 4"] = {
    name = "Grand Paralyze", cost = 37, auto_calc = true,
    effects = {
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 16 },
      { id = tes3.effect.sound, range = tes3.effectRange.target, min = 10, max = 10, duration = 16 },
    },
  },
  ["NPC Restore Fatigue 1"] = {
    name = "Refill", cost = 25, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 50, max = 50, duration = 10 },
    },
  },
  ["NPC Restore Fatigue 2"] = {
    name = "Greater Refill", cost = 51, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 50, max = 50, duration = 20 },
    },
  },
  ["NPC Restore Fatigue 3"] = {
    name = "Resurge", cost = 76, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 50, max = 50, duration = 30 },
    },
  },
  ["NPC Restore Fatigue 4"] = {
    name = "Greater Resurge", cost = 101, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreFatigue, range = tes3.effectRange.self, min = 50, max = 50, duration = 40 },
    },
  },
  ["NPC Restore Health 1"] = {
    name = "Recovery", cost = 13, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 5, max = 15, duration = 5 },
    },
  },
  ["NPC Restore Health 2"] = {
    name = "Greater Recovery", cost = 25, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 10, max = 30, duration = 5 },
    },
  },
  ["NPC Restore Health 3"] = {
    name = "Empowered Recovery", cost = 38, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 20, max = 40, duration = 5 },
    },
  },
  ["NPC Restore Health 4"] = {
    name = "Miraculous Recovery", cost = 50, auto_calc = true,
    effects = {
      { id = tes3.effect.restoreHealth, range = tes3.effectRange.self, min = 30, max = 50, duration = 5 },
    },
  },
  ["NPC Shield 1"] = {
    name = "Defect Barrier", cost = 38, auto_calc = true,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 15, max = 15, duration = 25 },
    },
  },
  ["NPC Shield 2"] = {
    name = "Third-like Barrier", cost = 75, auto_calc = true,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 30, max = 30, duration = 25 },
    },
  },
  ["NPC Shield 3"] = {
    name = "Experimental Barrier", cost = 113, auto_calc = true,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 45, max = 45, duration = 25 },
    },
  },
  ["NPC Shield 4"] = {
    name = "Barrier of the Sixth", cost = 151, auto_calc = true,
    effects = {
      { id = tes3.effect.shield, range = tes3.effectRange.self, min = 60, max = 60, duration = 25 },
    },
  },
  ["NPC Silence 1"] = {
    name = "Minor Silence", cost = 15, auto_calc = true,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.target, min = 1, max = 1, duration = 10 },
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 3 },
    },
  },
  ["NPC Silence 2"] = {
    name = "Improved Silence", cost = 30, auto_calc = true,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.target, min = 1, max = 1, duration = 20 },
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 4 },
    },
  },
  ["NPC Silence 3"] = {
    name = "Advanced Silence", cost = 45, auto_calc = true,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.target, min = 1, max = 1, duration = 30 },
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 5 },
    },
  },
  ["NPC Silence 4"] = {
    name = "Empowered Silence", cost = 60, auto_calc = true,
    effects = {
      { id = tes3.effect.silence, range = tes3.effectRange.target, min = 1, max = 1, duration = 40 },
      { id = tes3.effect.paralyze, range = tes3.effectRange.target, min = 1, max = 1, duration = 6 },
    },
  },
}
