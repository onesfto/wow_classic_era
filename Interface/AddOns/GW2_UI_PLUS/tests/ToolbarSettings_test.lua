local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local options = Read("Toolbar/Options.lua")
local core = Read("core.lua")

assert(options:find("BuildToolbarPanel", 1, true),
    "设置模块必须导出工具条面板")
for _, name in ipairs({"队伍管理", "快捷条", "标记条", "性能条"}) do
    assert(options:find('AddGroupHeader("' .. name .. '")', 1, true),
        "工具条页面缺少分组：" .. name)
end
assert(core:find("BuildToolbarPanel", 1, true)
    and core:find('name = "工具条"', 1, true),
    "附加组件分类必须注册工具条页面")
assert(not options:find('"锁定"', 1, true),
    "工具条设置不得提供锁定选项")
assert(not options:find("战斗记录", 1, true),
    "快捷条设置不得出现战斗记录")
assert(options:find('"试听语音"', 1, true),
    "快捷条必须提供读秒语音试听")

local performance = assert(options:match(
    'AddGroupHeader%("性能条"%)%s*(.-)%s*return panel'),
    "无法定位性能条设置分组")
assert(performance:find('"宽度"', 1, true)
    and performance:find('"高度"', 1, true),
    "性能条必须提供宽度和高度")
assert(not performance:find('"缩放"', 1, true),
    "性能条不得提供缩放")

for _, optionName in ipairs({
    "GW2PlusToolbarGroupManageEnable",
    "GW2PlusToolbarQuickBarEnable",
    "GW2PlusToolbarMarkerBarEnable",
    "GW2PlusToolbarPerformanceBarEnable",
}) do
    assert(options:find(optionName, 1, true),
        "缺少稳定设置名：" .. optionName)
end

print("ToolbarSettings_test: OK")
