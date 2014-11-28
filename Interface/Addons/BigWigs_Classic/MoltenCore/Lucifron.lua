
--------------------------------------------------------------------------------
-- Module declaration
--

local mod, CL = BigWigs:NewBoss("Lucifron", 696)
if not mod then return end
mod:RegisterEnableMob(12118)
mod.toggleOptions = {19702, 19703, {20604, "ICON"}, "bosskill"}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.bossName = "Lucifron"

	L.mc_bar = "MC: %s"
end
L = mod:GetLocale()
mod.displayName = L.bossName

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")

	self:Log("SPELL_CAST_SUCCESS", "ImpendingDoom", 19702)
	self:Log("SPELL_CAST_SUCCESS", "LucifronsCurse", 19703)
	self:Log("SPELL_AURA_APPLIED", "MindControl", 20604)

	self:Death("Win", 12118)
end

function mod:OnEngage()
	self:Bar(19703, 11) -- Lucifron's Curse
	self:Bar(19702, 13) -- Impending Doom
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:ImpendingDoom(args)
	self:CDBar(args.spellId, 20)
	self:Message(args.spellId, "Important")
	self:DelayedMessage(args.spellId, 15, "Urgent", CL.soon:format(args.spellName))
end

function mod:LucifronsCurse(args)
	self:Bar(args.spellId, 20)
	self:Message(args.spellId, "Attention")
	self:DelayedMessage(args.spellId, 15, "Positive", CL.custom_sec:format(args.spellName, 5))
end

function mod:MindControl(args)
	self:Bar(args.spellId, 15, L.mc_bar:format(args.destName))
	self:TargetMessage(args.spellId, args.destName, "Attention")
	self:PrimaryIcon(args.spellId, args.destName)
end
