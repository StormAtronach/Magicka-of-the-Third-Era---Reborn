-- merchants.lua
-- What the mod changes on NPCs, by NPC id. Most of them sell spells.
--   add, remove    spells the NPC gains or loses
--   offers_spells  the NPC starts to sell spells
--   items          items the NPC gains. A negative count restocks.

return {
  a_ve_service01 = {
    add = {
      "a_ve_uniqsp_57_frostfist",
    },
  },
  aldaril = {
    add = {
      "a_ve_uniqsp_25_blackstorm",
    },
  },
  ["arielle phiencel"] = {
    add = {
      "a_ve_uniqsp_08_manaleech",
    },
  },
  arrille = {
    add = {
      "cure poison",
      "soul trap",
      "detect_creature",
      "night-eye",
      "rally beast",
      "turn undead",
      "bound boots",
      "open",
      "jump",
      "feather",
      "a_ve_uniqsp_09_waterstrider",
    },
    items = { p_restore_health_b = -2, p_restore_fatigue_b = -2 },
  },
  ["aunius autrus"] = {
    add = {
      "absorb willpower [ranged]",
      "absorb strength [ranged]",
      "absorb personality [ranged]",
      "absorb luck [ranged]",
      "absorb intelligence [ranged]",
      "absorb endurance [ranged]",
      "absorb agility [ranged]",
      "absorb health [ranged]",
      "a_ve_uniqsp_37_smite",
    },
  },
  Chanil_Lee = {
    offers_spells = true,
    add = {
      "touch dispel",
      "self dispel",
      "absorb spell points",
      "absorb spell points [ranged]",
      "gash spirit [ranged]",
    },
  },
  ["chaplain ogrul"] = {
    add = {
      "a_ve_uniqsp_13_pray_ma",
      "a_ve_uniqsp_39_berserk",
    },
  },
  ["danso indules"] = {
    add = {
      "a_ve_uniqsp_55_crabbless",
    },
  },
  ["dileno lloran"] = {
    add = {
      "a_ve_uniqsp_31_desperateprayer",
    },
  },
  ["diren vendu"] = {
    add = {
      "Tap Energy",
      "drain health_fatigue",
      "frostbloom",
      "frost bolt",
      "frostfist",
      "freezing touch",
      "a_ve_uniqsp_21_mehrunesprot",
    },
  },
  dulian = {
    add = {
      "a_ve_uniqsp_29_pray_bl",
    },
  },
  ["elynu saren"] = {
    add = {
      "great resist shock",
      "balyna's perfect balm",
      "balyna's efficacious balm",
      "balyna's soothing balm",
      "wearying touch",
      "torpor touch",
      "straining touch",
      "spite touch",
      "misfortunate touch",
      "enervating touch",
    },
  },
  eraamion = {
    add = {
      "a_ve_uniqsp_24_chaoticspark",
      "a_ve_basicsp_cahu_01",
      "a_ve_basicsp_frhu_01",
    },
  },
  ["erer darothril"] = {
    add = {
      "a_ve_uniqsp_54_aoefrenzy",
      "a_ve_basicsp_cahu_03",
      "a_ve_basicsp_dehu_02",
      "a_ve_basicsp_frhu_03",
    },
  },
  ["Ervona Barys"] = {
    add = {
      "a_ve_uniqsp_61_legichrg",
      "regenerate",
      "blood gift",
      "hearth heal",
    },
  },
  estirdalin = {
    add = {
      "a_ve_uniqsp_49_c1_frost",
      "a_ve_uniqsp_50_c2_shock",
      "a_ve_uniqsp_51_c3_fire",
    },
  },
  estoril = {
    add = {
      "a_ve_uniqsp_32_blackspite",
    },
  },
  ["ethasi rilvayn"] = {
    add = {
      "a_ve_uniqsp_41_coupdegrace",
    },
  },
  Fanildil = {
    add = {
      "red despair",
      "exhaustion",
      "weariness",
      "cruel earwig",
      "great levitate",
    },
  },
  ["felara andrethi"] = {
    add = {
      "a_ve_basicsp_renw_01",
    },
  },
  ["felen maryon"] = {
    add = {
      "a_ve_uniqsp_04_sumrit",
    },
  },
  ["ferise varo"] = {
    add = {
      "frostball",
      "spirit knife",
      "gripes",
      "brevusa's averted eyes",
      "noise",
      "blind",
      "soothe the savage beast",
      "levitate",
      "a_ve_uniqsp_65_manaspark",
    },
  },
  ["fevyn ralen"] = {
    add = {
      "a_ve_uniqsp_20_vampiricform",
    },
  },
  gildan = {
    add = {
      "a_ve_basicsp_cahu_02",
      "a_ve_basicsp_cacr_01",
      "a_ve_basicsp_dehu_01",
      "a_ve_basicsp_decr_01",
      "a_ve_basicsp_frhu_02",
      "a_ve_basicsp_frcr_01",
    },
  },
  ["guls llervu"] = {
    add = {
      "a_ve_uniqsp_03_drakeguard",
    },
  },
  heem_la = {
    add = {
      "a_ve_uniqsp_35_livingbomb",
    },
  },
  ["idonea munia"] = {
    add = {
      "a_ve_uniqsp_17_discountrecall",
      "a_ve_uniqsp_16_discountmark",
      "a_ve_basicsp_cahu_01",
      "a_ve_basicsp_frhu_01",
    },
  },
  imare = {
    add = {
      "a_ve_uniqsp_53_murderous_i",
    },
  },
  ["j'rasha"] = {
    add = {
      "lock",
      "great open",
      "burden touch",
      "buoyancy",
      "water breathing",
      "a_ve_uniqsp_47_bargainopen",
    },
  },
  ["Lalatia Varian"] = {
    add = {
      "a_ve_uniqsp_36_holyfire",
    },
  },
  ["leles birian"] = {
    add = {
      "a_ve_uniqsp_62_flamehf",
      "frost storm",
      "sphere of negation",
      "drain blood",
      "fire storm",
      "shockbloom",
    },
  },
  ["llaalam madalas"] = {
    add = {
      "a_ve_uniqsp_34_hardenbone",
    },
  },
  ["llarara omayn"] = {
    add = {
      "a_ve_uniqsp_42_fightingprowess",
    },
  },
  ["llaros uvayn"] = {
    add = {
      "a_ve_uniqsp_48_paralyzer",
    },
  },
  ["llathyno hlaalu"] = {
    add = {
      "a_ve_uniqsp_40_burstofspeed",
    },
  },
  ["lloros sarano"] = {
    add = {
      "a_ve_uniqsp_23_manawell",
    },
  },
  ["malven romori"] = {
    add = {
      "a_ve_uniqsp_30_chaoticshockst",
    },
  },
  ["marayn dren"] = {
    add = {
      "a_ve_uniqsp_05_fireball",
    },
  },
  ["medila indaren"] = {
    add = {
      "weakness to shock",
      "weakness to poison",
      "weakness to magicka",
      "weakness to frost",
      "shockball",
      "shockball_large",
      "shockbite",
      "viperbite",
      "heartbite",
      "a_ve_uniqsp_45_incompetence",
    },
  },
  ["melie frenck"] = {
    add = {
      "a_ve_basicsp_renw_01",
    },
  },
  ["mertisi andavel"] = {
    add = {
      "strain",
      "misfortune",
      "clumsiness",
      "deadly poison [ranged]",
      "potent poison [ranged]",
      "five fingers of pain",
      "sphere of negation",
      "a_ve_uniqsp_33_vespite",
    },
  },
  ["minnibi selkin-adda"] = {
    add = {
      "a_ve_uniqsp_28_gravecurse",
    },
  },
  ["namanian facian"] = {
    add = {
      "a_ve_uniqsp_10_absarmor",
    },
  },
  ["Nebia Amphia"] = {
    add = {
      "a_ve_uniqsp_38_handofjustice",
    },
  },
  ["nelso salenim"] = {
    add = {
      "god's spark",
      "wild shockbloom",
      "shocking touch",
      "fierce shock shield",
      "fierce frost shield",
      "fierce fire shield",
      "a_ve_uniqsp_11_foolsleap",
    },
  },
  ["nilvyn drothan"] = {
    add = {
      "a_ve_uniqsp_18_fortifyall",
    },
  },
  ["niras farys"] = {
    add = {
      "a_ve_uniqsp_22_giftofmana",
    },
  },
  onlyhestandsthere = {
    add = {
      "a_ve_uniqsp_19_aquaform",
    },
  },
  ["orrent geontene"] = {
    add = {
      "a_ve_uniqsp_46_counterspell",
      "a_ve_basicsp_light_01",
    },
  },
  ["ranis athrys"] = {
    add = {
      "a_ve_uniqsp_06_burden",
      "a_ve_basicsp_cahu_03",
      "a_ve_basicsp_dehu_02",
      "a_ve_basicsp_frhu_03",
    },
  },
  ["relms gilvilo"] = {
    add = {
      "a_ve_uniqsp_60_noillness",
    },
  },
  ["rirnas athren"] = {
    add = {
      "a_ve_basicsp_cahu_02",
      "a_ve_basicsp_cacr_01",
      "a_ve_basicsp_dehu_01",
      "a_ve_basicsp_decr_01",
      "a_ve_basicsp_frhu_02",
      "a_ve_basicsp_frcr_01",
    },
  },
  ["salam andrethi"] = {
    add = {
      "a_ve_basicsp_light_01",
      "a_ve_uniqsp_63_melamed",
    },
  },
  ["salen ravel"] = {
    add = {
      "a_ve_uniqsp_12_pray_la",
    },
  },
  ["salver lleran"] = {
    add = {
      "wild weakness",
      "wild torpor",
      "wild temptation",
      "wild strain",
      "wild spite",
      "wild misfortune",
      "wild clumsiness",
      "daedric bite",
      "ironhand",
      "invisibility",
      "a_ve_uniqsp_15_lifetapgr",
    },
  },
  ["Salyni Nelvayn"] = {
    add = {
      "a_ve_uniqsp_52_exhaustfrost",
    },
  },
  ["saras orelu"] = {
    add = {
      "strong heal companion",
      "great heal companion",
      "veloth's gift",
      "troll's blood",
      "absorb health",
      "command beast",
      "commanding touch",
    },
  },
  ["scelian plebo"] = {
    add = {
      "a_ve_uniqsp_56_retrishield",
    },
  },
  ["sharn gra-muzgob"] = {
    add = {
      "a_ve_uniqsp_07_panacea",
    },
  },
  sirilonwe = {
    add = {
      "a_ve_uniqsp_59_blindrage",
    },
  },
  ["solea nuccusius"] = {
    add = {
      "drain spear",
      "drain marksman",
      "drain hand-to-hand",
      "drain blunt weapon",
      "drain axe",
      "drain unarmored",
      "drain medium armor",
      "drain light armor",
      "drain heavy armor",
      "weakness to fire",
      "firebloom",
      "flamebolt",
      "firefist",
      "burning touch",
      "a_ve_uniqsp_27_annihilatearmor",
    },
    remove = {
      "drain destruction",
    },
  },
  ["somutis vunnis"] = {
    add = {
      "a_ve_uniqsp_14_pray_ha",
    },
  },
  ["sonummu zabamat"] = {
    add = {
      "a_ve_uniqsp_44_akamiblessing",
    },
  },
  ["syloria siruliulus"] = {
    offers_spells = true,
    add = {
      "flay spirit [ranged]",
      "wild weeping wound",
      "weeping wound",
      "wounding touch",
      "wound",
    },
  },
  ["tinaso alan"] = {
    add = {
      "a_ve_uniqsp_02_dragonbite",
    },
  },
  tyermaillin = {
    add = {
      "a_ve_uniqsp_58_wizprank",
      "a_ve_basicsp_cahu_02",
      "a_ve_basicsp_cacr_01",
      "a_ve_basicsp_dehu_01",
      "a_ve_basicsp_decr_01",
      "a_ve_basicsp_frhu_02",
      "a_ve_basicsp_frcr_01",
    },
  },
  ["uleni heleran"] = {
    add = {
      "a_ve_uniqsp_64_sparkmaster",
    },
  },
  ["ulmiso maloren"] = {
    add = {
      "daedric strength",
      "daedric speed",
      "daedric personality",
      "daedric luck",
      "daedric intelligence",
      "daedric endurance",
      "daedric agility",
      "blightguard",
      "blessed word",
      "a_ve_uniqsp_26_curseoftheproud",
    },
  },
  ["urtiso faryon"] = {
    add = {
      "a_ve_uniqsp_01_lifetap",
    },
  },
  ygfa = {
    add = {
      "a_ve_basicsp_cahu_01",
      "a_ve_basicsp_frhu_01",
    },
  },
  ["zanmulk sammalamus"] = {
    add = {
      "a_ve_uniqsp_43_warriorblessing",
    },
  },
}
