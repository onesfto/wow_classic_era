-- BugSack 轻量皮肤：只替换主窗口、标签页、滚动区域材质与默认字体。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)
end

local function ApplyFonts(frame)
    if not frame then return end
    ApplyDefaultFont(frame)

    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            ApplyDefaultFont(region)
        end
    end
    if frame.GetChildren then
        for _, child in ipairs({ frame:GetChildren() }) do
            ApplyFonts(child)
        end
    end
end

local function ApplyWindowSkin()
    local frame = _G.BugSackFrame
    if not frame or frame.__gwBugSackSkinned then return end
    frame.__gwBugSackSkinned = true

    Skin.SkinFrame(frame)

    for _, name in ipairs({
        "BugSackTabAll",
        "BugSackTabSession",
        "BugSackTabLast",
    }) do
        local tab = _G[name]
        if tab and tab.GwSkinTab then tab:GwSkinTab() end
    end

    local scroll = _G.BugSackScroll
    if scroll and scroll.GwSkinScrollFrame then scroll:GwSkinScrollFrame() end
    Skin.SkinScrollBar(_G.BugSackScrollScrollBar
        or (scroll and scroll.ScrollBar))

    ApplyFonts(frame)

    local textArea = _G.BugSackScrollText
    if textArea and not textArea.__gwBugSackFontHooked then
        textArea.__gwBugSackFontHooked = true
        hooksecurefunc(textArea, "SetFontObject", function(self)
            ApplyDefaultFont(self)
        end)
    end
end

addonTable.BugSackSkin = {
    Apply = ApplyWindowSkin,
}

Skin.Register("BugSack", function()
    local bugSack = _G.BugSack
    if not bugSack or type(bugSack.OpenSack) ~= "function" then return end

    if not bugSack.__gwPlusSkinHooked then
        bugSack.__gwPlusSkinHooked = true
        hooksecurefunc(bugSack, "OpenSack", ApplyWindowSkin)
    end
    ApplyWindowSkin()
end)
