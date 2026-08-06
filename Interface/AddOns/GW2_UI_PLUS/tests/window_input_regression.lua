local function NewFrame(name, strata, level)
    local frame = {
        name = name,
        strata = strata or "HIGH",
        level = level or 1,
        mouseEnabled = false,
        shown = true,
        hooks = {},
    }

    function frame:EnableMouse(enabled)
        self.mouseEnabled = enabled
    end

    function frame:SetFrameStrata(value)
        self.strata = value
    end

    function frame:GetFrameStrata()
        return self.strata
    end

    function frame:SetHitRectInsets(left, right, top, bottom)
        self.hitRectInsets = {left, right, top, bottom}
    end

    function frame:Raise()
        self.raised = true
    end

    function frame:HookScript(event, handler)
        self.hooks[event] = handler
    end

    function frame:RegisterEvent() end
    function frame:SetScript() end
    function frame:IsShown() return self.shown end
    function frame:IsForbidden() return false end

    return frame
end

_G.CreateFrame = function(_, name)
    return NewFrame(name)
end

_G.InCombatLockdown = function()
    return false
end

for _, name in ipairs({
    "GwSettingsWindow",
    "GwCharacterWindow",
    "QuestLogFrame",
    "TradeSkillFrame",
    "CraftFrame",
    "GwPopupFrame1",
}) do
    _G[name] = NewFrame(name)
end

local addonTable = {}
local windowInputChunk = assert(loadfile("Core/WindowInput.lua"))
windowInputChunk("GW2_UI_PLUS", addonTable)

assert(type(addonTable.ApplyWindowInput) == "function",
    "缺少统一的窗口鼠标拦截函数")
addonTable.ApplyWindowInput()

for _, name in ipairs({
    "GwSettingsWindow",
    "GwCharacterWindow",
    "QuestLogFrame",
    "TradeSkillFrame",
    "CraftFrame",
}) do
    local frame = _G[name]
    assert(frame.mouseEnabled == true, name .. " 必须启用鼠标命中")
    assert(frame.strata == "DIALOG", name .. " 必须位于 WA HIGH 之上")
    assert(frame.raised == true, name .. " 显示时必须抬到同层顶部")
end

local settingsInsets = _G.GwSettingsWindow.hitRectInsets
assert(settingsInsets and settingsInsets[4] == -226,
    "设置窗口的视觉背景超出根框时，底部区域必须纳入鼠标命中")

local characterInsets = _G.GwCharacterWindow.hitRectInsets
assert(characterInsets and characterInsets[4] == -226,
    "人物窗口的视觉背景超出根框时，底部区域必须纳入鼠标命中")

assert(_G.GwPopupFrame1.mouseEnabled == true,
    "通用弹出窗口必须启用鼠标命中")
assert(_G.GwPopupFrame1.strata == "FULLSCREEN_DIALOG",
    "通用弹出窗口不能被降到普通对话层")

print("窗口鼠标命中回归检查通过")
