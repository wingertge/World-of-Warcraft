--[[

****************************************************************************************
Kalecgos Health
$Date: 2009-02-09 01:26:05 +0000 (Mon, 09 Feb 2009) $
$Rev: 2 $

Author: Ackis on Illidan US Horde
****************************************************************************************

Addon to display the health of Kalecgos and Sathrovarr the Corruptor
Thanks to BigWigs mods (Kalecgos Portals and Najentus Assist) which I've reviewed to develop this code.
Please see Wowace.com for more information.

****************************************************************************************

]]

local name = "Kalecgos Health"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
local boss = BB["Kalecgos"]
local sath = BB["Sathrovarr the Corruptor"]
local LBW = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local BWKalecHealth = nil

local GetNumRaidMembers = GetNumRaidMembers
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitName = UnitName
local UnitExists = UnitExists

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "KalecHealth",

	on = "On",
	on_desc = "Toggle BigWigs_KalecHealth on or off.",
	["|cff777777Unknown|r"] = true,
	["Boss Health"] = true,
	["Dragon"] = true,
	["Friendly"] = true,
	["font"] = "Fonts\\FRIZQT__.TTF",
} end )

--[[
L:RegisterTranslations("deDE", function() return {
	cmd = "KalecHealth",

	on = "On",
	on_desc = "Toggle BigWigs_KalecHealth on or off.",
	["|cff777777Unknown|r"] = true,
	["Boss Health"] = true,
	["Dragon"] = true,
	["Friendly"] = true,
} end )
--]]
L:RegisterTranslations("frFR", function() return {
	on = "Actif",
	on_desc = "Active ou non BigWigs_KalecHealth.",
	["|cff777777Unknown|r"] = "|cff777777Inconnu|r",
	["Boss Health"] = "Vie des boss",
	["Dragon"] = "Dragon",
	["Friendly"] = "Amical",
} end )
--[[
L:RegisterTranslations("esES", function() return {
	cmd = "KalecHealth",

	on = "On",
	on_desc = "Toggle BigWigs_KalecHealth on or off.",
	["|cff777777Unknown|r"] = true,
	["Boss Health"] = true,
	["Dragon"] = true,
	["Friendly"] = true,
} end )
]]--

L:RegisterTranslations("koKR", function() return {
	on = "사용",
	on_desc = "BigWigs_KalecHealth 켜거나 끕니다.",
	["|cff777777Unknown|r"] = "|cff777777알 수 없음|r",
	["Boss Health"] = "보스 생명력",
	["Dragon"] = "용",
	["Friendly"] = "우호적",
	["font"] = "Fonts\\2002.TTF",
} end )

--卡雷苟斯
L:RegisterTranslations("zhCN", function() return {
	on = "打开",
	on_desc = "切换BigWigs_KalecHealth卡雷苟斯生命监视模块.",
	["|cff777777Unknown|r"] = "|cff777777未知|r",
	["Boss Health"] = "Boss生命值",
	["Dragon"] = "龙",
	["Friendly"] = "友好",
	["font"] = "Fonts\\ZYKai_T.TTF",
} end )

L:RegisterTranslations("zhTW", function() return {
	on = "啟用",
	on_desc = "啟用或關閉 BigWigs 卡雷苟斯生命監視插件。",
	["|cff777777Unknown|r"] = "|cff777777未知|r",
	["Boss Health"] = "BOSS生命值",
	["Dragon"] = "龍",
	["Friendly"] = "友好",
	["font"] = "Fonts\\bHEI01B.TTF",
} end )

L:RegisterTranslations("ruRU", function() return {
	on = "On",
	on_desc = "Toggle BigWigs_KalecHealth on or off.",
	["|cff777777Unknown|r"] = "|cff777777Unknown|r",
	["Boss Health"] = "Boss Health",
	["Dragon"] = "Dragon",
	["Friendly"] = "Friendly",
	["font"] = "Fonts\\FRIZQT__.TTF",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(name)
mod.synctoken = name
mod.zonename = BZ["Sunwell Plateau"]
mod.enabletrigger = boss
mod.toggleoptions = {"on"}
mod.revision = tonumber(("$Revision: 2 $"):sub(12, -3))
mod.external = true

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("BigWigs_RecvSync")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")

	if BWKalecHealth then
		BWKalecHealth:Hide()
	end
	local DragonHealth = nil
	local SathHealth = nil
	local FriendlyHealth = nil
end

function mod:OnDisable()
	if BWKalecHealth then
		BWKalecHealth:Hide()
	end
end

------------------------------
--      Events              --
------------------------------

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if not self.db.profile.on then return end

	if msg == LBW["engage_trigger"] then
		if not BWKalecHealth then
			self:SetupFrames()
		else
			BWKalecHealth:Show()
			-- Set the health to 100% at the start
			BWKalecHealth.text1:SetText("|cffff0000" .. boss .. " (".. L["Dragon"] .."): 100%")
			BWKalecHealth.text2:SetText("|cffff0000" .. sath .. ": 100%")
			BWKalecHealth.text3:SetText("|cff00ff00" .. boss .. " (".. L["Friendly"] .."): 100%")
		end

		self:ScheduleRepeatingEvent("BWKalecHealthCheck", self.Update, 1, self)
	end
end

function mod:PLAYER_REGEN_ENABLED()
	if not self.db.profile.on then return end

	local go = self:Scan()
	local running = self:IsEventScheduled("Kalecgos_CheckWipe")
	if not go then
		self:TriggerEvent("BigWigs_RebootModule", self)
	elseif not running then
		self:ScheduleRepeatingEvent("Kalecgos_CheckWipe", self.PLAYER_REGEN_ENABLED, 2, self)
	end
end

function mod:BigWigs_RecvSync(sync, rest1, rest2, name)
	if (sync == "BWBossDeath") and (rest1 == "Kalecgos") then
		BigWigs:ToggleModuleActive(self, false)
		if BWKalecHealth then
			BWKalecHealth:Hide()
		end
	elseif (sync == "KalecgosHealth") then
		DragonHealth = tonumber(rest1)
		self:UpdateHealthText()
	elseif (sync == "SathHealth") then
		SathHealth = tonumber(rest1)
		self:UpdateHealthText()
	elseif (sync == "KalecgosHealthNPC") then
		FriendlyHealth = tonumber(rest1)
		self:UpdateHealthText()
	end
end

function mod:UpdateHealthText()
	if not BWKalecHealth then return end

	BWKalecHealth.text1:SetText("|cffff0000" .. boss .. " (".. L["Dragon"] .."): " .. (DragonHealth and DragonHealth .. "%" or "?"))
	BWKalecHealth.text2:SetText("|cffff0000" .. sath .. ": " .. (SathHealth and SathHealth .. "%" or "?"))
	BWKalecHealth.text3:SetText("|cff00ff00" .. boss .. " (".. L["Friendly"] .."): " .. (FriendlyHealth and FriendlyHealth .. "%" or "?"))

end

function mod:Update()

	for i = 1, GetNumRaidMembers() do

		local unitidtarget = "raid" .. i .. "target"
		if UnitExists(unitidtarget) then
			if UnitName(unitidtarget) == boss then
				if UnitIsEnemy("player", unitidtarget) then
					self:Sync("KalecgosHealth", ("%.1f"):format(UnitHealth(unitidtarget)/UnitHealthMax(unitidtarget)*100))
				else
					self:Sync("KalecgosHealthNPC", ("%.1f"):format(UnitHealth(unitidtarget)/UnitHealthMax(unitidtarget)*100))
				end
			elseif UnitName(unitidtarget) == sath then
				self:Sync("SathHealth", ("%.1f"):format(UnitHealth(unitidtarget)/UnitHealthMax(unitidtarget)*100))
			end
		end

	end
end 

function mod:SetupFrames()
	BWKalecHealth = CreateFrame("Frame", "BWKalecHealthDisplay", UIParent)

	BWKalecHealth:SetWidth(200)
	BWKalecHealth:SetHeight(75)

	BWKalecHealth:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\AddOns\\BigWigs\\Textures\\otravi-semi-full-border", edgeSize = 32,
		insets = {left = 1, right = 1, top = 20, bottom = 1},
	})

	BWKalecHealth:SetBackdropColor(24/255, 24/255, 24/255)
	BWKalecHealth:ClearAllPoints()
	BWKalecHealth:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	BWKalecHealth:EnableMouse(true)
	BWKalecHealth:RegisterForDrag("LeftButton")
	BWKalecHealth:SetClampedToScreen(true)
	BWKalecHealth:SetMovable(true)
	BWKalecHealth:SetScript("OnDragStart", function() this:StartMoving() end)
	BWKalecHealth:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
		self:SavePosition()
	end)

	local cheader = BWKalecHealth:CreateFontString(nil, "OVERLAY")
	cheader:ClearAllPoints()
	cheader:SetWidth(190)
	cheader:SetHeight(15)
	cheader:SetPoint("TOP", BWKalecHealth, "TOP", 0, -14)
	cheader:SetFont(L["font"], 12)
	cheader:SetJustifyH("CENTER")
	cheader:SetText(L["Boss Health"])
	cheader:SetShadowOffset(.8, -.8)
	cheader:SetShadowColor(0, 0, 0, 1)
	BWKalecHealth.cheader = cheader

	local text = BWKalecHealth:CreateFontString(nil, "OVERLAY")
	text:ClearAllPoints()
	text:SetWidth( 190 )
	text:SetHeight( 80 )
	text:SetPoint( "TOP", BWKalecHealth, "TOP", 0, -35 )
	text:SetJustifyH("RIGHT")
	text:SetJustifyV("TOP")
	text:SetFont(L["font"], 12)
	BWKalecHealth.text1 = text

	local text = BWKalecHealth:CreateFontString(nil, "OVERLAY")
	text:ClearAllPoints()
	text:SetWidth( 190 )
	text:SetHeight( 80 )
	text:SetPoint( "TOP", BWKalecHealth, "TOP", 0, -45 )
	text:SetJustifyH("RIGHT")
	text:SetJustifyV("TOP")
	text:SetFont(L["font"], 12)
	BWKalecHealth.text2 = text

	local text = BWKalecHealth:CreateFontString(nil, "OVERLAY")
	text:ClearAllPoints()
	text:SetWidth( 190 )
	text:SetHeight( 80 )
	text:SetPoint( "TOP", BWKalecHealth, "TOP", 0, -55 )
	text:SetJustifyH("RIGHT")
	text:SetJustifyV("TOP")
	text:SetFont(L["font"], 12)
	BWKalecHealth.text3 = text

	local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
		local s = BWKalecHealth:GetEffectiveScale()
		BWKalecHealth:ClearAllPoints()
		BWKalecHealth:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	end
	
	self:UpdateHealthText()

end

function mod:SavePosition()
	if not BWKalecHealth then self:SetupFrames() end

	local s = BWKalecHealth:GetEffectiveScale()
	self.db.profile.posx = BWKalecHealth:GetLeft() * s
	self.db.profile.posy = BWKalecHealth:GetTop() * s
end
