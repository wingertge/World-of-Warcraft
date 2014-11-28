
PawnCommon = {
	["Digits"] = 1,
	["ShowSpace"] = true,
	["AlignNumbersRight"] = false,
	["ShowItemID"] = false,
	["ShowValuesForUpgradesOnly"] = true,
	["Debug"] = false,
	["ColorTooltipBorder"] = true,
	["ShowTooltipIcons"] = true,
	["ShowUpgradesOnTooltips"] = true,
	["ShowSocketingAdvisor"] = true,
	["Scales"] = {
		["\"Starter\":PriestHoly"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "e0e0e0",
			["LocalizedName"] = "Priest: holy",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "a8a8a8",
		},
		["\"Starter\":WarriorFury"] = {
			["PerCharacterOptions"] = {
				["Todkommt-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_LEGS"] = {
							552, -- [1]
							"item:109822:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							466.5, -- [1]
							"item:118154:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							422.3, -- [1]
							"item:109803:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							1403.04615384615, -- [1]
							"item:118726:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							312.7, -- [1]
							"item:109928:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							1167.16923076923, -- [1]
							"item:119457:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							344.739189189189, -- [1]
							"item:49888:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							244.5, -- [1]
							"item:118148:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							340.65, -- [1]
							"item:118144:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							327.25, -- [1]
							"item:118139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							232, -- [1]
							"item:119091:0:0:0:0:0:0:0:0:0:11:1:15:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							422, -- [1]
							"item:109944:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							390, -- [1]
							"item:118298:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							268, -- [4]
							"item:118293:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CHEST"] = {
							582.75, -- [1]
							"item:109892:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Gladimar-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							20.2, -- [1]
							"item:61931:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							2, -- [1]
							"item:58986:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							20.3, -- [1]
							"item:93891:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							43.3857142857143, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							2, -- [1]
							"item:58990:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							4, -- [1]
							"item:58996:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							20.2, -- [1]
							"item:62023:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							14.2, -- [1]
							"item:93890:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:57582:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							10.1, -- [1]
							"item:62038:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
					},
				},
			},
			["Color"] = "c79c6e",
			["LocalizedName"] = "Warrior: fury",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "957552",
		},
		["\"Starter\":MonkWindwalker"] = {
			["PerCharacterOptions"] = {
				["Manianor-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_2HWEAPON"] = {
							3.03030303030303, -- [1]
							"item:73209:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							2, -- [1]
							"item:58906:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							14, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							13.3928571428571, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							33.6785714285714, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_LEGS"] = {
							14, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							10, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_CHEST"] = {
							12, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
					},
				},
			},
			["Color"] = "00ff96",
			["LocalizedName"] = "Monk: windwalker",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "00bf70",
		},
		["\"Starter\":MonkBrewmaster"] = {
			["PerCharacterOptions"] = {
				["Manianor-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							24.15, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							3.5, -- [1]
							"item:57526:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							35.7285714285714, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_CHEST"] = {
							23.2, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							3.03030303030303, -- [1]
							"item:73209:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							13.3928571428571, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:57396:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							1.5, -- [1]
							"item:118532:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							24.65, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							16.6, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							0.5, -- [1]
							"item:77526:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							3.5, -- [1]
							"item:58906:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "00ff96",
			["LocalizedName"] = "Monk: brewmaster",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "00bf70",
		},
		["\"Starter\":MageArcane"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "69ccf0",
			["LocalizedName"] = "Mage: arcane",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "4e99b3",
		},
		["\"Starter\":PriestDiscipline"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "e0e0e0",
			["LocalizedName"] = "Priest: discipline",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "a8a8a8",
		},
		["\"Starter\":DruidBalance"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff7d0a",
			["LocalizedName"] = "Druid: balance",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf5d07",
		},
		["\"Starter\":WarlockAffliction"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "bca5ff",
			["LocalizedName"] = "Warlock: affliction",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "8d7bbf",
		},
		["\"Starter\":MageFire"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "69ccf0",
			["LocalizedName"] = "Mage: fire",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "4e99b3",
		},
		["PvE-630-Rogue-Subtlety-Noxxic"] = {
			["Values"] = {
				["Agility"] = 4.98,
				["HasteRating"] = 1.37,
				["MasteryRating"] = 1.85,
				["CritRating"] = 1.45,
				["Versatility"] = 1.42,
				["Multistrike"] = 1.93,
			},
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							1245.28, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							992.31, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							511.98, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							1265.75, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							903.06, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							1029.86, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							646.18, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							854.36, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							700.95, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							856.66, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							659.4, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							1173.18, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							511.98, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							698.14, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["UpgradesFollowSpecialization"] = true,
		},
		["\"Starter\":HunterBeastMastery"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "abd473",
			["LocalizedName"] = "Hunter: beast mastery",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "809f56",
		},
		["\"Starter\":RogueCombat"] = {
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							604.65, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							456, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							1406.84615384615, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							588.15, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							422, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							497, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							312, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_LEGS"] = {
							556.05, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							311, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							419.7, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							311.6, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							415.2, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							310, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							1406.84615384615, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Puckerina-Shattered Hand"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							20.2, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							2, -- [1]
							"item:53404:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							18, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							6, -- [1]
							"item:62335:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:52908:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							2, -- [1]
							"item:53430:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							20.2, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							15, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							49.3857142857143, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							2, -- [1]
							"item:52961:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "fff569",
			["LocalizedName"] = "Rogue: combat",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bfb74e",
		},
		["PvE-630-Rogue-Assassination-Noxxic"] = {
			["Values"] = {
				["Agility"] = 4.08,
				["HasteRating"] = 1.12,
				["MasteryRating"] = 1.36,
				["CritRating"] = 1.37,
				["Versatility"] = 1.23,
				["Multistrike"] = 1.43,
			},
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							1045.31, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							803.84, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							412.68, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							1017.7, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							726.66, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							868.87, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							545.28, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							717.28, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							555.42, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							707.66, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							532.8, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							946.08, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							412.68, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							553.22, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["UpgradesFollowSpecialization"] = true,
		},
		["PvE-630-Warrior-Gladiator-Noxxic"] = {
			["PerCharacterOptions"] = {
				["Todkommt-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_LEGS"] = {
							312.24, -- [1]
							"item:109822:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							223.32, -- [1]
							"item:118154:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							202.84, -- [1]
							"item:109803:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							206.7, -- [1]
							"item:110044:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							179.04, -- [1]
							"item:109916:0:0:0:0:0:0:0:0:0:1:1:522:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							114.84, -- [1]
							"item:118726:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							44.84, -- [1]
							"item:49888:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							119.32, -- [1]
							"item:118148:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							166.62, -- [1]
							"item:118144:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							163.3, -- [1]
							"item:118139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							165.3, -- [1]
							"item:119091:0:0:0:0:0:0:0:0:0:11:1:15:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							201.88, -- [1]
							"item:109944:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							290.62, -- [1]
							"item:118298:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							199.85, -- [4]
							"item:118293:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CHEST"] = {
							345.1, -- [1]
							"item:109892:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Values"] = {
				["BonusArmor"] = 0.97,
				["Multistrike"] = 0.48,
				["HasteRating"] = 0.9,
				["MasteryRating"] = 0.38,
				["CritRating"] = 0.54,
				["Versatility"] = 0.42,
				["Strength"] = 1,
			},
			["UpgradesFollowSpecialization"] = true,
		},
		["\"Starter\":PriestShadow"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "e0e0e0",
			["LocalizedName"] = "Priest: shadow",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "a8a8a8",
		},
		["\"Starter\":DeathKnightUnholyDps"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff4d6b",
			["LocalizedName"] = "DK: unholy",
			["DoNotShow1HUpgrades"] = true,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf3950",
		},
		["\"Starter\":PaladinHoly"] = {
			["PerCharacterOptions"] = {
				["Paladriana-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							238, -- [1]
							"item:114329:0:0:0:0:0:0:0:0:0:1:1:157:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							161, -- [1]
							"item:109795:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							110, -- [1]
							"item:108945:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							739.6, -- [1]
							"item:113559:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							47.15, -- [1]
							"item:109081:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							122.35, -- [1]
							"item:109765:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [2]
							0, -- [3]
							49.2, -- [4]
							"item:116875:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							151.75, -- [1]
							"item:112609:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							109.9, -- [1]
							"item:113234:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							163, -- [1]
							"item:114341:0:0:0:0:0:0:0:0:0:1:1:226:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							43, -- [1]
							"item:113145:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							191.9, -- [1]
							"item:113240:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							154.5, -- [1]
							"item:118031:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							186, -- [1]
							"item:106153:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "f58cba",
			["LocalizedName"] = "Paladin: holy",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "b7698b",
		},
		["\"Starter\":DruidFeralDps"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff7d0a",
			["LocalizedName"] = "Druid: feral",
			["DoNotShow1HUpgrades"] = true,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf5d07",
		},
		["\"Starter\":ShamanEnhancement"] = {
			["PerCharacterOptions"] = {
				["Shamorn-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							212.1, -- [1]
							"item:106139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							151.5, -- [1]
							"item:113571:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							210, -- [1]
							"item:109060:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							159, -- [1]
							"item:109061:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							74, -- [1]
							"item:113082:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
							45.15, -- [4]
							"item:108906:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_LEGS"] = {
							189, -- [1]
							"item:107301:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							110, -- [1]
							"item:113232:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							140.25, -- [1]
							"item:106167:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							51, -- [1]
							"item:113556:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							145, -- [1]
							"item:106175:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							347.102380952381, -- [1]
							"item:113548:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							32.8, -- [1]
							"item:117294:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "6e95ff",
			["LocalizedName"] = "Shaman: enhancement",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "526fbf",
		},
		["\"Starter\":MageFrost"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "69ccf0",
			["LocalizedName"] = "Mage: frost",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "4e99b3",
		},
		["\"Starter\":MonkMistweaver"] = {
			["PerCharacterOptions"] = {
				["Manianor-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							6, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_CHEST"] = {
							4, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_LEGS"] = {
							6, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							2, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							2, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
					},
				},
			},
			["Color"] = "00ff96",
			["LocalizedName"] = "Monk: mistweaver",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "00bf70",
		},
		["\"Starter\":HunterSurvival"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "abd473",
			["LocalizedName"] = "Hunter: survival",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "809f56",
		},
		["\"Starter\":DeathKnightBloodTank"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff4d6b",
			["LocalizedName"] = "DK: blood",
			["DoNotShow1HUpgrades"] = true,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf3950",
		},
		["\"Starter\":DruidRestoration"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff7d0a",
			["LocalizedName"] = "Druid: restoration",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf5d07",
		},
		["\"Starter\":WarlockDestruction"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "bca5ff",
			["LocalizedName"] = "Warlock: destruction",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "8d7bbf",
		},
		["\"Starter\":RogueSubtlety"] = {
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							600, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							460.85, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							1406.54615384615, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							589.3, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							422.3, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							497, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							312, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_LEGS"] = {
							550, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							314.3, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							416, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							310.4, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							412, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							312.7, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							1406.54615384615, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Puckerina-Shattered Hand"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							20, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							2, -- [1]
							"item:53404:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							18, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							6, -- [1]
							"item:62335:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:52908:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							2, -- [1]
							"item:53430:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							20, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							15, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							49.2857142857143, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							2, -- [1]
							"item:52961:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "fff569",
			["LocalizedName"] = "Rogue: subtlety",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bfb74e",
		},
		["\"Starter\":ShamanElemental"] = {
			["PerCharacterOptions"] = {
				["Shamorn-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							210, -- [1]
							"item:106139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							150, -- [1]
							"item:113571:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							211.75, -- [1]
							"item:109060:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							159, -- [1]
							"item:109061:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							869.2, -- [1]
							"item:113548:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							189, -- [1]
							"item:107301:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							110, -- [1]
							"item:113232:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							139, -- [1]
							"item:106167:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							128.2, -- [1]
							"item:113556:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							146.3, -- [1]
							"item:106175:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							109, -- [1]
							"item:108906:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
							74, -- [4]
							"item:113082:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CLOAK"] = {
							80, -- [1]
							"item:117294:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "6e95ff",
			["LocalizedName"] = "Shaman: elemental",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "526fbf",
		},
		["\"Starter\":PaladinTank"] = {
			["PerCharacterOptions"] = {
				["Paladriana-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							404.2, -- [1]
							"item:114329:0:0:0:0:0:0:0:0:0:1:1:157:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							278.4, -- [1]
							"item:109795:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							281.6625, -- [1]
							"item:113559:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							172, -- [1]
							"item:109081:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							175.2, -- [1]
							"item:116875:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
							102, -- [4]
							"item:109765:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							260.5, -- [1]
							"item:112609:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							183.25, -- [1]
							"item:113234:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							271, -- [1]
							"item:114341:0:0:0:0:0:0:0:0:0:1:1:226:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							158, -- [1]
							"item:113145:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							318.5, -- [1]
							"item:113240:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							257, -- [1]
							"item:118031:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							321.2, -- [1]
							"item:106153:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "f58cba",
			["LocalizedName"] = "Paladin: tank",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "b7698b",
		},
		["PvE-630-Rogue-Combat-Noxxic"] = {
			["Values"] = {
				["Agility"] = 4.31,
				["HasteRating"] = 1.61,
				["MasteryRating"] = 1.43,
				["CritRating"] = 1.35,
				["Versatility"] = 1.33,
				["Multistrike"] = 1.51,
			},
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							1130.42, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							851.64, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							457.26, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							1118.96, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							801.72, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							910.59, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							571.38, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							775.7, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							586.31, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							781.9, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							593.54, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							1050.43, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							457.26, -- [1]
							"item:110042:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							583.92, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["UpgradesFollowSpecialization"] = true,
		},
		["PvE-630-Warrior-Protection-Noxxic"] = {
			["PerCharacterOptions"] = {
				["Todkommt-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_LEGS"] = {
							11596.27, -- [1]
							"item:109822:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							10041.38, -- [1]
							"item:118154:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							9084.87, -- [1]
							"item:109803:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							14126.21, -- [1]
							"item:110044:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							5338.23, -- [1]
							"item:109928:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							3744.15, -- [1]
							"item:118726:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							1418.42, -- [1]
							"item:49888:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							5355.93, -- [1]
							"item:118148:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							7577, -- [1]
							"item:118144:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							6855.68, -- [1]
							"item:118139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							5149.72, -- [1]
							"item:119091:0:0:0:0:0:0:0:0:0:11:1:15:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							9299.08, -- [1]
							"item:109944:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							9065.35, -- [1]
							"item:118298:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							6242.95, -- [4]
							"item:118293:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CHEST"] = {
							12975.13, -- [1]
							"item:109892:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Values"] = {
				["CritRating"] = 4.26,
				["Strength"] = 5.29,
				["BonusArmor"] = 13.75,
				["Multistrike"] = 2.55,
				["HasteRating"] = 1.56,
				["MasteryRating"] = 4.02,
				["Versatility"] = 5.89,
				["Stamina"] = 27.93,
				["Armor"] = 11.35,
			},
			["UpgradesFollowSpecialization"] = true,
		},
		["\"Starter\":DruidFeralTank"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff7d0a",
			["LocalizedName"] = "Druid: guardian",
			["DoNotShow1HUpgrades"] = true,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf5d07",
		},
		["\"Starter\":DeathKnightFrostDps"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "ff4d6b",
			["LocalizedName"] = "DK: frost",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bf3950",
		},
		["\"Starter\":PaladinRetribution"] = {
			["PerCharacterOptions"] = {
				["Paladriana-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							238, -- [1]
							"item:114329:0:0:0:0:0:0:0:0:0:1:1:157:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							161, -- [1]
							"item:109795:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							241.8125, -- [1]
							"item:113559:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							115.15, -- [1]
							"item:109081:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							120, -- [1]
							"item:116875:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
							47, -- [4]
							"item:109765:0:0:0:0:0:0:0:0:0:17:1:518:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_SHOULDER"] = {
							151.15, -- [1]
							"item:112609:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							109, -- [1]
							"item:113234:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							163, -- [1]
							"item:114341:0:0:0:0:0:0:0:0:0:1:1:226:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							110, -- [1]
							"item:113145:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							190, -- [1]
							"item:113240:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							154.55, -- [1]
							"item:118031:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							186, -- [1]
							"item:106153:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "f58cba",
			["LocalizedName"] = "Paladin: retribution",
			["DoNotShow1HUpgrades"] = true,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "b7698b",
		},
		["\"Starter\":RogueAssassination"] = {
			["PerCharacterOptions"] = {
				["Benigno-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							600, -- [1]
							"item:118941:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							456, -- [1]
							"item:116182:0:0:0:0:0:0:0:0:0:13:3:231:525:535:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							583, -- [1]
							"item:109898:0:0:0:0:0:0:0:0:0:2:2:499:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							497, -- [1]
							"item:118297:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							312, -- [4]
							"item:109779:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_LEGS"] = {
							554.75, -- [1]
							"item:109811:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							313.85, -- [1]
							"item:109870:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							416, -- [1]
							"item:109842:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							308, -- [1]
							"item:109953:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							412, -- [1]
							"item:109935:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							418, -- [1]
							"item:116944:0:0:0:0:0:0:0:0:0:14:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							313.4, -- [1]
							"item:109906:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Puckerina-Shattered Hand"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							20, -- [1]
							"item:61937:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							2, -- [1]
							"item:53404:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							18, -- [1]
							"item:48689:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							6, -- [1]
							"item:62335:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							2, -- [1]
							"item:53430:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							20, -- [1]
							"item:62026:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							15, -- [1]
							"item:42952:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:52908:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							2, -- [1]
							"item:52961:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "fff569",
			["LocalizedName"] = "Rogue: assassination",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "bfb74e",
		},
		["\"Starter\":HunterMarksman"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "abd473",
			["LocalizedName"] = "Hunter: marksman",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "809f56",
		},
		["\"Starter\":ShamanRestoration"] = {
			["PerCharacterOptions"] = {
				["Shamorn-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							212.1, -- [1]
							"item:106139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							150, -- [1]
							"item:113571:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							210, -- [1]
							"item:109060:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							160.7, -- [1]
							"item:109061:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							869.2, -- [1]
							"item:113548:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							189, -- [1]
							"item:107301:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							111.05, -- [1]
							"item:113232:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							140.5, -- [1]
							"item:106167:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							127, -- [1]
							"item:113556:0:0:0:0:0:0:0:0:0:0:1:545:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							145, -- [1]
							"item:106175:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							111, -- [1]
							"item:113082:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
							109, -- [4]
							"item:108906:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CLOAK"] = {
							80.8, -- [1]
							"item:117294:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							0, -- [3]
						},
					},
				},
			},
			["Color"] = "6e95ff",
			["LocalizedName"] = "Shaman: restoration",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "526fbf",
		},
		["\"Starter\":WarriorTank"] = {
			["PerCharacterOptions"] = {
				["Todkommt-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_LEGS"] = {
							890.4, -- [1]
							"item:109822:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							747, -- [1]
							"item:118154:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							675.8, -- [1]
							"item:109803:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							712.2, -- [1]
							"item:110044:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							487.8, -- [1]
							"item:109916:0:0:0:0:0:0:0:0:0:1:1:522:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							1509.14615384615, -- [1]
							"item:118726:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							387.189189189189, -- [1]
							"item:49888:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							389.1, -- [1]
							"item:118148:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							545.5, -- [1]
							"item:118144:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							517.9, -- [1]
							"item:118139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							505.1, -- [1]
							"item:119091:0:0:0:0:0:0:0:0:0:11:1:15:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							681.8, -- [1]
							"item:109944:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							869.4, -- [1]
							"item:118298:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							598.2, -- [4]
							"item:118293:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CHEST"] = {
							932.2, -- [1]
							"item:109892:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Gladimar-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							36.2, -- [1]
							"item:61931:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							5.4, -- [1]
							"item:58986:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							26.9, -- [1]
							"item:93903:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_CHEST"] = {
							35.7, -- [1]
							"item:93891:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							16.2, -- [1]
							"item:62038:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_WRIST"] = {
							4.5, -- [1]
							"item:58990:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							6.1, -- [1]
							"item:58996:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							36.8, -- [1]
							"item:62023:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							25.6, -- [1]
							"item:93890:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_HAND"] = {
							5.1, -- [1]
							"item:57582:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							47.2857142857143, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
					},
				},
			},
			["Color"] = "c79c6e",
			["LocalizedName"] = "Warrior: tank",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = true,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "957552",
		},
		["\"Starter\":WarlockDemonology"] = {
			["PerCharacterOptions"] = {
			},
			["Color"] = "bca5ff",
			["LocalizedName"] = "Warlock: demonology",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "8d7bbf",
		},
		["\"Starter\":WarriorArms"] = {
			["PerCharacterOptions"] = {
				["Todkommt-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_LEGS"] = {
							556.9, -- [1]
							"item:109822:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HEAD"] = {
							466.7, -- [1]
							"item:118154:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FEET"] = {
							422, -- [1]
							"item:109803:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONOFFHAND"] = {
							1402.14615384615, -- [1]
							"item:118726:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							310, -- [1]
							"item:109928:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							1167.31923076923, -- [1]
							"item:119457:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_2HWEAPON"] = {
							344.189189189189, -- [1]
							"item:49888:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WRIST"] = {
							242, -- [1]
							"item:118148:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_HAND"] = {
							337, -- [1]
							"item:118144:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							324, -- [1]
							"item:118139:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_NECK"] = {
							234.9, -- [1]
							"item:119091:0:0:0:0:0:0:0:0:0:11:1:15:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							422.3, -- [1]
							"item:109944:0:0:0:0:0:0:0:0:0:2:1:524:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_FINGER"] = {
							390, -- [1]
							"item:118298:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
							268, -- [4]
							"item:118293:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [5]
							0, -- [6]
						},
						["INVTYPE_CHEST"] = {
							587, -- [1]
							"item:109892:0:0:0:0:0:0:0:0:0:2:2:523:524:0:0", -- [2]
							0, -- [3]
						},
					},
				},
				["Gladimar-Blade's Edge"] = {
					["Visible"] = true,
					["BestItems"] = {
						["INVTYPE_HEAD"] = {
							20, -- [1]
							"item:61931:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_FEET"] = {
							2, -- [1]
							"item:58986:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CHEST"] = {
							20, -- [1]
							"item:93891:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_WEAPONMAINHAND"] = {
							43.2857142857143, -- [1]
							"item:48716:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							79, -- [3]
						},
						["INVTYPE_WRIST"] = {
							2, -- [1]
							"item:58990:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_WAIST"] = {
							4, -- [1]
							"item:58996:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_LEGS"] = {
							20, -- [1]
							"item:62023:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_SHOULDER"] = {
							14, -- [1]
							"item:93890:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
						["INVTYPE_HAND"] = {
							2, -- [1]
							"item:57582:0:0:0:0:0:0:0:0:0:11:0:0:0:0:0", -- [2]
							0, -- [3]
						},
						["INVTYPE_CLOAK"] = {
							10, -- [1]
							"item:62038:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0", -- [2]
							84, -- [3]
						},
					},
				},
			},
			["Color"] = "c79c6e",
			["LocalizedName"] = "Warrior: arms",
			["DoNotShow1HUpgrades"] = false,
			["DoNotShow2HUpgrades"] = false,
			["UpgradesFollowSpecialization"] = true,
			["Provider"] = "Starter",
			["UnenchantedColor"] = "957552",
		},
	},
	["ShowLootUpgradeAdvisor"] = true,
	["ButtonPosition"] = 2,
	["IgnoreGemsWhileLeveling"] = true,
	["ShowQuestUpgradeAdvisor"] = true,
	["LastVersion"] = 1.907,
	["ShownGettingStarted"] = true,
}
