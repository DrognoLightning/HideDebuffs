local f = CreateFrame("Frame");

function f:OnEvent(event, addOnName)
	if addOnName == "HideDebuffs" then
        HideDebuffsDB = HideDebuffsDB
		self.db = HideDebuffsDB
		self:InitializeOptions()
        if SavedZero == true then
            MAX_TARGET_DEBUFFS = 0;
            MAX_TARGET_BUFFS = 0;
            ChatFrame1:AddMessage("Zero debuffs shown");
        else
            ChatFrame1:AddMessage("Default debuffs shown");
        end
	end
end

f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", f.OnEvent)



function f:InitializeOptions()
	self.panel = CreateFrame("Frame")
	self.panel.name = "HideDebuffs"

	local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
	btn:SetPoint("TOPLEFT", 20, -20)
	btn:SetText("Max debuffs 0")
	btn:SetWidth(100)
	btn:SetScript("OnClick", function()
        MAX_TARGET_DEBUFFS = 0;
        MAX_TARGET_BUFFS = 0;
        SavedZero = true;
	end)

    local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
	btn:SetPoint("TOPLEFT", 20, -60)
	btn:SetText("Max debuffs 16")
	btn:SetWidth(100)
	btn:SetScript("OnClick", function()
        MAX_TARGET_DEBUFFS = 16;
        MAX_TARGET_BUFFS = 16;
        SavedZero = false;
	end)

	InterfaceOptions_AddCategory(self.panel)
end

SLASH_HELLOW1 = "/hd"
SLASH_HELLOW2 = "/hidedebuffs"

SlashCmdList.HELLOW = function(msg, editBox)
	InterfaceOptionsFrame_OpenToCategory(f.panel)
end