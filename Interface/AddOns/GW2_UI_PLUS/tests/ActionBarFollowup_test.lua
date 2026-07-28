local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local actionBar = Read("ActionBar/ActionBar.lua")
local options = Read("ActionBar/Options.lua")
local hardcoded = Read("locale/Hardcoded.lua")

for _, label in ipairs({"尺寸", "间距", "按钮数", "行按钮数"}) do
    assert(actionBar:find(label, 1, true), "HUD 动作条编辑面板缺少：" .. label)
end
for _, oldLabel in ipairs({"按钮尺寸", "按钮间距", "显示按钮数", "每行列数"}) do
    assert(not actionBar:find('{"size", "' .. oldLabel, 1, true)
        and not actionBar:find('{"spacing", "' .. oldLabel, 1, true)
        and not actionBar:find('{"count", "' .. oldLabel, 1, true)
        and not actionBar:find('{"columns", "' .. oldLabel, 1, true),
        "HUD 动作条编辑面板仍使用旧名称：" .. oldLabel)
end
assert(actionBar:find("optionScaleable = false", 1, true),
    "动作条 HUD 编辑面板应停用原生缩放项")
assert(actionBar:find("SyncMainBarMoverVisual", 1, true),
    "主动作条移动框应按实际按钮区域同步")
assert(actionBar:find("EnsureNormalPlayerFrame", 1, true),
    "使用球状血条时仍应补载普通玩家框体")
assert(actionBar:find('CreateFrame("EditBox"', 1, true)
    and actionBar:find("row.slider:SetSize(120, 16)", 1, true)
    and actionBar:find("gwstatusbar%-bg%.png"),
    "HUD 动作条滑块应复用原生缩放滑块的轨道与输入框样式")
assert(options:find("AB.ResetMoverPosition", 1, true),
    "设置页恢复默认时也应恢复对应动作条的 mover 位置")
assert(actionBar:find("function AB.ResetMoverPosition", 1, true)
    and actionBar:find("mover.savedPoint = GW.CopyTable", 1, true),
    "Plus 应强制同步 mover 的默认坐标与 savedPoint")
assert(actionBar:find("function AB.RefreshMoverOptionPanel", 1, true),
    "HUD 编辑界面的动作条参数面板应提供外部刷新入口")
assert(not actionBar:find("bar:GetBottom()", 1, true),
    "主动作条默认位置不能从已拖动后的当前坐标采样")
assert(options:find("550 / data.columnCount", 1, true)
    and options:find("topPadding", 1, true)
    and options:find("gwPlusColumns = 4", 1, true),
    "渐隐动作条必须固定四列，并在分组标题后保留间距")
assert(options:find("local HEADER_EXTENT = 40", 1, true)
    and options:find("HEADER_OPTION_GAP = 8", 1, true)
    and options:find("topPadding = GetTopPadding(options, index)", 1, true),
    "小标题应使用原生高度，并与第一行选项保留 8 像素")
assert(actionBar:find("mainBarShowMacro", 1, true)
    and actionBar:find("mainBarShowHotkey", 1, true)
    and actionBar:find('mainBarHotkeyPosition = "BOTTOM"', 1, true)
    and actionBar:find('mainBarMacroPosition = "TOP"', 1, true)
    and actionBar:find("mainBarMacroX", 1, true)
    and actionBar:find("mainBarMacroY", 1, true)
    and actionBar:find("mainBarMacroSize", 1, true),
    "主动作条应保存快捷键与宏名称的显示、位置和字号")
assert(actionBar:find("AB.SIZE_MIN = 12", 1, true)
    and actionBar:find("AB.SIZE_MAX = 64", 1, true)
    and actionBar:find('{"spacing", "间距", 0, 20, 1}', 1, true),
    "动作条尺寸和 HUD 间距范围不正确")

-- 问题 4：恢复默认必须照抄 defaultPoint，不许自己复刻经验条/血球样式的动态偏移，
-- 那个偏移由本体布局管理器负责（mainBarLayout.lua 的 onstate_Barlayout）
assert(not actionBar:find("displayPoint", 1, true)
    and not actionBar:find("XPBAR_ENABLED and 14", 1, true),
    "恢复默认不能再自行复刻动作条 2、3 的动态偏移")
assert(actionBar:find("function AB.RefreshNativeBarLayout", 1, true)
    and actionBar:find("AB.RefreshNativeBarLayout()", 1, true),
    "恢复默认后应让本体布局管理器按 isMoved=false 重算底部动作条位置")

-- 问题 3：SetActionBarToggles 被本体 hook 后会绕回 UpdateMultibarButtons，
-- 无条件调用会让全部 2–8 条重排
local layout = Read("ActionBar/Layout.lua")
assert(layout:find("local function SyncActionBarToggles", 1, true)
    and layout:find("if changed then SetActionBarToggles", 1, true),
    "只有开关状态确实变化时才允许调用 SetActionBarToggles")

-- 问题 1、2：文字位置改用独立代理层，不再和本体抢原生 FontString
assert(layout:find("gwPlusProxy", 1, true)
    and layout:find("local function EnsureTextProxy", 1, true),
    "文字位置应通过 Plus 自建的代理文字层实现")
assert(not layout:find("local function RestoreTextPosition", 1, true)
    and not layout:find("local function ProtectTextPosition", 1, true),
    "不应再用 SetPoint 后处理去抢原生文字层")
assert(layout:find("button.showMacroName = false", 1, true)
    and actionBar:find("btn.showMacroName = false", 1, true),
    "必须关掉本体宏名称分支，避免它改原生文字层宽度导致按钮变大")

assert(hardcoded:find('panelId == "objectives_general"', 1, true),
    "任务目标翻译必须只匹配任务追踪设置页")
assert(not hardcoded:find("itemData.name == OBJECTIVES_TRACKER_LABEL", 1, true),
    "任务目标翻译不能再仅凭同名文本匹配")
for _, text in ipairs({
    "布局", "隐藏占位符", "显示占位符", "显示网格", "隐藏网格", "锁定界面",
}) do
    assert(hardcoded:find(text, 1, true), "HUD 编辑界面缺少翻译：" .. text)
end

print("ActionBarFollowup_test: OK")
