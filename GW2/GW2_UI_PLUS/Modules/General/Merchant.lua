local _, addonTable = ...

local General = addonTable.General
if not General then return end

local Merchant = {}
General.Merchant = Merchant

local frame = CreateFrame("Frame")

local function Print(message)
    if _G.DEFAULT_CHAT_FRAME and _G.DEFAULT_CHAT_FRAME.AddMessage then
        _G.DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00GW2 UI Plus|r：" .. message)
    end
end

local function SkinBuyEmAll()
    local GW = _G.GW2_ADDON
    local panel = _G.GW2PlusBuyEmAllFrame
    if not GW or not panel or panel.gwPlusSkinned then return end
    panel.gwPlusSkinned = true
    if panel.GwStripTextures then panel:GwStripTextures() end
    if panel.GwCreateBackdrop then panel:GwCreateBackdrop(GW.BackdropTemplates.Default) end

    local background = panel:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetTexture("Interface/AddOns/GW2_UI/textures/party/manage-group-bg.png")

    for _, button in ipairs({
        _G.GW2PlusBuyEmAllOkayButton,
        _G.GW2PlusBuyEmAllCancelButton,
        _G.GW2PlusBuyEmAllStackButton,
        _G.GW2PlusBuyEmAllMaxButton,
    }) do
        if button and button.GwSkinButton then button:GwSkinButton(false, true) end
    end

    local leftButton = _G.GW2PlusBuyEmAllLeftButton
    local rightButton = _G.GW2PlusBuyEmAllRightButton
    if leftButton and GW.HandleNextPrevButton then
        GW.HandleNextPrevButton(leftButton, "left")
        leftButton:SetSize(25, 25)
    end
    if rightButton and GW.HandleNextPrevButton then
        GW.HandleNextPrevButton(rightButton, "right")
        rightButton:SetSize(25, 25)
    end

    local inputBackground = panel:CreateTexture(nil, "BACKGROUND", nil, 1)
    inputBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg.png")
    inputBackground:SetPoint("TOPLEFT", 48, -15)
    inputBackground:SetPoint("BOTTOMRIGHT", -48, 82)
end

local function HandleEvent(_, event)
    local db = General.GetDB()
    if event == "PLAYER_ENTERING_WORLD" then
        SkinBuyEmAll()
    elseif event == "TRADE_SHOW" and db.blockLowLevelTrade then
        local maxLevel = type(GetMaxPlayerLevel) == "function" and GetMaxPlayerLevel()
        if type(maxLevel) == "number" and type(UnitLevel) == "function" and
            UnitLevel("player") < maxLevel and type(CloseTrade) == "function" then
            CloseTrade()
            Print("未满级角色已屏蔽交易。")
        end
    end
end

frame:SetScript("OnEvent", HandleEvent)

function Merchant.Apply(db)
    db = type(db) == "table" and db or General.GetDB()
    frame:UnregisterAllEvents()
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    if db.blockLowLevelTrade then frame:RegisterEvent("TRADE_SHOW") end
    SkinBuyEmAll()
end

