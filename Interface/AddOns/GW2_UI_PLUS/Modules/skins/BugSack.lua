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
local function SkinBottomButtons()
    for _, name in ipairs({
        "BugSackPrevButton",
        "BugSackSendButton",
        "BugSackNextButton",
    }) do
        Skin.SkinButton(_G[name])
    end
end
local function SkinCloseButton(frame)
    local bugSack = _G.BugSack
    if not frame or not frame.GetChildren or not bugSack then return end
    for _, child in ipairs({ frame:GetChildren() }) do
        if child.GetObjectType and child:GetObjectType() == "Button"
            and child.GetScript
            and child:GetScript("OnClick") == bugSack.CloseSack then
            Skin.SkinClose(child)
            return
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
    SkinBottomButtons()
    SkinCloseButton(frame)
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
