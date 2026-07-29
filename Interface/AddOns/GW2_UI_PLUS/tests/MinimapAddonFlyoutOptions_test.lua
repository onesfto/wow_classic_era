local function Read(path)
    local file = assert(io.open(path, "r"))
    local content = file:read("*a")
    file:close()
    return content
end

local options = Read("Minimap/Options.lua")
local core = Read("core.lua")
local toc = Read("GW2_UI_PLUS.toc")

assert(options:find("BuildMinimapAddonFlyoutPanel", 1, true),
    "设置模块应导出插件悬浮按钮面板构建函数")
assert(options:find("Flyout.SetEnabled(value)", 1, true),
    "独立开关应立即调用模块启停接口")
assert(options:find("isMasterToggle = true", 1, true),
    "插件悬浮按钮开关应为设置页主开关")
assert(options:find("GW2PlusMinimapAddonFlyout_Enable", 1, true),
    "独立开关应提供稳定的设置项名称")
assert(options:find("AddOptionDropdown(", 1, true)
    and options:find('"位置"', 1, true),
    "设置页应提供插件悬浮入口位置下拉框")
for _, value in ipairs({
    "TOPLEFT", "TOP", "TOPRIGHT", "LEFT",
    "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}) do
    assert(options:find('"' .. value .. '"', 1, true),
        "位置下拉框缺少保存值 " .. value)
end
for _, name in ipairs({
    "左上", "上", "右上", "左中",
    "右中", "左下", "下", "右下",
}) do
    assert(options:find('"' .. name .. '"', 1, true),
        "位置下拉框缺少显示名称 " .. name)
end
assert(options:find("Flyout.GetPosition", 1, true)
    and options:find("Flyout.SetPosition(value)", 1, true),
    "位置下拉框应通过运行模块接口立即读写")
assert(options:find("dependence = {", 1, true)
    and options:find(
        '["GW2PlusMinimapAddonFlyout_Enable"] = true',
        1, true),
    "位置下拉框应依赖插件悬浮按钮主开关")
assert(options:find(
        "GW2PlusMinimapAddonFlyout_Position", 1, true),
    "位置下拉框应提供稳定的设置项名称")
assert(not options:find("MINIMAP_ENABLED", 1, true),
    "设置页不得依赖 GW2_UI 小地图开关")

assert(core:find("BuildMinimapAddonFlyoutPanel", 1, true),
    "附加组件分类应构建插件悬浮按钮设置页")
assert(core:find('name = "插件悬浮按钮"', 1, true),
    "附加组件分类应注册插件悬浮按钮子页")

local runtimeAt = assert(
    toc:find("Minimap/AddonFlyout.lua", 1, true))
local optionsAt = assert(
    toc:find("Minimap/Options.lua", 1, true))
local coreAt = assert(toc:find("core.lua", 1, true))
assert(runtimeAt < optionsAt and optionsAt < coreAt,
    "TOC 应先加载运行时模块，再加载设置页和 core.lua")

print("MinimapAddonFlyoutOptions_test: OK")
