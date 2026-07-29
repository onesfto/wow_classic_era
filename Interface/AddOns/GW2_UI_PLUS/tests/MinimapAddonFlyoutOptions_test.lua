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
