--[[
	https://wowpedia.fandom.com/wiki/Widget_script_handlers#Slider -- Slider events
	https://wowpedia.fandom.com/wiki/UIOBJECT_Slider?so=search -- slider api
]]

local f = CreateFrame("Frame");

function f:OnEvent(event, addOnName)
	if addOnName == "HideDebuffs" then
        HideDebuffsDB = HideDebuffsDB
		self.db = HideDebuffsDB
		self:InitializeOptions()
        if DebuffValue then
            MAX_TARGET_DEBUFFS = DebuffValue;
            MAX_TARGET_BUFFS = DebuffValue;
            ChatFrame1:AddMessage("debuffs set to " .. DebuffValue);
        end
	end
end

f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", f.OnEvent)



function f:InitializeOptions()
	self.panel = CreateFrame("Frame")
	self.panel.name = "HideDebuffs"

	local DebuffSlider = CreateFrame("Slider", "DebuffAndBuffLimit", self.panel, "OptionsSliderTemplate")
	DebuffSlider:SetPoint("CENTER",0,0)
	DebuffSlider:SetWidth(400)
	DebuffSlider:SetHeight(20)
	DebuffSlider:SetOrientation('HORIZONTAL')
	_G[DebuffSlider:GetName() .. 'Low']:SetText("0")
	_G[DebuffSlider:GetName() .. 'High']:SetText("16")
	_G[DebuffSlider:GetName() .. 'Text']:SetText("8")
	DebuffSlider:SetMinMaxValues(0, 16)
	if DebuffValue then
		DebuffSlider:SetValue(DebuffValue);
	else
		DebuffSlider:SetValue(16)
	end
    DebuffSlider:SetValueStep(1)
	DebuffSlider:SetScript("OnValueChanged", function(self)
		DebuffValue = self:GetValue()
		MAX_TARGET_DEBUFFS = DebuffValue;
		MAX_TARGET_BUFFS = DebuffValue;
	end)
	InterfaceOptions_AddCategory(self.panel)
end

SLASH_HELLOW1 = "/hd"
SLASH_HELLOW2 = "/hidedebuffs"

SlashCmdList.HELLOW = function(msg, editBox)
	InterfaceOptionsFrame_OpenToCategory(f.panel)
end