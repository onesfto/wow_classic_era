-- GW2_UI_PLUS 诊断命令 (Diagnostics)
--
-- 原本是加在 GW2_UI 的 /gw2 里的一个分支，现在独立成 /gw2plus，本体不用动。
--
--   /gw2plus escdebug   列出可能吞掉 ESC 键的框体
--   /gw2plus fader      全局渐隐状态与各动作条的接管情况（实现在 ActionBar/Fader.lua）
--   /gw2plus magebar    法师动作条各按钮的法术属性（实现在 ActionBar/MageBar.lua）
--   /gw2plus hotkey     快捷键和宏名称的存档值、实际锚点与对齐方式

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end

-- 可能抢 ESC 的框体，按「先看 GW2 自己的，再看暴雪的」排列
local SUSPECT_FRAMES = {
    "GwSettingsWindow",
    "GwPopupFrame1", "GwPopupFrame2", "GwPopupFrame3", "GwPopupFrame4",
    "GwImmersiveQuestFrame",
    "GwSmallSettingsContainer",
    "GossipFrame",
    "HoverBind",
    "AFKMode",
    "GameMenuFrame",
    "StaticPopup1", "StaticPopup2", "StaticPopup3", "StaticPopup4",
    "MailFrame",
    "TradeSkillFrame",
    "CraftFrame",
    "QuestLogFrame",
}

local function GetFrameFlag(frame, methodName)
    if not frame or not frame[methodName] then
        return "n/a"
    end

    local ok, value = pcall(frame[methodName], frame)
    if not ok then
        return "error"
    end

    return tostring(value)
end

local function PrintEscDebugFrame(frameName)
    local frame = _G[frameName]
    if not frame then return end

    local shown = GetFrameFlag(frame, "IsShown")
    local keyboard = GetFrameFlag(frame, "IsKeyboardEnabled")
    local propagate = GetFrameFlag(frame, "GetPropagateKeyboardInput")

    -- 只报可疑的：显示中、抓着键盘、或者关掉了按键传递
    if shown == "true" or keyboard == "true" or propagate == "false" then
        Notice(format("  %s shown=%s keyboard=%s propagate=%s", frameName, shown, keyboard, propagate))
    end
end

local function PrintEscDebug()
    local binding1, binding2 = GetBindingKey("TOGGLEGAMEMENU")
    local focus = GetMouseFocus and GetMouseFocus()
    local focusName = "nil"
    if focus then
        focusName = (focus.GetName and focus:GetName()) or tostring(focus)
    end

    Notice("ESC 诊断：")
    Notice(format("  TOGGLEGAMEMENU=%s%s", tostring(binding1), binding2 and (", " .. binding2) or ""))
    Notice(format("  鼠标焦点=%s", focusName))

    for _, frameName in ipairs(SUSPECT_FRAMES) do
        PrintEscDebugFrame(frameName)
    end
end

SLASH_GW2PLUS1 = "/gw2plus"
function SlashCmdList.GW2PLUS(msg)
    msg = (msg or ""):lower():match("^%s*(.-)%s*$")

    if msg == "escdebug" then
        PrintEscDebug()
    elseif msg == "fader" then
        -- ActionBar 模块比本文件晚加载，运行时再取
        if addonTable.PlusFader and addonTable.PlusFader.PrintDiagnostics then
            addonTable.PlusFader.PrintDiagnostics()
        else
            Notice("|cffff5555全局渐隐模块没加载（ActionBar/Fader.lua）|r")
        end
    elseif msg == "magebar" then
        if addonTable.PlusMageBar and addonTable.PlusMageBar.PrintDiagnostics then
            addonTable.PlusMageBar.PrintDiagnostics()
        else
            Notice("|cffff5555法师动作条模块没加载（ActionBar/MageBar.lua）|r")
        end
    elseif msg == "hotkey" then
        local layout = addonTable.PlusActionBarLayout
        if layout and layout.PrintHotkeyDiagnostics then
            layout.PrintHotkeyDiagnostics()
        else
            Notice("|cffff5555动作条布局模块没加载（ActionBar/Layout.lua）|r")
        end
    else
        Notice("GW2 UI Plus:")
        Notice("  /gw2plus escdebug   -> 列出可能吞掉 ESC 键的框体")
        Notice("  /gw2plus fader      -> 全局渐隐状态与各动作条的接管情况")
        Notice("  /gw2plus magebar    -> 法师动作条各按钮的法术属性")
        Notice("  /gw2plus hotkey     -> 快捷键和宏名称的位置与对齐诊断")
    end
end

addonTable.PrintEscDebug = PrintEscDebug
