-- NovaWorldBuffs 皮肤 for GW2 UI Plus
-- 使用 GW2_UI_PLUS 皮肤内核 (skins/Core.lua) 的注册制与共享辅助函数。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end -- 内核 skins/Core.lua 未加载

-- NWB 计时小面板：剥框 + 计时文字字体
local function SkinTimerFrame(tf)
    if not tf then return end
    if tf.GwStripTextures then tf:GwStripTextures() end
    if tf.Background then tf.Background:SetAlpha(0) end
    for _, key in ipairs({ "fs", "fs1", "fs2" }) do
        Skin.SkinFont(tf[key], "Small", "OUTLINE") -- 世界地图上需描边
    end
end

-- NWB 地图/小地图标记：浮窗 + 计时面板 + 文字
local function SkinMarker(frame)
    if not frame then return end
    if frame.tooltip then Skin.SkinTooltip(frame.tooltip) end
    for _, key in ipairs({ "timerFrame", "noLayerFrame" }) do
        SkinTimerFrame(frame[key])
    end
    for _, key in ipairs({ "fs", "fs1", "fs2", "fsLayer" }) do
        Skin.SkinFont(frame[key], "Small", "OUTLINE") -- 世界地图上需描边
    end
end

-- 批量美化某一类标记集合（普通地图 + 小地图两份实例）
local function SkinMarkers(tbl)
    if not tbl then return end
    for k in pairs(tbl) do
        SkinMarker(_G[k .. "NWB"])
        SkinMarker(_G[k .. "NWBMini"])
    end
end

local PAD = 30 -- 内容区统一 padding

-- 把一组动作按钮竖排到指定窗口内容区右上角（距上/右各 PAD，按钮之间 5px）
local function StackButtonsTopRight(frameName, buttonNames)
    local anchor = _G[frameName]
    if not anchor then return end
    local prev
    for _, key in ipairs(buttonNames) do
        local btn = _G[key]
        if btn then
            btn:ClearAllPoints()
            if not prev then
                btn:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", -PAD, -PAD)
            else
                btn:SetPoint("TOPRIGHT", prev, "BOTTOMRIGHT", 0, -5)
            end
            prev = btn
        end
    end
end

Skin.Register("NovaWorldBuffs", function()
    local NWB = LibStub and LibStub("AceAddon-3.0", true)
        and LibStub("AceAddon-3.0"):GetAddon("NovaWorldBuffs", true)
    if not NWB then return end

    ----------------------------------------------------------------------------
    -- 1. 主窗口：背景 / 标题栏 / 滚动条 / 正文字体
    ----------------------------------------------------------------------------
    local mainFrames = {
        { name = "NWBlayerFrame",     drag = "NWBlayerDragFrame" },
        { name = "NWBLayerMapFrame",  drag = "NWBLayerMapDragFrame" },
        { name = "NWBCopyFrame",      drag = "NWBCopyDragFrame" },
        { name = "NWBTimerLogFrame",  drag = "NWBTimerLogDragFrame" },
        { name = "NWBLFrame",         drag = "NWBLDragFrame" },
        { name = "NWBbuffListFrame",  drag = "NWBbuffListDragFrame" },
        { name = "NWBDMFListFrame",   drag = "NWBDMFListDragFrame" },
    }
    for _, info in ipairs(mainFrames) do
        local frame = _G[info.name]
        if frame then
            Skin.SkinFrame(frame)
            -- 图标使用插件管理器同款（拼图图标）
            Skin.AddTitleBar(frame, info.drag, "Interface/AddOns/GW2_UI/textures/character/addon-window-icon.png")

            if frame.GwSkinScrollFrame then frame:GwSkinScrollFrame() end
            local scrollBar = _G[info.name .. "ScrollBar"]
                or (frame.scrollFrame and frame.scrollFrame.ScrollBar) or frame.ScrollBar
            Skin.SkinScrollBar(scrollBar)

            -- 位面列表 / 记录等正文 EditBox：四周统一 PAD 留白（上/左/右）
            if frame.EditBox then
                Skin.SkinFont(frame.EditBox, "Normal")
                frame.EditBox:SetTextInsets(PAD, PAD, PAD, 0)
                hooksecurefunc(frame.EditBox, "SetFont", function(self)
                    if self.isSkinnedFont then return end
                    self.isSkinnedFont = true
                    Skin.SkinFont(self, "Normal")
                    self.isSkinnedFont = false
                end)
            end

            -- 顶部/底部零散字体（标题字已由 AddTitleBar 处理）
            if frame.fs and not frame.fs.isSkinnedTitle then Skin.SkinFont(frame.fs, "Header") end
            if frame.fs2 and not frame.fs2.isSkinnedTitle then Skin.SkinFont(frame.fs2, "Normal") end
            if frame.fs3 and not frame.fs3.isSkinnedTitle then Skin.SkinFont(frame.fs3, "Normal") end
        end
    end

    -- NWBlayerFrame 留白微调
    if _G.NWBlayerFrame then
        -- ① 第一行说明固定在内容区左上角 (PAD, PAD)
        if _G.NWBlayerFrame.fs2 then
            _G.NWBlayerFrame.fs2:ClearAllPoints()
            _G.NWBlayerFrame.fs2:SetPoint("TOPLEFT", PAD, -PAD)
        end
        -- ② 位面信息(EditBox 正文)顶部 inset。
        -- 实际①②间距 = 此 inset + 原插件正文前自带的 3 个空行(不可动)，
        -- 故此处调小(15)，把间距压到约原来的一半。想再增减间距就改这个数。
        if _G.NWBlayerFrame.EditBox then
            _G.NWBlayerFrame.EditBox:SetTextInsets(PAD, PAD, 15, 0)
        end
        -- ③ 底部说明文字(fs3)：NWB 的 recalclayerFrame 会按内容高度把它挂到窗口(贴底)
        -- 或挂到 EditBox(跟随滚动)。这里无条件拉回窗口并固定底部 PAD，保证永远留 30px。
        if NWB.recalclayerFrame then
            hooksecurefunc(NWB, "recalclayerFrame", function()
                local fs3 = _G.NWBlayerFrame and _G.NWBlayerFrame.fs3
                if fs3 then
                    fs3:SetParent(_G.NWBlayerFrame)
                    fs3:ClearAllPoints()
                    fs3:SetPoint("BOTTOM", _G.NWBlayerFrame, 0, PAD)
                end
            end)
        end
    end

    ----------------------------------------------------------------------------
    -- 2. 提示浮窗
    ----------------------------------------------------------------------------
    local tooltips = {
        "NWBlayerDragTooltip", "NWBLayerMapDragTooltip", "NWBCopyDragTooltip",
        "NWBVersionDragTooltip", "NWBDmfDragTooltip", "NWBTimerLogDragTooltip",
        "NWBLDragTooltip", "NWBbuffListDragTooltip", "NWBDMFTooltip", "NWBDMFContinentTooltip",
        "NWBbuffListResetButtonTooltip", "NWBBuffsLineTooltip",
    }
    for _, key in ipairs(tooltips) do
        Skin.SkinTooltip(_G[key])
    end

    ----------------------------------------------------------------------------
    -- 3. 静态按钮 + 右侧按钮列布局
    ----------------------------------------------------------------------------
    local closeButtons = {
        "NWBlayerFrameClose", "NWBLayerMapFrameClose", "NWBCopyFrameClose",
        "NWBbuffListFrameClose", "NWBDMFListFrameClose", "NWBTimerLogFrameClose", "NWBLFrameClose",
    }
    for _, key in ipairs(closeButtons) do
        Skin.SkinClose(_G[key])
    end

    local normalButtons = {
        "NWBlayerFrameConfButton", "NWBlayerFrameBuffsButton", "NWBlayerFrameMapButton",
        "NWBlayerFrameCopyButton", "NWBlayerFrameTimerLogButton", "NWBGuildLayersButton",
        "NWBLFrameRefreshButton", "NWBbuffListFrameWipeButton",
        "NWBbuffListFrameConfButton", "NWBbuffListFrameTimersButton", "NWBTimerLogRefreshButton",
    }
    for _, key in ipairs(normalButtons) do
        Skin.SkinButton(_G[key])
    end

    -- 各窗口动作按钮竖排到内容区右上角（距上/右各 PAD，按钮间 5px）
    StackButtonsTopRight("NWBlayerFrame", {
        "NWBlayerFrameConfButton", "NWBlayerFrameBuffsButton", "NWBlayerFrameMapButton",
        "NWBlayerFrameTimerLogButton", "NWBGuildLayersButton", "NWBlayerFrameCopyButton",
    })
    StackButtonsTopRight("NWBbuffListFrame", {
        "NWBbuffListFrameConfButton", "NWBbuffListFrameTimersButton", "NWBbuffListFrameWipeButton",
    })
    StackButtonsTopRight("NWBTimerLogFrame", { "NWBTimerLogRefreshButton" })
    StackButtonsTopRight("NWBLFrame", { "NWBLFrameRefreshButton" })

    ----------------------------------------------------------------------------
    -- 4. 动态控件：复选框 / 滑块（面板打开时才创建，须 hook 创建函数）
    ----------------------------------------------------------------------------
    local function SkinChecks(keys)
        for _, key in ipairs(keys) do
            Skin.SkinCheckBox(NWB[key])
        end
    end

    if NWB.createBuffsListExtraButtons then
        hooksecurefunc(NWB, "createBuffsListExtraButtons", function()
            SkinChecks({ "showStatsButton", "showStatsAllButton" })
            Skin.SkinSlider(NWB.charsMinLevelSlider)
        end)
    end
    if NWB.createCopyFormatButton then
        hooksecurefunc(NWB, "createCopyFormatButton", function()
            SkinChecks({ "copyDiscordButton" })
            -- Discord 复选框原本贴在标题栏上，下移到标题栏下方右侧
            if NWB.copyDiscordButton and _G.NWBCopyFrame then
                NWB.copyDiscordButton:ClearAllPoints()
                NWB.copyDiscordButton:SetPoint("TOPRIGHT", _G.NWBCopyFrame, "TOPRIGHT", -84, -PAD)
            end
        end)
    end
    if NWB.createDmfHelperButtons then
        hooksecurefunc(NWB, "createDmfHelperButtons", function()
            SkinChecks({ "dmfChatCountdown", "dmfAutoResButton" })
        end)
    end
    if NWB.createTimerLogCheckboxes then
        hooksecurefunc(NWB, "createTimerLogCheckboxes", function()
            SkinChecks({ "timerLogShowRendButton", "timerLogShowOnyButton", "timerLogShowNefButton" })
        end)
    end
    if NWB.createTimerLogMergeLayersCheckbox then
        hooksecurefunc(NWB, "createTimerLogMergeLayersCheckbox", function()
            SkinChecks({ "timerLogMergeLayersButton" })
        end)
    end

    ----------------------------------------------------------------------------
    -- 5. 动态按钮：屏蔽/启用图层
    ----------------------------------------------------------------------------
    if NWB.createDisableLayerButton then
        hooksecurefunc(NWB, "createDisableLayerButton", function(_, count)
            Skin.SkinButton(_G["NWBDisableLayerButton" .. count])
            Skin.SkinButton(_G["NWBEnableLayerButton" .. count])
        end)
    end

    ----------------------------------------------------------------------------
    -- 6. 地图 / 小地图标记
    ----------------------------------------------------------------------------
    local minimap = _G.MinimapLayerFrame
    if minimap then
        if minimap.GwStripTextures then minimap:GwStripTextures()
        elseif minimap.StripTextures then minimap:StripTextures() end
        if minimap.tooltip then Skin.SkinTooltip(minimap.tooltip) end
    end

    if NWB.createSongflowerMarkers then
        hooksecurefunc(NWB, "createSongflowerMarkers", function() SkinMarkers(NWB.songFlowers) end)
    end
    if NWB.createTuberMarkers then
        hooksecurefunc(NWB, "createTuberMarkers", function() SkinMarkers(NWB.tubers) end)
    end
    if NWB.createDragonMarkers then
        hooksecurefunc(NWB, "createDragonMarkers", function() SkinMarkers(NWB.dragons) end)
    end

    SkinMarker(_G.NWBDMF)
    SkinMarker(_G.NWBDMFContinent)
end)
