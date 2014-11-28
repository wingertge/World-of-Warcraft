local T, C, L = select(2, ...):unpack()

local TukuiActionBars = T["ActionBars"]
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS
local Replace = string.gsub
local SpellFlyout = SpellFlyout
local FlyoutButtons = 0
local ActionButton_HideOverlayGlow = ActionButton_HideOverlayGlow

function TukuiActionBars:SkinButton()
	local Name = self:GetName()
	local Action = self.action
	local Button = self
	local Icon = _G[Name.."Icon"]
	local Count = _G[Name.."Count"]
	local Flash	 = _G[Name.."Flash"]
	local HotKey = _G[Name.."HotKey"]
	local Border  = _G[Name.."Border"]
	local Btname = _G[Name.."Name"]
	local Normal  = _G[Name.."NormalTexture"]
	local BtnBG = _G[Name.."FloatingBG"]
	local Font = T.GetFont(C["ActionBars"].Font)
 
	Flash:SetTexture("")
	Button:SetNormalTexture("")
 
	Count:ClearAllPoints()
	Count:Point("BOTTOMRIGHT", 0, 2)
	
	HotKey:ClearAllPoints()
	HotKey:Point("TOPRIGHT", 0, -3)
	
	if (Border and Border:IsShown()) then
		Border:Hide()
		Border = Noop
	end
	
	if (Btname and Normal and C.ActionBars.Macro) then
		local String = GetActionText(Action)
		
		if String then
			local Text = string.sub(String, 1, 5)
			Btname:SetText(Text)
		end
	end
	
	if (Button.isSkinned) then
		return
	end
	
	Count:SetFontObject(Font)
	
	if (Btname) then
		if (C.ActionBars.Macro) then
			Btname:SetFontObject(Font)
			Btname:ClearAllPoints()
			Btname:SetPoint("BOTTOM", 1, 1)
		else
			Btname:SetText("")
			Btname:Kill()
		end
	end
	
	if (BtnBG) then
		BtnBG:Kill()
	end
 
	if (C.ActionBars.HotKey) then
		-- Do we really needed to force an update to button hotkey on login now? 
		ActionButton_UpdateHotkeys(self, self.buttonType)
		
		HotKey:SetFontObject(Font)
		HotKey.ClearAllPoints = Noop
		HotKey.SetPoint = Noop
	else
		HotKey:SetText("")
		HotKey:Kill()
	end
	
	if (Name:match("Extra")) then
		Button:SetTemplate()
		Button.Pushed = true
		Icon:SetDrawLayer("ARTWORK")
	else
		Button:CreateBackdrop()
		Button.Backdrop:SetOutside(Button, 0, 0)	
		Button:UnregisterEvent("ACTIONBAR_SHOWGRID")
		Button:UnregisterEvent("ACTIONBAR_HIDEGRID")
	end
	
	Icon:SetTexCoord(unpack(T.IconCoord))
	Icon:SetInside()
	
	if (Normal) then
		Normal:ClearAllPoints()
		Normal:SetPoint("TOPLEFT")
		Normal:SetPoint("BOTTOMRIGHT")
		
		if (Button:GetChecked()) then
			ActionButton_UpdateState(Button)
		end
	end
	
	Button:StyleButton()
	Button.isSkinned = true
end

function TukuiActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, Pet)
	if Button.isSkinned then return end
	
	local PetSize = C.ActionBars.PetButtonSize
	local HotKey = _G[Button:GetName().."HotKey"]
	local Flash = _G[Name.."Flash"]
	local Font = T.GetFont(C["ActionBars"].Font)
	
	Button:SetWidth(PetSize)
	Button:SetHeight(PetSize)
	Button:CreateBackdrop()
	Button.Backdrop:SetOutside(Button, 0, 0)
	
	if (C.ActionBars.HotKey) then
		HotKey:SetFontObject(Font)
		HotKey:ClearAllPoints()
		HotKey:Point("TOPRIGHT", 0, -3)
	else
		HotKey:SetText("")
		HotKey:Kill()	
	end
	
	Icon:SetTexCoord(unpack(T.IconCoord))
	Icon:ClearAllPoints()
	Icon:SetInside()
	
	if (Pet) then			
		if (PetSize < 30) then
			local AutoCast = _G[Name.."AutoCastable"]
			AutoCast:SetAlpha(0)
		end
		
		local Shine = _G[Name.."Shine"]
		Shine:Size(PetSize)
		Shine:ClearAllPoints()
		Shine:Point("CENTER", Button, 0, 0)
		
		self.UpdateHotKey(Button)
	end
	
	Button:SetNormalTexture("")
	Button.SetNormalTexture = Noop
	
	Flash:SetTexture("")
	
	if Normal then
		Normal:ClearAllPoints()
		Normal:SetPoint("TOPLEFT")
		Normal:SetPoint("BOTTOMRIGHT")
	end

	Button:StyleButton()
	Button.isSkinned = true
end

function TukuiActionBars:SkinPetButtons()
	for i = 1, NUM_PET_ACTION_SLOTS do
		local Name = "PetActionButton"..i
		local Button  = _G[Name]
		local Icon  = _G[Name.."Icon"]
		local Normal  = _G[Name.."NormalTexture2"] -- ?? 2
		
		TukuiActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, true)
	end
end

function TukuiActionBars:SkinStanceButtons()
	for i=1, NUM_STANCE_SLOTS do
		local Name = "StanceButton"..i
		local Button  = _G[Name]
		local Icon  = _G[Name.."Icon"]
		local Normal  = _G[Name.."NormalTexture"]
		
		TukuiActionBars:SkinPetAndShiftButton(Normal, Button, Icon, Name, false)
	end
end

function TukuiActionBars:SkinFlyoutButtons()
	for i = 1, FlyoutButtons do
		local Button = _G["SpellFlyoutButton"..i]
		
		if Button and not Button.IsSkinned then
			TukuiActionBars.SkinButton(Button)
			
			if Button:GetChecked() then
				Button:SetChecked(nil)
			end
			
			Button.IsSkinned = true
		end
	end
end

function TukuiActionBars:StyleFlyout()
	if not self.FlyoutArrow then return end
	
	local HB = SpellFlyoutHorizontalBackground
	local VB = SpellFlyoutVerticalBackground
	local BE = SpellFlyoutBackgroundEnd
	
	if self.FlyoutBorder then
		self.FlyoutBorder:SetAlpha(0)
		self.FlyoutBorderShadow:SetAlpha(0)
	end
	
	HB:SetAlpha(0)
	VB:SetAlpha(0)
	BE:SetAlpha(0)
	
	for i = 1, GetNumFlyouts() do
		local ID = GetFlyoutID(i)
		local _, _, NumSlots, IsKnown = GetFlyoutInfo(ID)
		if IsKnown then
			FlyoutButtons = NumSlots
			break
		end
	end
		
	TukuiActionBars.SkinFlyoutButtons()
end

local ProcBackdrop = {
	edgeFile = C.Medias.Blank, edgeSize = T.Mult,
	insets = {left = T.Mult, right = T.Mult, top = T.Mult, bottom = T.Mult},
}

-- NOTE: Try to find a better animation for this.
function TukuiActionBars:StartButtonHighlight()
	if self.overlay then
		self.overlay:Hide()
		ActionButton_HideOverlayGlow(self)
	end
	
	if not self.Animation then
		local NewProc = CreateFrame("Frame", nil, self)
		NewProc:SetBackdrop(ProcBackdrop)
		NewProc:SetBackdropBorderColor(1, 1, 0)
		NewProc:SetAllPoints(self)

		self.NewProc = NewProc

		local Animation = self.NewProc:CreateAnimationGroup()
		Animation:SetLooping("BOUNCE")

		local FadeOut = Animation:CreateAnimation("Alpha")
		FadeOut:SetChange(-1)
		FadeOut:SetDuration(0.40)
		FadeOut:SetSmoothing("IN_OUT")

		self.Animation = Animation
	end

	if not self.Animation:IsPlaying() then
		self.Animation:Play()
		self.NewProc:Show()
	end
end

function TukuiActionBars:StopButtonHighlight()
	if self.Animation and self.Animation:IsPlaying() then
		self.Animation:Stop()
		self.NewProc:Hide()
	end
end

function TukuiActionBars:UpdateHotKey(btype)
	local HotKey = _G[self:GetName() .. "HotKey"]
	local Text = HotKey:GetText()
	local Indicator = _G["RANGE_INDICATOR"]
	
	if (not Text) then
		return
	end
	
	Text = Replace(Text, "(s%-)", "S")
	Text = Replace(Text, "(a%-)", "A")
	Text = Replace(Text, "(c%-)", "C")
	Text = Replace(Text, "(Mouse Button )", "M")
	Text = Replace(Text, "(Middle Mouse)", "M3")
	Text = Replace(Text, "(Mouse Wheel Up)", "MU")
	Text = Replace(Text, "(Mouse Wheel Down)", "MD")
	Text = Replace(Text, "(Num Pad )", "N")
	Text = Replace(Text, "(Page Up)", "PU")
	Text = Replace(Text, "(Page Down)", "PD")
	Text = Replace(Text, "(Spacebar)", "SpB")
	Text = Replace(Text, "(Insert)", "Ins")
	Text = Replace(Text, "(Home)", "Hm")
	Text = Replace(Text, "(Delete)", "Del")
	Text = Replace(Text, "(Help)", "Hlp") -- mac
	
	if HotKey:GetText() == Indicator then
		HotKey:SetText("")
	else
		HotKey:SetText(Text)
	end
end

