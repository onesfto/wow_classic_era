local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local mageBar = Read("ActionBar/MageBar.lua")
local actionBar = Read("ActionBar/ActionBar.lua")
local options = Read("ActionBar/Options.lua")

assert(mageBar:find('RegisterForClicks("AnyUp", "AnyDown")', 1, true),
    "法师安全按钮必须同时响应按下和抬起事件")
assert(actionBar:find("mageBarEnable = true", 1, true)
    and actionBar:find("mageBarVertical = false", 1, true)
    and actionBar:find("mageBarTeleport = true", 1, true)
    and actionBar:find("mageBarPortal = true", 1, true)
    and actionBar:find("mageBarFood = false", 1, true)
    and actionBar:find("mageBarWater = false", 1, true)
    and actionBar:find("mageBarGem = false", 1, true),
    "法师动作条默认分组不符合要求")
assert(options:find("isMage and db.mageBarEnable", 1, true),
    "非 法师角色的法师动作条开关默认必须为未选中")

print("MageBar_test: OK")
