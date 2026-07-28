local unpack = table.unpack or unpack

local function NewRegion(objectType, texture)
    local region = {
        objectType = objectType,
        texture = texture,
        hidden = false,
        points = {},
    }

    function region:GetObjectType() return self.objectType end
    function region:GetTexture() return self.texture end
    function region:Hide() self.hidden = true end
    function region:SetParent(parent) self.parent = parent end
    function region:ClearAllPoints() self.points = {} end
    function region:SetPoint(...) self.points[#self.points + 1] = {...} end
    function region:GwSetFontTemplate() self.fontCalls = (self.fontCalls or 0) + 1 end
    function region:SetShadowColor() end
    function region:SetTextColor() end
    function region:SetJustifyH() end
    function region:SetJustifyV() end
    function region:SetHeight(height) self.height = height end
    function region:SetWidth(width) self.width = width end
    function region:SetSize(width, height) self.width, self.height = width, height end
    function region:SetTexture(path) self.texture = path end

    return region
end

local function NewFrame(objectType, width, height, parent)
    local frame = {
        objectType = objectType or "Frame",
        width = width or 0,
        height = height or 0,
        parent = parent,
        children = {},
        regions = {},
        scripts = {},
        hooks = {},
        points = {},
        shown = true,
    }

    if parent then parent.children[#parent.children + 1] = frame end

    function frame:GetObjectType() return self.objectType end
    function frame:GetName() return self.name end
    function frame:GetParent() return self.parent end
    function frame:GetChildren() return unpack(self.children) end
    function frame:GetRegions() return unpack(self.regions) end
    function frame:GetSize() return self.width, self.height end
    function frame:GetWidth() return self.width end
    function frame:GetHeight() return self.height end
    function frame:SetWidth(value) self.width = value end
    function frame:SetHeight(value) self.height = value end
    function frame:SetSize(newWidth, newHeight) self.width, self.height = newWidth, newHeight end
    function frame:SetParent(newParent) self.parent = newParent end
    function frame:ClearAllPoints() self.points = {} end
    function frame:SetPoint(...) self.points[#self.points + 1] = {...} end
    function frame:GetPoint(index)
        local point = self.points[index or 1] or {}
        return unpack(point)
    end
    function frame:SetScript(script, handler) self.scripts[script] = handler end
    function frame:GetScript(script) return self.scripts[script] end
    function frame:HookScript(script, handler)
        self.hooks[script] = self.hooks[script] or {}
        self.hooks[script][#self.hooks[script] + 1] = handler
    end
    function frame:RunScript(script, ...)
        if self.scripts[script] then self.scripts[script](self, ...) end
        for _, handler in ipairs(self.hooks[script] or {}) do
            handler(self, ...)
        end
    end
    function frame:EnableMouse() end
    function frame:RegisterForDrag() end
    function frame:SetMovable() end
    function frame:StartMoving() self.moving = true end
    function frame:StopMovingOrSizing() self.moving = false end
    function frame:IsShown() return self.shown end
    function frame:Show() self.shown = true end
    function frame:Hide() self.shown = false end
    function frame:SetShown(value) self.shown = value end
    function frame:SetText(text) self.text = text end
    function frame:GetText() return self.text end
    function frame:GwStripTextures()
        self.stripCalls = (self.stripCalls or 0) + 1
        for _, region in ipairs(self.regions) do
            if region:GetObjectType() == "Texture" then region:Hide() end
        end
    end
    function frame:GwCreateBackdrop()
        self.backdropCalls = (self.backdropCalls or 0) + 1
    end
    function frame:GwSkinButton()
        self.buttonSkinCalls = (self.buttonSkinCalls or 0) + 1
    end
    function frame:GwSkinCheckButton()
        self.checkSkinCalls = (self.checkSkinCalls or 0) + 1
    end
    function frame:GwSkinScrollFrame()
        self.scrollFrameSkinCalls = (self.scrollFrameSkinCalls or 0) + 1
    end
    function frame:GwSkinScrollBar()
        self.scrollBarSkinCalls = (self.scrollBarSkinCalls or 0) + 1
    end
    function frame:GwSkinDropDownMenu()
        self.dropDownSkinCalls = (self.dropDownSkinCalls or 0) + 1
    end
    function frame:GwSetFontTemplate()
        self.fontCalls = (self.fontCalls or 0) + 1
    end
    function frame:SetShadowColor() end

    return frame
end

UIParent = NewFrame("Frame", 1920, 1080)
SlashCmdList = {}
CLOSE = "关闭"
CALENDAR = "日历"
SETTINGS = "设置"
UNIT_NAME_FONT = "UnitFont"
DAMAGE_TEXT_FONT = "DamageFont"

GW2_ADDON = {
    Enum = {
        TextSizeType = {
            Header = "Header",
            BigHeader = "BigHeader",
            Normal = "Normal",
            Small = "Small",
        },
    },
    BackdropTemplates = {
        Default = "Default",
        DefaultWithSmallBorder = "DefaultWithSmallBorder",
    },
}

local createdFrames = {}

function CreateFrame(objectType, _, parent, template)
    local frame = NewFrame(objectType, 0, 0, parent)
    frame.template = template
    if template == "GwFrameHeader" then
        frame.BGLEFT = NewRegion("Texture")
        frame.windowIcon = NewRegion("Texture")
    end
    createdFrames[#createdFrames + 1] = frame
    return frame
end

local function AddRegion(frame, region)
    frame.regions[#frame.regions + 1] = region
    return region
end

local function AddButton(frame, text, x, y)
    local button = NewFrame("Button", 50, 23, frame)
    button:SetText(text)
    button:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", x, y)
    return button
end

local HEADER_TEXTURE = "Interface/DialogFrame/UI-DialogBox-Header"

local function NewMailWindow(width, height)
    local frame = NewFrame("Frame", width, height, UIParent)
    frame.texture = AddRegion(frame, NewRegion("Texture", HEADER_TEXTURE))
    frame.title = AddRegion(frame, NewRegion("FontString"))
    return frame
end

local function PopulateSettings(frame)
    frame.actionButton = AddButton(frame, CLOSE, 210, 20)
    frame.check = NewFrame("CheckButton", 24, 24, frame)
    frame.edit = NewFrame("EditBox", 125, 25, frame)
    frame.scroll = NewFrame("ScrollFrame", 120, 95, frame)
    frame.scroll.ScrollBar = NewFrame("Slider", 12, 95, frame.scroll)
    frame.dropdown = NewFrame("Frame", 110, 32, frame)
    frame.dropdown.Button = NewFrame("Button", 24, 24, frame.dropdown)
    frame.dropdown.Left = NewRegion("Texture")
    frame.dropdown.Middle = NewRegion("Texture")
    frame.dropdown.Right = NewRegion("Texture")
end

local function PopulateOutput(frame)
    frame.bottomOriginal = {
        AddButton(frame, "交易", 20, 10),
        AddButton(frame, "邮件", 70, 10),
        AddButton(frame, "发件", 120, 10),
        AddButton(frame, "收件", 170, 10),
        AddButton(frame, "全部", 220, 10),
        AddButton(frame, CLOSE, 290, 10),
    }
    frame.scroll = NewFrame("ScrollFrame", 290, 390, frame)
    frame.scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -70)
    frame.scroll.ScrollBar = NewFrame("Slider", 12, 390, frame.scroll)
    frame.edit = NewFrame("EditBox", 290, 420, frame.scroll)
end

local function PopulateCalendar(frame)
    frame.year = NewFrame("Frame", 70, 32, frame)
    frame.year.Button = NewFrame("Button", 24, 24, frame.year)
    frame.year.Left = NewRegion("Texture")
    frame.year.Middle = NewRegion("Texture")
    frame.year.Right = NewRegion("Texture")
    frame.month = NewFrame("Frame", 55, 32, frame)
    frame.month.Button = NewFrame("Button", 24, 24, frame.month)
    frame.month.Left = NewRegion("Texture")
    frame.month.Middle = NewRegion("Texture")
    frame.month.Right = NewRegion("Texture")
    for index = 1, 49 do
        AddButton(frame, tostring(index), 0, 0)
    end
end

local settings = NewMailWindow(380, 510)
PopulateSettings(settings)
local output = NewMailWindow(360, 510)
PopulateOutput(output)
local calendar = NewMailWindow(320, 320)
PopulateCalendar(calendar)
local unrelated = NewFrame("Frame", 380, 510, UIParent)
unrelated.texture = AddRegion(unrelated, NewRegion("Texture", "Interface/OtherAddon/Header"))

local lastSlashCommand
SlashCmdList.MLC = function(command)
    lastSlashCommand = command
    if command == "all" then calendar:Show() end
end

MailLoggerFrame = NewFrame("Frame")

local Skin = {}
function Skin.Register(addonName, func)
    Skin.registeredAddon = addonName
    Skin.registeredFunc = func
end
function Skin.SkinFrame(frame)
    frame:GwStripTextures()
    frame:GwCreateBackdrop()
end
function Skin.SkinFont(fontString)
    fontString:GwSetFontTemplate()
    fontString:SetShadowColor(0, 0, 0, 0)
end
function Skin.SkinButton(button) button:GwSkinButton() end
function Skin.SkinCheckBox(check) check:GwSkinCheckButton() end
function Skin.SkinScrollBar(bar) bar:GwSkinScrollBar() end
function Skin.SkinDropDown(dropdown, width)
    if dropdown.__testDropDownSkinned then return end
    dropdown.__testDropDownSkinned = true
    dropdown:GwSkinDropDownMenu()
    if width then dropdown:SetWidth(width) end
end
function Skin.SkinEditBox(editBox)
    if editBox.__testEditSkinned then return end
    editBox.__testEditSkinned = true
    editBox.editSkinCalls = (editBox.editSkinCalls or 0) + 1
end

local addonTable = {Skin = Skin}
local chunk = assert(loadfile("skins/MailLogger.lua"))
chunk("GW2_UI_PLUS", addonTable)

assert(Skin.registeredAddon == "MailLogger", "皮肤必须注册到 MailLogger")
assert(type(Skin.registeredFunc) == "function", "皮肤注册回调必须存在")

Skin.registeredFunc()

local MailLoggerSkin = assert(addonTable.MailLoggerSkin)
MailLoggerSkin.ScanWindows()

assert(settings.__gwMailLoggerKind == "settings", "应识别设置窗口")
assert(output.__gwMailLoggerKind == "output", "应识别交易记录窗口")
assert(calendar.__gwMailLoggerKind == "calendar", "应识别日历窗口")
assert(unrelated.__gwMailLoggerKind == nil, "不得处理其他插件的同尺寸窗口")

assert(settings.__gwMailLoggerSkinned, "设置窗口应应用皮肤")
assert(settings.inlineHeader, "设置窗口应创建内嵌标题区")
assert(settings.texture.hidden, "原始红色标题纹理应隐藏")
assert(settings.check.checkSkinCalls == 1, "复选框应应用 GW2 皮肤")
assert(settings.edit.editSkinCalls == 1, "输入框应应用 GW2 皮肤")
assert(settings.scroll.ScrollBar.scrollBarSkinCalls == 1, "滚动条应应用 GW2 皮肤")
assert(settings.dropdown.dropDownSkinCalls == 1, "下拉框应应用 GW2 皮肤")

assert(output:GetWidth() == 470, "交易记录窗口宽度应为 470")
assert(#output.gwBottomButtons == 8, "交易记录窗口底部应有 8 个按钮")
assert(output.gwBottomButtons[6]:GetText() == "日历", "日历按钮应位于关闭按钮前")
assert(output.gwBottomButtons[7]:GetText() == "设置", "设置按钮应位于关闭按钮前")
assert(output.gwBottomButtons[8]:GetText() == CLOSE, "关闭按钮应保持在最后")

local expectedWidths = {45, 45, 45, 45, 55, 55, 55, 50}
for index, button in ipairs(output.gwBottomButtons) do
    assert(button:GetWidth() == expectedWidths[index], "底部按钮宽度不符合设计：" .. index)
end

calendar:Hide()
output.gwBottomButtons[6]:RunScript("OnClick")
assert(lastSlashCommand == "all", "打开日历应复用 MailLogger 的 all 命令")

calendar:Show()
output.gwBottomButtons[6]:RunScript("OnClick")
assert(not calendar:IsShown(), "日历按钮再次点击应隐藏日历")

output.gwBottomButtons[7]:RunScript("OnClick")
assert(lastSlashCommand == "gui", "设置按钮应复用 MailLogger 的 gui 命令")

MailLoggerSkin.ScanWindows()
assert(settings.check.checkSkinCalls == 1, "重复扫描不得重复美化复选框")
assert(#output.gwBottomButtons == 8, "重复扫描不得重复创建底部按钮")

local replacementSettings = NewMailWindow(380, 510)
PopulateSettings(replacementSettings)
local replacementOutput = NewMailWindow(360, 510)
PopulateOutput(replacementOutput)

settings.actionButton:RunScript("OnClick")

assert(replacementSettings.__gwMailLoggerSkinned, "设置窗口重建后应自动应用皮肤")
assert(replacementOutput.__gwMailLoggerSkinned, "记录窗口重建后应自动应用皮肤")
assert(#replacementOutput.gwBottomButtons == 8, "重建后的记录窗口应包含新增入口")
assert(#output.gwBottomButtons == 8, "旧窗口不得叠加新增入口")

print("MailLoggerSkin_test: OK")
