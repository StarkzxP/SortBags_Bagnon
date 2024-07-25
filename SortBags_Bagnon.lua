local frame = CreateFrame("Frame")

local bagsButtonCreated = false
local bankButtonCreated = false

local function AddButtonToBagnon()
    local bagnonFrame = Bagnon
    if not bagnonFrame then
        DEFAULT_CHAT_FRAME:AddMessage("Bagnon frame not found!")
        return
    end

    SortBagsButton:SetParent(bagnonFrame)
    SortBagsButton:ClearAllPoints()
    SortBagsButton:SetPoint("TOPRIGHT", bagnonFrame, "TOPRIGHT", -35, -9)
    SortBagsButton:SetFrameStrata("DIALOG")
end

local function AddButtonToBanknon()
    local banknonFrame = Banknon
    if not banknonFrame then
        DEFAULT_CHAT_FRAME:AddMessage("Banknon frame not found!")
        return
    end

    SortBankButton:SetParent(banknonFrame)
    SortBankButton:ClearAllPoints()
    SortBankButton:SetPoint("TOPRIGHT", banknonFrame, "TOPRIGHT", -35, -9)
    SortBankButton:SetFrameStrata("DIALOG")
end

local function OnEvent()
    if not bagsButtonCreated and arg1 == "Bagnon" then
        AddButtonToBagnon()
        bagsButtonCreated = true
    end
    if not bankButtonCreated and arg1 == "Banknon" then
        AddButtonToBanknon()
        bankButtonCreated = true
    end
end

frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnEvent)

function SortBagsButton_OnClick()
    SortBags()
end

function SortBagsButton_OnEnter()
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint("TOPRIGHT", this, "BOTTOMRIGHT")
    GameTooltip:SetOwner(this, "ANCHOR_PRESERVE")
    GameTooltip:SetText("Sort Left to Right", 1, 1, 1)
    GameTooltip:AddLine("<Left-Click> to sort.")
    --GameTooltip:AddLine("<Right-Click> to change sorting direction.")
    GameTooltip:Show()
end

function SortBagsButton_OnLeave()
    GameTooltip:Hide()
end

function SortBankButton_OnClick()
    SortBankBags()
end

function SortBankButton_OnEnter()
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint("TOPRIGHT", this, "BOTTOMRIGHT")
    GameTooltip:SetOwner(this, "ANCHOR_PRESERVE")
    GameTooltip:SetText("Sort Left to Right", 1, 1, 1)
    GameTooltip:AddLine("<Left-Click> to sort.")
    --GameTooltip:AddLine("<Right-Click> to change sorting direction.")
    GameTooltip:Show()
end

function SortBankButton_OnLeave()
    GameTooltip:Hide()
end
