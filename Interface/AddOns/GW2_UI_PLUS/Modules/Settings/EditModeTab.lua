local _, addonTable = ...

local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_pointer.png"

local function BuildEditModeTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusEditModeTab then return end

    -- 创建一个空壳 tab 仅用于在标签栏占位，不插入 settingsWindow.tabs，
    -- 所以永远不会作为真正的页面被切换到。
    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsEditMode"
    tab:Hide()

    settingsWindow:AddTab(ICON_PATH, tab)

    -- 覆盖刚创建的标签按钮 OnClick：直接触发编辑模式，无需中间页面
    local tabButton = settingsWindow.tabButtons[#settingsWindow.tabButtons]
    if tabButton then
        tabButton:SetScript("OnClick", function()
            if InCombatLockdown() then
                local GW = _G.GW2_ADDON
                if GW and GW.Notice then
                    GW.Notice("您不能在战斗中移动界面元素！")
                end
                return
            end
            if settingsWindow:IsShown() then
                settingsWindow:Hide()
            end
            local GW = _G.GW2_ADDON
            if GW and GW.moveHudObjects and GW.MoveHudScaleableFrame then
                GW.moveHudObjects(GW.MoveHudScaleableFrame)
            end
        end)
    end

    settingsWindow.gwPlusEditModeTab = tab

    -- 隐藏综述标签里重复的"编辑界面"按钮，顶层图标已替代该入口
    for _, t in ipairs(settingsWindow.tabs) do
        if t.name == "GwSettingsOverview"
            and t.menu and t.menu.movehudbtn then
            t.menu.movehudbtn:Hide()
            break
        end
    end
end

addonTable.BuildEditModeTab = BuildEditModeTab
