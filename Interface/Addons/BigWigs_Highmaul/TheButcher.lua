
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("The Butcher", 994, 971)
if not mod then return end
mod:RegisterEnableMob(77404)
mod.engageId = 1706

--------------------------------------------------------------------------------
-- Locals
--

local cleaveCount = 1
local addCount = 1
local frenzied = nil

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.frenzy = -8862 -- Frenzy
	L.frenzy_icon = "spell_shadow_unholyfrenzy"

	L.adds_multiple = "Adds x%d"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-10228, {163046, "FLASH"},
		{156147, "TANK"}, {156151, "TANK_HEALER"}, 156157, 156152, {-8860, "PROXIMITY"}, "frenzy",
		"berserk", "bosskill"
	}, {
		[-10228] = "mythic",
		[156147] = "general"
	}
end

function mod:OnBossEnable()
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "BoundingCleave", "boss1")
	self:Log("SPELL_AURA_APPLIED_DOSE", "Cleaver", 156147)
	self:Log("SPELL_AURA_APPLIED", "Tenderizer", 156151)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Tenderizer", 156151)
	self:Log("SPELL_CAST_START", "Cleave", 156157)
	self:Log("SPELL_AURA_APPLIED_DOSE", "GushingWounds", 156152)
	self:Log("SPELL_AURA_REMOVED", "GushingWoundsRemoved", 156152)
	self:Log("SPELL_AURA_APPLIED", "Frenzy", 156598)
	--Mythic
	self:Log("SPELL_CAST_SUCCESS", "AddSpawn", 163051) -- Paleobomb
	self:Log("SPELL_PERIODIC_DAMAGE", "PaleVitriolDamage", 163046)
	self:Log("SPELL_PERIODIC_MISSED", "PaleVitriolDamage", 163046)
end

function mod:OnEngage()
	cleaveCount = 1
	addCount = 1
	frenzied = nil
	self:Bar(156151, 7) -- Tenderizer
	self:Bar(-8860, 60) -- Bounding Cleave
	if self:Mythic() then
		self:Bar(-10228, 18, CL.add, "spell_shadow_corpseexplode")
	end
	if not self:LFR() then
		self:Berserk(self:Mythic() and 240 or 300)
	end
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "boss1")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local prev = 0
	function mod:AddSpawn()
		local t = GetTime()
		if t-prev > 5 then
			-- every four waves adds another add: 3x1, 4x2, 4x3 (might cap/reset, my logs only get to 190s or so)
			local num = floor(addCount / 4) + 1
			self:Message(-10228, "Attention", nil, CL.spawning:format(L.adds_multiple:format(num)), "spell_shadow_corpseexplode")
			addCount = addCount + 1
			local nextNum = floor((addCount) / 4) + 1
			self:Bar(-10228, 14.5, L.adds_multiple:format(nextNum), "spell_shadow_corpseexplode")
			prev = t
		end
	end
end

do
	local prev = 0
	function mod:PaleVitriolDamage(args)
		local t = GetTime()
		if self:Me(args.destGUID) and t-prev > 2 then
			self:Message(args.spellId, "Personal", "Alarm", CL.underyou:format(args.spellName))
			self:Flash(args.spellId)
			prev = t
		end
	end
end

function mod:BoundingCleave(_, spellName, _, _, spellId)
	if spellId == 156197 then -- Bounding Cleave (knockback)
		cleaveCount = 1
		self:Message(-8860, "Urgent", "Alert")
		self:Bar(-8860, frenzied and 30 or 60) -- Bounding Cleave
		self:CDBar(156157, frenzied and 5 or 8) -- Cleave
		self:CDBar(156151, 17) -- Tenderizer

		local _, _, _, stacks = UnitDebuff("player", self:SpellName(156152)) -- Gushing Wounds
		if stacks and stacks > 3 then
			self:OpenProximity(-8860, 10) -- XXX no idea on clump size, 10yds should be safe
			self:ScheduleTimer("CloseProximity", frenzied and 5 or 8, -8860)
		end
	end
end

function mod:Cleaver(args)
	if args.amount % 2 == 0 then
		self:StackMessage(args.spellId, args.destName, args.amount, "Attention")
	end
end

function mod:Tenderizer(args)
	self:StackMessage(args.spellId, args.destName, args.amount, "Urgent", args.amount and "Warning")
	self:CDBar(args.spellId, 17)
end

function mod:Cleave(args)
	self:Message(args.spellId, "Attention", nil, CL.count:format(args.spellName, cleaveCount))
	--self:StopBar(CL.count:format(args.spellName, cleaveCount))
	cleaveCount = cleaveCount + 1
	--self:CDBar(args.spellId, 6, CL.count:format(args.spellName, cleaveCount))
end

function mod:GushingWounds(args)
	if self:Me(args.destGUID) and args.amount > 2 then
		self:StackMessage(args.spellId, args.destName, args.amount, "Personal", "Alarm")
		self:TargetBar(args.spellId, 15, args.destName)
	end
end

function mod:GushingWoundsRemoved(args)
	if self:Me(args.destGUID) then
		self:StopBar(args.spellId, args.destName)
	end
end

function mod:UNIT_HEALTH_FREQUENT(unit)
	local hp = UnitHealth(unit) / UnitHealthMax(unit) * 100
	if hp < 36 then
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss1")
		self:Message("frenzy", "Neutral", "Info", CL.soon:format(self:SpellName(L.frenzy)), false)
	end
end

function mod:Frenzy(args)
	self:Message("frenzy", "Important", "Alarm", args.spellName, L.frenzy_icon)
	frenzied = true
	-- gains power faster while frenzied
	local left = (100 - UnitPower("boss1")) * 0.3
	self:Bar(-8860, left) -- Bounding Cleave
end

