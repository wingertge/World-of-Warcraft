-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Echo of Jaina", 820)
if not mod then return end
mod.partyContent = true
mod:RegisterEnableMob(54445)
mod.toggleOptions = {
	"bosskill",
}

-------------------------------------------------------------------------------
--  Localization

local L = mod:NewLocale("enUS", true)
if L then


end
L = mod:GetLocale()

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Death("Win", 54445)
end

-------------------------------------------------------------------------------
--  Event Handlers
