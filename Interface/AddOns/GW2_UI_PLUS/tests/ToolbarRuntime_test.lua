local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local core = Read("Toolbar/Core.lua")
local groupManage = Read("Toolbar/GroupManage.lua")
local quickBar = Read("Toolbar/QuickBar.lua")
local markerBar = Read("Toolbar/MarkerBar.lua")
local performanceBar = Read("Toolbar/PerformanceBar.lua")
local toc = Read("GW2_UI_PLUS.toc")
local allRuntime = table.concat({
    core, groupManage, quickBar, markerBar, performanceBar,
}, "\n")

for _, pigInternal in ipairs({"PIGA", "PigLayoutFun", "PD."}) do
    assert(not allRuntime:find(pigInternal, 1, true),
        "工具条不得依赖 PIG 内部对象：" .. pigInternal)
end

assert(core:match("groupManage%s*=%s*{%s*enabled%s*=%s*true"),
    "队伍管理必须默认启用")
for _, disabled in ipairs({"quickBar", "markerBar", "performanceBar"}) do
    assert(core:match(disabled .. "%s*=%s*{%s*enabled%s*=%s*false"),
        disabled .. " 必须默认关闭")
end
for _, name in ipairs({"队伍管理", "快捷条", "标记条", "性能条"}) do
    assert(core:find('"' .. name .. '"', 1, true),
        "缺少 mover 名称：" .. name)
end
assert(core:find("GW.RegisterMovableFrame", 1, true),
    "四个模块必须通过公共接口注册 mover")
assert(core:find("GW.ToggleMover", 1, true),
    "模块开关必须同步 mover")
assert(core:find("OnProfileChanged", 1, true),
    "切换 GW2_UI 配置档后必须重绑 mover")

assert(groupManage:find("GW.CreateRaidControlFrame", 1, true),
    "队伍管理应确保 GW2_UI 原框体已创建")
assert(groupManage:find("GwManageGroupButton", 1, true)
    and groupManage:find("GwGroupManage", 1, true),
    "队伍管理必须接管入口和面板")
assert(groupManage:find("RegisterStateDriver", 1, true)
    and groupManage:find("[group]", 1, true),
    "单人隐藏必须使用安全组队状态")
assert(groupManage:find(
        'Toolbar.RegisterMover("groupManage"', 1, true),
    "队伍管理必须注册独立 mover")

for _, key in ipairs({
    "leave", "teleport", "convert", "reset",
    "timer", "role", "ready", "countdown",
}) do
    assert(quickBar:find(key, 1, true),
        "快捷条缺少按钮：" .. key)
end
assert(not quickBar:find("COMBATLOG", 1, true)
    and not quickBar:find("advancedCombatLogging", 1, true),
    "快捷条不得包含战斗记录")
for _, mode in ipairs({"COMBAT", "CLOCK", "DYNAMIC"}) do
    assert(quickBar:find('"' .. mode .. '"', 1, true),
        "快捷条缺少时间模式：" .. mode)
end
assert(quickBar:find("MenuUtil.CreateContextMenu", 1, true),
    "倒计时预设必须使用当前菜单 API")
assert(quickBar:find("C_VoiceChat.SpeakText", 1, true),
    "读秒必须使用客户端系统语音")
assert(quickBar:find(
        'Toolbar.RegisterMover("quickBar"', 1, true),
    "快捷条必须注册独立 mover")

assert(markerBar:find("SecureActionButtonTemplate", 1, true),
    "经典标记按钮必须使用安全动作按钮")
assert(markerBar:find('"/tm " .. info.index', 1, true),
    "标记条必须生成 /tm 0～8 安全宏")
for _, label in ipairs({
    "骷髅", "十字", "方块", "月亮", "三角",
    "菱形", "圆圈", "星星", "清除标记",
}) do
    assert(markerBar:find('label = "' .. label .. '"', 1, true),
        "标记条缺少按钮：" .. label)
end
assert(not markerBar:find("worldmarker", 1, true)
    and not markerBar:find("PlaceRaidMarker", 1, true),
    "Classic Era 标记条不得创建地面标记")
for _, key in ipairs({
    "hideNoTarget", "hideSolo", "hideNoPermission",
}) do
    assert(markerBar:find(key, 1, true),
        "标记条缺少显隐规则：" .. key)
end
assert(markerBar:find(
        'Toolbar.RegisterMover("markerBar"', 1, true),
    "标记条必须注册独立 mover")

for _, key in ipairs({"showFPS", "showHome", "showWorld"}) do
    assert(performanceBar:find(key, 1, true),
        "性能条缺少项目：" .. key)
end
assert(performanceBar:find("GetFramerate", 1, true),
    "性能条必须读取 FPS")
assert(performanceBar:find("GetNetStats", 1, true),
    "性能条必须读取本地和世界延迟")
assert(performanceBar:find("SetSize", 1, true),
    "性能条必须即时应用宽高")
assert(performanceBar:find("enabledCount <= 1", 1, true),
    "性能条必须拒绝关闭最后一个项目")
assert(not performanceBar:find("SetScale", 1, true),
    "性能条不得提供缩放")
assert(performanceBar:find(
        'Toolbar.RegisterMover("performanceBar"', 1, true),
    "性能条必须注册独立 mover")

local coreAt = assert(toc:find("Toolbar/Core.lua", 1, true))
local groupAt = assert(toc:find("Toolbar/GroupManage.lua", 1, true))
local quickAt = assert(toc:find("Toolbar/QuickBar.lua", 1, true))
local markerAt = assert(toc:find("Toolbar/MarkerBar.lua", 1, true))
local performanceAt = assert(toc:find("Toolbar/PerformanceBar.lua", 1, true))
local optionsAt = assert(toc:find("Toolbar/Options.lua", 1, true))
local addonCoreAt = assert(toc:find("core.lua", 1, true))
assert(coreAt < groupAt and groupAt < quickAt and quickAt < markerAt
    and markerAt < performanceAt and performanceAt < optionsAt
    and optionsAt < addonCoreAt,
    "TOC 工具条加载顺序错误")

print("ToolbarRuntime_test: OK")
