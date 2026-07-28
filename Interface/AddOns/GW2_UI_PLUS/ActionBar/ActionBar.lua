-- GW2_UI_PLUS 动作条扩展 —— 核心与尺寸
--
-- 本体给动作条 2-8 留了 GW.settings[barName].size 字段（默认 38）但没在设置面板里
-- 暴露出来，而且 UpdateMultibarButtons 只用 size 排位置、不改按钮自身大小；
-- 主动作条的按钮尺寸则是 actionbars.lua 里的 local MAIN_MENU_BAR_BUTTON_SIZE = 48，
-- 外部够不着。这里把两者都补上，并顺手把中间那段硬编码的 108 空隙改成按血球实际
-- 大小动态计算，这样血球缩放之后空隙会跟着变、血球本身不用挪位置。
--
-- 三个模块（本文件、MageBar、Fader）都只定义函数，统一由本文件的 PLAYER_ENTERING_WORLD
-- 驱动初始化——本体的动作条是在 PLAYER_LOGIN 的 evPlayerLoginLate 里建的，比本插件晚。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local AB = {}
addonTable.PlusActionBar = AB
_G.GW2Plus_ActionBar = AB -- 方便调试与设置面板访问

--------------------------------------------------------------------------------
-- 一、本体里抄来的常数
--------------------------------------------------------------------------------

-- Games/Classic/Actionbar/actionbars.lua: MAIN_MENU_BAR_BUTTON_SIZE
local MAINBAR_DEFAULT_SIZE = 48
-- Games/Shared/Units/healthglobe.lua: GW.RegisterScaleFrame(hg, 1.1)
local GLOBE_BASE_SCALE = 1.1
-- 本体给血球留的空隙是 108 = 88(血球宽) * 1.1(血球缩放) + 11
local GLOBE_GAP_PADDING = 11
local GLOBE_DEFAULT_GAP = 108

-- 游戏里的动作条编号 → 本体的框体/按钮/设置名
-- （本体内部叫 gw_Bar1..gw_Bar7，比游戏编号小 1）
local MULTIBARS = {
    [2] = {setting = "MultiBarBottomLeft",  frame = "GwMultiBarBottomLeft",  button = "MultiBarBottomLeftButton"},
    [3] = {setting = "MultiBarBottomRight", frame = "GwMultiBarBottomRight", button = "MultiBarBottomRightButton"},
    [4] = {setting = "MultiBarRight",       frame = "GwMultiBarRight",       button = "MultiBarRightButton"},
    [5] = {setting = "MultiBarLeft",        frame = "GwMultiBarLeft",        button = "MultiBarLeftButton"},
    [6] = {setting = "MultiBar5",           frame = "GwMultiBar5",           button = "MultiBar5Button"},
    [7] = {setting = "MultiBar6",           frame = "GwMultiBar6",           button = "MultiBar6Button"},
    [8] = {setting = "MultiBar7",           frame = "GwMultiBar7",           button = "MultiBar7Button"},
}
AB.MULTIBARS = MULTIBARS

AB.SIZE_MIN = 12
AB.SIZE_MAX = 64

--------------------------------------------------------------------------------
-- 二、配置
--------------------------------------------------------------------------------

local defaults = {
    -- 全局渐隐
    fadeEnable = false,
    fadeAlpha = 0.2,        -- 淡出后的透明度
    fadeDelay = 0.5,        -- 鼠标离开后多久开始淡出
    keepInCombat = true,    -- 战斗中保持全亮
    keepOnTarget = false,   -- 有目标时保持全亮
    keepOnCasting = false,  -- 施法/引导时保持全亮
    keepOnHealth = false,   -- 生命值不满时保持全亮
    fadeBar1 = true,
    fadeBar2 = true,
    fadeBar3 = true,
    fadeBar4 = true,
    fadeBar5 = true,
    fadeBar6 = true,
    fadeBar7 = true,
    fadeBar8 = true,
    fadeStanceBar = true,
    fadePetBar = true,
    fadeMageBar = true,

    -- 尺寸（动作条 2-8 的尺寸存在本体的 GW.settings[barName].size 里，这里不重复存）
    mainBarSize = MAINBAR_DEFAULT_SIZE,
    mainBarCount = 12,
    mainBarColumns = 12,
    mainBarGlobeGap = true, -- 主条中间为血球留出空隙
    mainBarShowHotkey = true,
    mainBarHotkeyPosition = "BOTTOM",
    mainBarHotkeyX = 0,
    mainBarHotkeyY = 0,
    mainBarHotkeySize = 12,
    mainBarShowMacro = false,
    mainBarMacroPosition = "TOP",
    mainBarMacroX = 0,
    mainBarMacroY = 0,
    mainBarMacroSize = 12,
    globeScale = 1.0,       -- 血球缩放，乘在本体的 1.1 之上
    normalPlayerFrameEnabled = true,

    -- 法师动作条
    mageBarEnable = true,
    mageBarSize = 36,
    mageBarVertical = false,
    mageBarTeleport = true,
    mageBarPortal = true,
    mageBarFood = false,
    mageBarWater = false,
    mageBarGem = false,
}
AB.defaults = defaults

local function InitDB()
    GW2_UI_PLUS_ActionBarSV = GW2_UI_PLUS_ActionBarSV or {}
    local db = GW2_UI_PLUS_ActionBarSV
    for k, v in pairs(defaults) do
        if db[k] == nil then
            db[k] = v
        end
    end
    return db
end
AB.InitDB = InitDB

function AB.SetFontStringSize(fontString, size)
    if not fontString or not fontString.GetFont or not fontString.SetFont then return end
    local path, _, flags = fontString:GetFont()
    if path then fontString:SetFont(path, size or 12, flags) end
end

--------------------------------------------------------------------------------
-- 三、战斗排队
--------------------------------------------------------------------------------

-- 按钮尺寸和父级都改不了受保护框体，战斗中先记账、出战斗再补
local pending = {}
local combatWatcher = CreateFrame("Frame")
combatWatcher:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    local queued = pending
    pending = {}
    for _, func in pairs(queued) do
        func()
    end
end)

-- 同名任务只保留最后一个，避免出战斗时把同一件事跑十遍
local function QueueOutOfCombat(name, func)
    if not InCombatLockdown() then
        return false
    end
    pending[name] = func
    combatWatcher:RegisterEvent("PLAYER_REGEN_ENABLED")
    return true
end
AB.QueueOutOfCombat = QueueOutOfCombat

--------------------------------------------------------------------------------
-- 四、编辑界面（mover）
--------------------------------------------------------------------------------

-- RegisterMovableFrame 直接读写 GW.settings[settingName] 和
-- GW.globalDefault.profile[settingName]，本体只给自己的框体准备了这两处，
-- 外部框体得自己补。位置因此存在本体的存档里（和社交窗口、邮件一样）。
function AB.EnsureMoverSettings(settingName, default)
    if not GW.settings then return false end

    if GW.globalDefault and GW.globalDefault.profile and not GW.globalDefault.profile[settingName] then
        GW.globalDefault.profile[settingName] = GW.CopyTable(default)
    end
    if not GW.settings[settingName] then
        GW.settings[settingName] = GW.CopyTable(default)
    end

    return true
end

function AB.ResetMoverPosition(frame)
    local mover = frame and frame.gwMover
    local profile = GW.globalDefault and GW.globalDefault.profile
    local defaultPoint = mover and profile and profile[mover.setting]
        or mover and mover.defaultPoint
    if not mover or not defaultPoint then return end

    local function ApplyReset()
        -- 和本体 smallSettings_resetToDefault 完全同一套语义：照抄 defaultPoint，
        -- 清 isMoved，不做任何额外偏移。
        --
        -- 早先版本在这里复刻了动作条 2、3 对经验条和血球样式的偏移，那是找错了地方：
        -- 底部两条的最终坐标由本体的布局管理器（Games/Shared/Mainbar/mainBarLayout.lua
        -- 的 onstate_Barlayout）在 isMoved 为假时用
        -- mbl_mover:SetPoint("BOTTOMLEFT", uip, "BOTTOM", pfat and -316 or -369, epbar and 120 or 114)
        -- 直接覆盖。我们自己再算一遍偏移只会和它打架，就是重载后 Y 轴再次漂移的原因。
        -- 清掉 isMoved 之后交给布局管理器即可，它自带经验条和玩家框体样式的判断。
        local saved = GW.settings[mover.setting] or {}
        saved.point = defaultPoint.point
        saved.relativePoint = defaultPoint.relativePoint
        saved.xOfs = defaultPoint.xOfs
        saved.yOfs = defaultPoint.yOfs
        saved.hasMoved = false

        mover:ClearAllPoints()
        mover:SetPoint(defaultPoint.point, UIParent, defaultPoint.relativePoint,
            defaultPoint.xOfs, defaultPoint.yOfs)
        mover.savedPoint = GW.CopyTable(saved)
        GW.settings[mover.setting] = saved
        mover.parent.isMoved = false
        mover.parent:SetAttribute("isMoved", false)

        -- 让布局管理器立刻按 isMoved=false 重算一次，否则底部两条要等下一次
        -- 状态切换（进出战斗等）才回到本体的原始位置。
        AB.RefreshNativeBarLayout()
    end

    local queueName = "resetActionBarMover" .. (mover.setting or "")
    if not QueueOutOfCombat(queueName, ApplyReset) then
        ApplyReset()
    end
end

-- 本体的布局管理器是个 SecureHandlerStateTemplate，lm 本身是 LoadMainbarLayout
-- 的局部变量拿不到，但那个框体挂在 MoveHudScaleableFrame.layoutManager 上。
-- 触发方式沿用本体：调它的 OnEvent（core/migration.lua:375、settings/layouts.lua:56
-- 都是这么写的），脚本内部会把 currentHandlerState 置 none 再跑 oocHandler。
function AB.RefreshNativeBarLayout()
    if InCombatLockdown() then return end
    local layoutManager = (GW.MoveHudScaleableFrame
        and GW.MoveHudScaleableFrame.layoutManager)
        or (_G.GwSmallSettingsContainer and _G.GwSmallSettingsContainer.layoutManager)
    local handler = layoutManager and layoutManager:GetScript("OnEvent")
    if handler then handler(layoutManager) end
end

-- 本体没给主动作条注册 mover：它的位置一直是暴雪的 UserPlaced，HUD 编辑界面里
-- 找不到它。既然按钮尺寸能调了，位置也得能调。
local MAINBAR_MOVER_SETTING = "MainActionBar_pos"

local function RegisterMainBarMover()
    local bar = _G.MainActionBar
    if not bar or not bar.gw_Buttons then return end
    if bar.gwMover then return end -- 本体哪天自己加了就别抢

    -- 不能从框体当前底边取默认值：动作条拖动后，暴雪会保留当前位置，
    -- 下次登录时那个“当前位置”已经不是默认位置。GW2 UI 的主条在有经验条时
    -- 底边为 17，无经验条时按钮向下偏移 14，所以父框体底边为 14。
    local default = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = GW.settings.XPBAR_ENABLED and 17 or 14,
        hasMoved = false,
    }
    if GW.globalDefault and GW.globalDefault.profile then
        GW.globalDefault.profile[MAINBAR_MOVER_SETTING] = GW.CopyTable(default)
    end
    if not AB.EnsureMoverSettings(MAINBAR_MOVER_SETTING, default) then return end

    -- 只给 "default"，不给 "scaleable"：主条已经在 SCALE_HUD_FRAMES 里了
    -- （RegisterScaleFrame），再来一个独立缩放会和 HUD 缩放滑块来回覆盖。
    -- 整条缩放交给 HUD 缩放，按钮大小交给我们的尺寸滑块。
    GW.RegisterMovableFrame(bar, OPTION_SHOW_ACTION_BAR:format(1), MAINBAR_MOVER_SETTING,
        BINDING_HEADER_ACTIONBAR, nil, {"default"})

    bar:ClearAllPoints()
    bar:SetPoint("TOPLEFT", bar.gwMover)
    -- 本体给 multibar 用的同一套保险：谁把条挪走都拉回 mover 上
    hooksecurefunc(bar, "SetPoint", function(_, _, anchor)
        if anchor ~= bar.gwMover then
            bar:ClearAllPoints()
            bar:SetPoint("TOPLEFT", bar.gwMover)
        end
    end)
end

--------------------------------------------------------------------------------
-- 五、动作条 2-8 的按钮尺寸
--------------------------------------------------------------------------------

function AB.GetMultiBarSize(index)
    local info = MULTIBARS[index]
    if not info then return end
    local settings = GW.settings and GW.settings[info.setting]
    return settings and settings.size or 36
end

function AB.SetMultiBarSize(index, size)
    local info = MULTIBARS[index]
    if not info or not GW.settings then return end

    -- 本体存的是整张表，改字段之后要整表写回去才会存档
    local settings = GW.settings[info.setting]
    settings.size = size
    GW.settings[info.setting] = settings
end

-- 本体的 UpdateMultibarButtons 用 settings.size 算间距，但没有 SetSize 按钮本身，
-- 所以位置对了、按钮还是老大小。这里把按钮尺寸补齐。
local function SyncMultiBarButtonSizes()
    for index, info in pairs(MULTIBARS) do
        local bar = _G[info.frame]
        if bar and bar.gw_Buttons then
            local size = AB.GetMultiBarSize(index)
            for i = 1, 12 do
                local btn = bar.gw_Buttons[i]
                if btn and math.abs(btn:GetWidth() - size) > 0.5 then
                    btn:SetSize(size, size)
                    -- 按钮内部的一堆纹理是按当前宽度算尺寸的，要重跑一遍样式
                    GW.setActionButtonStyle(info.button .. i)
                end
            end
        end
    end
end

function AB.ApplyMultiBarSizes()
    if QueueOutOfCombat("multibarSize", AB.ApplyMultiBarSizes) then return end

    SyncMultiBarButtonSizes()
    -- 本体的 UpdateMultibarButtons 无条件访问 MainActionBar.gw_BarN，
    -- 关掉本体动作条时那些框体不存在，别去调它
    if GW.UpdateMultibarButtons and _G.MainActionBar and _G.MainActionBar.gw_Bar1 then
        GW.UpdateMultibarButtons()
    end
end

--------------------------------------------------------------------------------
-- 六、主动作条的按钮尺寸与血球空隙
--------------------------------------------------------------------------------

-- 血球和主条各自有缩放，把血球宽度换算到主条的坐标系里再算空隙
local function GetGlobeGap(bar)
    if not InitDB().mainBarGlobeGap then
        return 0 -- 用户自己关了（比如把主条拖到别处去了，中间那个洞就没意义了）
    end
    if GW.settings and GW.settings.PLAYER_AS_TARGET_FRAME then
        return 0 -- 用传统玩家框体时中间没有血球，按钮连续排
    end

    local hg = _G.GW2_PlayerFrame
    if not hg then return GLOBE_DEFAULT_GAP end

    local barScale = bar:GetEffectiveScale()
    if not barScale or barScale <= 0 then return GLOBE_DEFAULT_GAP end

    return (hg:GetWidth() * hg:GetEffectiveScale()) / barScale + GLOBE_GAP_PADDING
end

-- 位置由我们说了算之后，本体任何一次重排都要被纠正回来。
-- 本体自己对 multibar 按钮用的就是这个套路（actionbars.lua:906）。
local applyingMainBar = false

local function MainBarButton_OnSetPoint(self)
    if applyingMainBar or not self.gwPlusX then return end

    local point, parent, relPoint, x, y = self:GetPoint()
    if point == "TOPLEFT" and parent == _G.MainActionBar and relPoint == "TOPLEFT"
        and math.abs((x or 0) - self.gwPlusX) < 0.5 and math.abs((y or 0) - self.gwPlusY) < 0.5 then
        return
    end

    applyingMainBar = true
    self:ClearAllPoints()
    self:SetPoint("TOPLEFT", _G.MainActionBar, "TOPLEFT", self.gwPlusX, self.gwPlusY)
    applyingMainBar = false
end

function AB.SyncMainBarMoverVisual(bar, leftInset, topInset, width, height)
    local mover = bar and bar.gwMover
    local backdrop = mover and mover.backdrop
    if not backdrop then return end

    backdrop:ClearAllPoints()
    backdrop:SetPoint("TOPLEFT", mover, "TOPLEFT", leftInset, -topInset)
    backdrop:SetSize(width, height)
    if mover.text then
        mover.text:ClearAllPoints()
        mover.text:SetPoint("CENTER", backdrop, "CENTER")
    end
end

local function ApplyMainButtonText(btn, db, layout)
    if not layout then return end

    if btn.HotKey then
        layout.ApplyTextPosition(btn.HotKey, btn,
            db.mainBarHotkeyPosition,
            db.mainBarHotkeyX or 0, db.mainBarHotkeyY or 0,
            db.mainBarHotkeySize,
            db.mainBarShowHotkey ~= false)
    end

    if btn.Name then
        -- 见 Layout.ApplyTextPosition：本体的宏名称分支会改原生文字层的宽度和字体，
        -- 那是按钮跟着变大的原因，这里关掉它，文字交给代理层
        btn.showMacroName = false
        layout.ApplyTextPosition(btn.Name, btn,
            db.mainBarMacroPosition,
            db.mainBarMacroX or 0, db.mainBarMacroY or 0,
            db.mainBarMacroSize,
            db.mainBarShowMacro == true)
    end
end

function AB.ApplyMainBarText()
    local bar = _G.MainActionBar
    local layout = addonTable.PlusActionBarLayout
    if not bar or not bar.gw_Buttons or not layout then return end
    local db = InitDB()
    for i = 1, math.min(db.mainBarCount or 12, 12) do
        local btn = bar.gw_Buttons[i]
        if btn then ApplyMainButtonText(btn, db, layout) end
    end
end

-- 复刻本体 UpdateMainBarHot 的排布（actionbars.lua:1159），把 48 换成设定尺寸、
-- 把 108 换成血球实际宽度。alpha / 宏名 / 热键那些仍由本体那份代码负责。
function AB.ApplyMainBarLayout()
    local bar = _G.MainActionBar
    if not bar or not bar.gw_Buttons or not GW.settings then return end
    if QueueOutOfCombat("mainBarLayout", AB.ApplyMainBarLayout) then return end

    local db = InitDB()
    local size = db.mainBarSize
    local margin = GW.settings.MAINBAR_MARGIIN or 5
    local gap = GetGlobeGap(bar)
    local yOfs = GW.settings.XPBAR_ENABLED and 0 or -14
    local count = math.max(1, math.min(12, math.floor((db.mainBarCount or 12) + 0.5)))
    local columns = math.max(1, math.min(count,
        math.floor((db.mainBarColumns or count) + 0.5)))
    local rows = math.ceil(count / columns)
    local usedColumns = math.min(columns, count)
    local useGap = columns == 12 and count > 6 and gap > 0
    local contentWidth = usedColumns * size
        + math.max(usedColumns - 1, 0) * margin
        + (useGap and gap or 0)
    local contentHeight = rows * size + math.max(rows - 1, 0) * margin
    local layout = addonTable.PlusActionBarLayout
    db.mainBarCount, db.mainBarColumns = count, columns

    applyingMainBar = true

    for i = 1, 12 do
        local btn = bar.gw_Buttons[i]
        if btn then
            btn:SetShown(i <= count)
            if i <= count and math.abs(btn:GetWidth() - size) > 0.5 then
                btn:SetSize(size, size)
                GW.setActionButtonStyle("ActionButton" .. i)
                -- 样式函数会把热键摆成多条那种居中样式，主条的是左右拉伸的，
                -- 本体在 updateMainBar 里也是这么补回来的（actionbars.lua:744）
                if GW.FixHotKeyPosition then
                    GW.FixHotKeyPosition(btn, false, false, true)
                end
            end

            if i <= count then
                local row = math.floor((i - 1) / columns)
                local column = (i - 1) % columns
                local x = margin + column * (size + margin)
                if useGap and column >= 6 then x = x + gap end
                local y = yOfs - row * (size + margin)

                btn.gwPlusX, btn.gwPlusY = x, y
                btn:ClearAllPoints()
                btn:SetPoint("TOPLEFT", bar, "TOPLEFT", x, y)
            end

            ApplyMainButtonText(btn, db, layout)

            if not btn.gwPlusPointHooked then
                btn.gwPlusPointHooked = true
                hooksecurefunc(btn, "SetPoint", MainBarButton_OnSetPoint)
            end

        end
    end

    applyingMainBar = false

    local barWidth = contentWidth + (margin * 2)
    local topInset = math.max(-yOfs, 0)
    -- 主条 mover 默认锚在屏幕底部；把按钮向下偏移算进父框体高度会抬高整条。
    -- 父框体只保存按钮内容高度，白色显示框单独向下偏移即可保持实际位置不动。
    bar:SetSize(barWidth, contentHeight)
    bar.gw_Width = barWidth
    AB.SyncMainBarMoverVisual(bar, margin, topInset, contentWidth, contentHeight)
end

--------------------------------------------------------------------------------
-- 七、血球缩放
--------------------------------------------------------------------------------

-- 参照本体 HUD 缩放的算法，只更新血球和中央 HUD 背景各自的缩放倍数。
-- 不调用 GW.UpdateHudScale，避免影响其它动作条和状态条；仅在血球间隙开启时，
-- 用原有按钮大小重新计算主动作条位置，让中间空隙跟随血球大小。
function AB.ApplyGlobeScale()
    local hg = _G.GW2_PlayerFrame
    if not hg then return end

    local db = InitDB()
    local globeScale = tonumber(db.globeScale) or 1
    local hudScale = tonumber(GW.settings and GW.settings.HUD_SCALE) or 1

    hg.gwScaleMulti = GLOBE_BASE_SCALE * globeScale
    hg:SetScale(hudScale * hg.gwScaleMulti)
    if hg.gwMover then
        hg.gwMover:SetScale(hudScale * hg.gwScaleMulti)
    end

    local hudBackground = _G.Gw2_HudBackgroud
        and _G.Gw2_HudBackgroud.actionBarHud
    if hudBackground then
        hudBackground.gwScaleMulti = globeScale
        hudBackground:SetScale(hudScale * globeScale)
    end

    if db.mainBarGlobeGap then
        AB.ApplyMainBarLayout()
    end
end

--------------------------------------------------------------------------------
-- 八、HUD 编辑界面的动作条布局快捷项
--------------------------------------------------------------------------------

local MOVER_OPTION_HEIGHT = 45

local function GetMoverBarIndex(mover)
    if not mover then return end
    if mover.parent == _G.MainActionBar then return 1 end
    for index, info in pairs(MULTIBARS) do
        if mover.parent == _G[info.frame] then return index end
    end
end

local function CreateMoverSlider(parent, label, order)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(170, 40)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((order - 1) * MOVER_OPTION_HEIGHT))

    row.title = row:CreateFontString(nil, "OVERLAY")
    row.title:SetFont(UNIT_NAME_FONT, 12, "")
    row.title:SetSize(150, 12)
    row.title:SetJustifyH("LEFT")
    row.title:SetPoint("LEFT", row, "LEFT", 8, 5)
    row.title:SetText(label)
    row.title:SetTextColor(1, 1, 1)

    row.slider = CreateFrame("Slider", nil, row)
    row.slider:SetOrientation("HORIZONTAL")
    row.slider:SetSize(120, 16)
    row.slider:SetPoint("LEFT", row, "LEFT", 10, -15)
    row.slider:SetHitRectInsets(0, 0, -10, -10)
    local background = row.slider:CreateTexture(nil, "BACKGROUND")
    background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/sliderbg.png")
    background:SetAllPoints()
    local thumb = row.slider:CreateTexture(nil, "OVERLAY")
    thumb:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/sliderhandle.png")
    thumb:SetSize(12, 12)
    row.slider:SetThumbTexture(thumb)

    row.input = CreateFrame("EditBox", nil, row)
    row.input:SetAutoFocus(false)
    row.input:SetSize(25, 16)
    row.input:SetPoint("LEFT", row.slider, "RIGHT", 10, 0)
    row.input:SetFont(UNIT_NAME_FONT, 8, "")
    row.input:SetJustifyH("CENTER")
    row.input:SetTextColor(1, 1, 1)
    local inputBackground = row.input:CreateTexture(nil, "BACKGROUND")
    inputBackground:SetTexture(
        "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg.png")
    inputBackground:SetPoint("TOPLEFT", row.input, "TOPLEFT", -5, 3)
    inputBackground:SetPoint("BOTTOMRIGHT", row.input, "BOTTOMRIGHT", 5, -3)
    inputBackground:SetTexCoord(0, 0.2, 0, 1)

    return row
end

local function ApplyMoverOption(barIndex, key, value)
    local db = InitDB()
    if barIndex == 1 then
        if key == "size" then
            db.mainBarSize = value
        elseif key == "spacing" then
            GW.settings.MAINBAR_MARGIIN = value
        elseif key == "count" then
            db.mainBarCount = value
            db.mainBarColumns = math.min(db.mainBarColumns, value)
        elseif key == "columns" then
            db.mainBarColumns = math.min(value, db.mainBarCount)
        end
        AB.ApplyMainBarLayout()
        return
    end

    local prefix = "bar" .. barIndex
    if key == "size" then
        AB.SetMultiBarSize(barIndex, value)
    elseif key == "spacing" then
        db[prefix .. "Spacing"] = value
    elseif key == "count" then
        db[prefix .. "Count"] = value
        db[prefix .. "Columns"] = math.min(db[prefix .. "Columns"], value)
    elseif key == "columns" then
        db[prefix .. "Columns"] = math.min(value, db[prefix .. "Count"])
    end
    if addonTable.PlusActionBarLayout then
        addonTable.PlusActionBarLayout.ApplyMultiBars()
    end
end

local function GetMoverOptionValue(barIndex, key)
    local db = InitDB()
    if barIndex == 1 then
        if key == "size" then return db.mainBarSize end
        if key == "spacing" then return GW.settings.MAINBAR_MARGIIN or 5 end
        if key == "count" then return db.mainBarCount end
        return math.min(db.mainBarColumns, db.mainBarCount)
    end

    local prefix = "bar" .. barIndex
    if key == "size" then return AB.GetMultiBarSize(barIndex) end
    if key == "spacing" then return db[prefix .. "Spacing"] end
    if key == "count" then return db[prefix .. "Count"] end
    return math.min(db[prefix .. "Columns"], db[prefix .. "Count"])
end

local function SetupMoverOptionPanel()
    local container = GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    if not options or options.gwPlusActionBarOptions then return end

    local custom = CreateFrame("Frame", nil, options)
    custom:SetSize(170, MOVER_OPTION_HEIGHT * 4)
    custom:SetPoint("TOPLEFT", options, "TOPLEFT", 0, -5)
    custom:Hide()
    options.gwPlusActionBarOptions = custom

    local definitions = {
        {"size", "尺寸", AB.SIZE_MIN, AB.SIZE_MAX, 1},
        {"spacing", "间距", 0, 20, 1},
        {"count", "按钮数", 1, 12, 1},
        {"columns", "行按钮数", 1, 12, 1},
    }
    custom.rows = {}
    for order, definition in ipairs(definitions) do
        local key, label, minimum, maximum, step = unpack(definition)
        local row = CreateMoverSlider(custom, label, order)
        row.key = key
        row.slider:SetMinMaxValues(minimum, maximum)
        row.slider:SetValueStep(step)
        if row.slider.SetObeyStepOnDrag then row.slider:SetObeyStepOnDrag(true) end
        row.slider:SetScript("OnValueChanged", function(self, value)
            value = math.floor(value + 0.5)
            row.input:SetText(value)
            if custom.refreshing or not custom.barIndex then return end
            ApplyMoverOption(custom.barIndex, key, value)
            if key == "count" then
                local columnsRow = custom.rows[4]
                columnsRow.slider:SetMinMaxValues(1, value)
                columnsRow.slider:SetValue(
                    GetMoverOptionValue(custom.barIndex, "columns"))
            end
        end)
        row.input:SetScript("OnEnterPressed", function(self)
            local value = math.max(minimum, math.min(maximum, self:GetNumber()))
            value = math.floor((value - minimum) / step + 0.5) * step + minimum
            self:ClearFocus()
            row.slider:SetValue(value)
            self:SetText(value)
        end)
        row.input:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
            self:SetText(GetMoverOptionValue(custom.barIndex, key))
        end)
        custom.rows[order] = row
    end

    function custom:Refresh(barIndex)
        self.barIndex = barIndex
        self.refreshing = true
        self.rows[4].slider:SetMinMaxValues(
            1, GetMoverOptionValue(barIndex, "count"))
        for _, row in ipairs(self.rows) do
            local value = GetMoverOptionValue(barIndex, row.key)
            row.slider:SetValue(value)
            row.input:SetText(value)
        end
        self.refreshing = false
    end
end

function AB.RefreshMoverOptionPanel()
    SetupMoverOptionPanel()
    local container = GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    local custom = options and options.gwPlusActionBarOptions
    if not custom then return end

    local mover = settingsFrame.childMover
    local barIndex = GetMoverBarIndex(mover)
    options.scaleSlider:SetShown(not barIndex and mover and mover.optionScaleable)
    options.heightSlider:SetShown(not barIndex and mover and mover.optionHeight)

    options.movers:ClearAllPoints()
    if barIndex then
        mover.optionScaleable = false
        options.default:SetText("恢复默认")
        custom:Show()
        custom:Refresh(barIndex)
        options:SetHeight(275)
        options.movers:SetPoint("TOPLEFT", custom, "BOTTOMLEFT", 0, -5)
        container:SetHeight(385)
        if container.seperator then container.seperator:SetHeight(385) end
    else
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Hide()
        options:SetHeight(175)
        options.movers:SetPoint("TOPLEFT", options.heightSlider, "BOTTOMLEFT", 0, -20)
        container:SetHeight(285)
        if container.seperator then container.seperator:SetHeight(285) end
    end
end

function AB.InitMoverOptions()
    SetupMoverOptionPanel()
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        if not mover.gwPlusActionBarOptionHooked then
            mover.gwPlusActionBarOptionHooked = true
            mover:HookScript("OnClick", AB.RefreshMoverOptionPanel)
            if GetMoverBarIndex(mover) then mover.optionScaleable = false end
        end
    end
    if addonTable.TranslateMoveHud then addonTable.TranslateMoveHud() end
end

--------------------------------------------------------------------------------
-- 九、球状血条与普通玩家框体并存
--------------------------------------------------------------------------------

function AB.IsNormalPlayerFrameEnabled()
    return InitDB().normalPlayerFrameEnabled ~= false
end

function AB.SetNormalPlayerFrameEnabled(value)
    InitDB().normalPlayerFrameEnabled = value == true
end

function AB.IsGlobeStyleEnabled()
    return GW.settings and not GW.settings.PLAYER_AS_TARGET_FRAME
end

function AB.SyncPlayerHudEnabled()
    if not GW.settings then return end
    GW.settings.HEALTHGLOBE_ENABLED =
        AB.IsNormalPlayerFrameEnabled()
        or AB.IsGlobeStyleEnabled()
end

function AB.SetGlobeStyleEnabled(value)
    if not GW.settings then return end

    GW.settings.PLAYER_AS_TARGET_FRAME = not value
    AB.SyncPlayerHudEnabled()
    if GW.updateSettingsFrameSettingsValue then
        GW.updateSettingsFrameSettingsValue(
            "PLAYER_AS_TARGET_FRAME", not value, false)
        GW.updateSettingsFrameSettingsValue(
            "HEALTHGLOBE_ENABLED",
            GW.settings.HEALTHGLOBE_ENABLED, false)
    end
end

function AB.ApplyNormalPlayerFrameVisibility()
    if QueueOutOfCombat(
        "normalPlayerFrame", AB.ApplyNormalPlayerFrameVisibility) then
        return
    end

    local enabled = AB.IsNormalPlayerFrameEnabled()
    local frame = _G.GwPlayerUnitFrame
    if enabled and not frame and GW.LoadPlayerFrame then
        frame = GW.LoadPlayerFrame()
        if (GW.Classic or GW.TBC or GW.Wrath)
            and GW.settings.PLAYER_ENERGY_MANA_TICK
            and GW.Load5SR then
            GW.Load5SR(frame)
        end
    end
    if not frame then return end

    if enabled then
        RegisterUnitWatch(frame)
    else
        UnregisterUnitWatch(frame)
        frame:Hide()
    end
end

function AB.EnsureNormalPlayerFrame()
    if AB.IsNormalPlayerFrameEnabled()
        and AB.IsGlobeStyleEnabled()
        and not _G.GwPlayerUnitFrame
        and GW.LoadPlayerFrame then
        local frame = GW.LoadPlayerFrame()
        if (GW.Classic or GW.TBC or GW.Wrath)
            and GW.settings.PLAYER_ENERGY_MANA_TICK
            and GW.Load5SR then
            GW.Load5SR(frame)
        end
    end

    AB.ApplyNormalPlayerFrameVisibility()
end

-- 在 GW2_UI 的 PLAYER_LOGIN 初始化玩家 HUD 之前，把原生总开关同步为
-- “普通玩家框体或球状血条任一开启”。
AB.SyncPlayerHudEnabled()

--------------------------------------------------------------------------------
-- 十、初始化
--------------------------------------------------------------------------------

-- 三段初始化互不相干，一段炸了不能把后面两段拖下水。
-- 错误照常交给 BugSack（xpcall + geterrorhandler，和本体 RegisterLoadHook 一样），
-- 另外在聊天框喊一声——不然某个功能静默失效，很难查。
local function SafeRun(label, func)
    return xpcall(func, function(err)
        geterrorhandler()(err)
        local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
        Notice("|cffff5555GW2_UI_PLUS 动作条：" .. label .. " 初始化失败，该功能不可用（详见 BugSack）|r")
    end)
end

local function Init()
    InitDB()
    AB.SyncPlayerHudEnabled()

    -- 单独一段：mover 注册失败也不该拖累尺寸功能
    SafeRun("主动作条编辑框", RegisterMainBarMover)

    SafeRun("按钮尺寸", function()
        -- 本体在别处调 UpdateMainBarHot 时用的还是硬编码的 48，跑完之后我们再排一遍。
        -- 面板里少数几个 callback 直接引用了函数值（拿到的是原版），那种情况靠上面
        -- 按钮的 SetPoint 钩子兜住。
        if GW.UpdateMainBarHot and not GW.UpdateMainBarHot_GW2Plus then
            local orig = GW.UpdateMainBarHot
            GW.UpdateMainBarHot = function(...)
                orig(...)
                AB.ApplyMainBarLayout()
            end
            GW.UpdateMainBarHot_GW2Plus = true
        end

        AB.ApplyGlobeScale()
        AB.ApplyMainBarLayout()
        AB.ApplyMultiBarSizes()
    end)

    if addonTable.PlusActionBarLayout then
        SafeRun("动作条布局", addonTable.PlusActionBarLayout.Init)
    end

    SafeRun("普通玩家框体", AB.EnsureNormalPlayerFrame)

    if addonTable.PlusEquipmentDebounce then
        SafeRun("换装刷新防抖", function()
            if not addonTable.PlusEquipmentDebounce.Init() then
                local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
                Notice("|cffffaa00GW2_UI_PLUS 动作条：未找到 GW2_UI 换装事件框体，防抖未启用。|r")
            end
        end)
    end

    if addonTable.PlusMageBar then
        AB.mageBarInitOk = SafeRun("法师动作条", addonTable.PlusMageBar.Init)
    end
    if addonTable.PlusFader then
        AB.faderInitOk = SafeRun("全局渐隐", addonTable.PlusFader.Init)
    end

    SafeRun("动作条编辑选项", AB.InitMoverOptions)
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_ENTERING_WORLD")
loader:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    Init()
end)
