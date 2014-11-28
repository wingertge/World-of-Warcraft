
HealBot_Config = {
	["CrashProtStartTime"] = 2,
	["ActionVisible"] = {
		1, -- [1]
		0, -- [2]
		0, -- [3]
		0, -- [4]
		0, -- [5]
		0, -- [6]
		0, -- [7]
		0, -- [8]
		0, -- [9]
		0, -- [10]
	},
	["MacroUse10"] = 0,
	["CrashProtMacroName"] = "hbCrashProt",
	["SkinDefault"] = {
		["Standard"] = 1,
		["Raid"] = 1,
		["Alterac Valley"] = 1,
		["Group"] = 1,
	},
	["CurrentSpec"] = 3,
	["Current_Skin"] = "Standard",
	["Skin_ID"] = 1,
	["Profile"] = 1,
	["DisableSolo"] = false,
	["Version"] = "6.0.3.1",
	["LastVersionSkinUpdate"] = "6.0.3.1",
	["EnableHealthy"] = true,
	["DisableHealBot"] = false,
	["HealBot_BuffWatchGUID"] = {
	},
	["DisabledNow"] = 0,
}
HealBot_Config_Spells = {
	["EnabledSpellTrinket2"] = {
	},
	["EnabledSpellTarget"] = {
	},
	["EnemySpellTrinket1"] = {
	},
	["EnemyAvoidBlueCursor"] = {
	},
	["EnemySpellTrinket2"] = {
	},
	["EnemyKeyCombo"] = {
	},
	["DisabledKeyCombo"] = {
		["ShiftLeft4"] = "Unknown",
		["Left1"] = "Target",
		["Right3"] = "Assist",
		["Right"] = "Assist",
		["Left"] = "Target",
		["Ctrl-ShiftRight"] = "HBmenu",
		["Left3"] = "Target",
		["Ctrl-ShiftLeft1"] = "Menu",
		["ShiftLeft2"] = "Unknown",
		["Ctrl-ShiftRight3"] = "HBmenu",
		["Ctrl-ShiftRight4"] = "HBmenu",
		["Left2"] = "Target",
		["Ctrl-ShiftLeft2"] = "Menu",
		["ShiftLeft3"] = "Unknown",
		["Right1"] = "Assist",
		["Ctrl-ShiftRight2"] = "HBmenu",
		["Ctrl-ShiftLeft4"] = "Menu",
		["Right4"] = "Assist",
		["Ctrl-ShiftRight1"] = "HBmenu",
		["ShiftLeft1"] = "Unknown",
		["Left4"] = "Target",
		["ShiftLeft"] = "Unknown",
		["Right2"] = "Assist",
		["Ctrl-ShiftLeft"] = "Menu",
		["Ctrl-ShiftLeft3"] = "Menu",
	},
	["EnabledAvoidBlueCursor"] = {
	},
	["DisabledSpellTrinket1"] = {
	},
	["ButtonCastMethod"] = 2,
	["EnabledKeyCombo"] = {
		["ShiftLeft4"] = "Unknown",
		["Left1"] = "Remove Curse",
		["Alt-ShiftLeft2"] = "Target",
		["Alt-ShiftRight4"] = "Assist",
		["Alt-ShiftRight2"] = "Assist",
		["Ctrl-ShiftRight"] = "HBmenu",
		["Alt-ShiftLeft"] = "Target",
		["Ctrl-ShiftRight3"] = "HBmenu",
		["Ctrl-ShiftRight4"] = "HBmenu",
		["Alt-ShiftRight1"] = "Assist",
		["Left3"] = "Remove Curse",
		["Ctrl-ShiftLeft"] = "Menu",
		["Ctrl-ShiftLeft1"] = "Menu",
		["ShiftLeft2"] = "Unknown",
		["Alt-ShiftLeft4"] = "Target",
		["Alt-ShiftLeft1"] = "Target",
		["Left4"] = "Remove Curse",
		["Ctrl-ShiftLeft2"] = "Menu",
		["ShiftLeft3"] = "Unknown",
		["Ctrl-ShiftRight2"] = "HBmenu",
		["Alt-ShiftRight"] = "Assist",
		["Ctrl-ShiftLeft4"] = "Menu",
		["Ctrl-ShiftRight1"] = "HBmenu",
		["Ctrl-ShiftLeft3"] = "Menu",
		["ShiftLeft1"] = "Unknown",
		["Left2"] = "Remove Curse",
		["Alt-ShiftRight3"] = "Assist",
		["ShiftLeft"] = "Unknown",
		["Left"] = "Remove Curse",
		["Alt-ShiftLeft3"] = "Target",
	},
	["DisabledAvoidBlueCursor"] = {
	},
	["DisabledSpellTrinket2"] = {
	},
	["DisabledSpellTarget"] = {
	},
	["EnemySpellTarget"] = {
	},
	["EnabledSpellTrinket1"] = {
	},
}
HealBot_Config_Buffs = {
	["LongBuffTimer"] = 120,
	["BuffWatchInCombat"] = false,
	["ShortBuffTimer"] = 10,
	["BuffWatchWhenGrouped"] = true,
	["HealBotBuffColB"] = {
		1, -- [1]
		1, -- [2]
		1, -- [3]
		1, -- [4]
		1, -- [5]
		1, -- [6]
		1, -- [7]
		1, -- [8]
	},
	["BuffWatch"] = true,
	["NoAuraWhenRested"] = false,
	["HealBotBuffColG"] = {
		1, -- [1]
		1, -- [2]
		1, -- [3]
		1, -- [4]
		1, -- [5]
		1, -- [6]
		1, -- [7]
		1, -- [8]
	},
	["HealBotBuffText"] = {
		"Arcane Brilliance", -- [1]
		"None", -- [2]
		"None", -- [3]
		"None", -- [4]
		"None", -- [5]
		"None", -- [6]
		"None", -- [7]
		"None", -- [8]
		"None", -- [9]
		"None", -- [10]
		["42"] = "None",
		["43"] = "None",
		["23"] = "None",
		["41"] = "Arcane Brilliance",
		["47"] = "None",
		["46"] = "None",
		["34"] = "None",
		["44"] = "None",
		["48"] = "None",
		["33"] = "None",
		["28"] = "None",
		["38"] = "None",
		["12"] = "None",
		["13"] = "None",
		["17"] = "None",
		["27"] = "None",
		["15"] = "None",
		["25"] = "None",
		["35"] = "None",
		["45"] = "None",
		["37"] = "None",
		["18"] = "None",
		["36"] = "None",
		["22"] = "None",
		["14"] = "None",
		["24"] = "None",
		["16"] = "None",
		["26"] = "None",
		["31"] = "Arcane Brilliance",
		["21"] = "Arcane Brilliance",
		["11"] = "Arcane Brilliance",
		["32"] = "None",
	},
	["HealBotBuffColR"] = {
		1, -- [1]
		1, -- [2]
		1, -- [3]
		1, -- [4]
		1, -- [5]
		1, -- [6]
		1, -- [7]
		1, -- [8]
	},
	["HealBotBuffDropDown"] = {
		4, -- [1]
		4, -- [2]
		4, -- [3]
		4, -- [4]
		4, -- [5]
		4, -- [6]
		4, -- [7]
		4, -- [8]
		4, -- [9]
		4, -- [10]
		["42"] = 4,
		["43"] = 4,
		["23"] = 4,
		["41"] = 4,
		["47"] = 4,
		["46"] = 4,
		["34"] = 4,
		["44"] = 4,
		["48"] = 4,
		["33"] = 4,
		["28"] = 4,
		["38"] = 4,
		["12"] = 4,
		["13"] = 4,
		["17"] = 4,
		["27"] = 4,
		["15"] = 4,
		["25"] = 4,
		["35"] = 4,
		["45"] = 4,
		["37"] = 4,
		["18"] = 4,
		["36"] = 4,
		["22"] = 4,
		["14"] = 4,
		["24"] = 4,
		["16"] = 4,
		["26"] = 4,
		["31"] = 4,
		["21"] = 4,
		["11"] = 4,
		["32"] = 4,
	},
}
HealBot_Config_Cures = {
	["CDCshownHB"] = true,
	["DebuffWatch"] = true,
	["HealBotDebuffText"] = {
		"Remove Curse", -- [1]
		"None", -- [2]
		"None", -- [3]
		["42"] = "None",
		["43"] = "None",
		["41"] = "Remove Curse",
		["23"] = "None",
		["33"] = "None",
		["12"] = "None",
		["13"] = "None",
		["22"] = "None",
		["31"] = "Remove Curse",
		["21"] = "Remove Curse",
		["11"] = "Remove Curse",
		["32"] = "None",
	},
	["IgnoreFastDurDebuffs"] = true,
	["ShowDebuffWarning"] = true,
	["HealBot_CDCWarnRange_Screen"] = 2,
	["DebuffWatchInCombat"] = true,
	["IgnoreMovementDebuffs"] = true,
	["HealBot_CDCWarnRange_Aggro"] = 2,
	["IgnoreNonHarmfulDebuffs"] = true,
	["IgnoreClassDebuffs"] = true,
	["HealBot_CDCWarnRange_Bar"] = 3,
	["IgnoreFastDurDebuffsSecs"] = 2,
	["HealBot_CDCWarnRange_Sound"] = 3,
	["SoundDebuffPlay"] = "Tribal Bass Drum",
	["SoundDebuffWarning"] = false,
	["CDCshownAB"] = false,
	["IgnoreFriendDebuffs"] = true,
	["DebuffWatchWhenGrouped"] = false,
	["IgnoreOnCooldownDebuffs"] = false,
	["HealBotDebuffDropDown"] = {
		4, -- [1]
		4, -- [2]
		4, -- [3]
		["42"] = 4,
		["43"] = 4,
		["41"] = 4,
		["23"] = 4,
		["33"] = 4,
		["12"] = 4,
		["13"] = 4,
		["22"] = 4,
		["31"] = 4,
		["21"] = 4,
		["11"] = 4,
		["32"] = 4,
	},
	["CDCBarColour"] = {
		["Poison"] = {
			["B"] = 0.24,
			["G"] = 0.46,
			["R"] = 0.12,
		},
		["Curse"] = {
			["B"] = 0.09,
			["G"] = 0.43,
			["R"] = 0.83,
		},
		["Magic"] = {
			["B"] = 0.83,
			["G"] = 0.33,
			["R"] = 0.26,
		},
		["Disease"] = {
			["B"] = 0.7,
			["G"] = 0.19,
			["R"] = 0.55,
		},
	},
	["HealBotDebuffPriority"] = {
		["Disease"] = 15,
		["Custom"] = 10,
		["Poison"] = 16,
		["Magic"] = 13,
		["Curse"] = 14,
	},
	["HealBot_Custom_Defuffs_All"] = {
		["Poison"] = false,
		["Curse"] = false,
		["Magic"] = false,
		["Disease"] = false,
	},
}
