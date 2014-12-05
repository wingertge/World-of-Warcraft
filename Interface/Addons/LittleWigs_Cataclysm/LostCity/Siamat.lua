-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Siamat", 747)
if not mod then return end
mod.partyContent = true
mod:RegisterEnableMob(44819)
mod.toggleOptions = {
	"servant",
	"phase",
	"bosskill",
}

-------------------------------------------------------------------------------
--  Locals

local adds = 0

-------------------------------------------------------------------------------
--  Localization

local L = mod:NewLocale("enUS", true)
if L then


end
L = mod:GetLocale()

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Log("SPELL_SUMMON", "Servant", 90014, 90013, 84553)
	self:Yell("Engage", L["engage_trigger"])

	self:Death("Win", 44819)
end

function mod:OnEngage()
	adds = 0
end

-------------------------------------------------------------------------------
--  Event Handlers

function mod:Servant(_, spellId)
	adds = adds + 1
	if adds == 3 then
		self:Message("phase", L["phase_warning"], "Attention")
		adds = 0
	end
	self:Message("servant", L["servant_message"], "Important", spellId, "Alert")
end

