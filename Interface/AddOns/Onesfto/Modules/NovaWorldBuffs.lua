local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            -- 调整 NovaWorldBuffs 浮动显示的位面信息 UI (ElvUI 皮肤)
            if ElvUI then
                local E = unpack(ElvUI)
                if E and E.GetModule then
                    local S = E:GetModule("Skins")
                    if S then
                        local elvFont = E.media.normFont or STANDARD_TEXT_FONT

                        -- 全局强制替换 NWB 的默认字体
                        local AceAddon = LibStub and LibStub("AceAddon-3.0", true)
                        if AceAddon then
                            local NWB = AceAddon:GetAddon("NovaWorldBuffs", true)
                            if NWB then
                                NWB.regionFont = elvFont
                            end
                        end

                        local function setElvUIFont(region)
                            if region and region.IsObjectType and region:IsObjectType("FontString") then
                                local font, size, outline = region:GetFont()
                                if font ~= elvFont then
                                    region:SetFont(elvFont, size or 12, outline)
                                end
                            end
                        end

                        local function applyFonts(frame)
                            if not frame then return end
                            if frame.GetRegions then
                                for _, region in ipairs({frame:GetRegions()}) do
                                    if region.IsObjectType and region:IsObjectType("FontString") then
                                        setElvUIFont(region)
                                    end
                                end
                            end
                            if frame.GetChildren then
                                for _, child in ipairs({frame:GetChildren()}) do
                                    if child.IsObjectType and child:IsObjectType("Frame") and child.GetRegions then
                                        for _, region in ipairs({child:GetRegions()}) do
                                            if region.IsObjectType and region:IsObjectType("FontString") then
                                                setElvUIFont(region)
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        local function applySkinToFrame(name, frame)
                            if not frame or frame.isSkinnedElvUI then return end
                            frame.isSkinnedElvUI = true

                            -- 安全地去除 Blizzard 默认边框和材质
                            if frame.StripTextures then frame:StripTextures() end
                            if frame.SetBackdrop then frame:SetBackdrop(nil) end
                            if frame.SetTemplate then frame:SetTemplate("Transparent") end

                            -- 彻底瘫痪 Blizzard 的 NineSlice 和 Border (Classic XML 通常通过 _G[name.."Border"] 生成)
                            local elementsToKill = {
                                frame.NineSlice, frame.Border, frame.Background, frame.Center,
                                _G[name .. "NineSlice"], _G[name .. "Border"], _G[name .. "Background"], _G[name .. "Center"]
                            }
                            for _, obj in ipairs(elementsToKill) do
                                if obj and type(obj) == "table" and obj.SetAlpha then
                                    obj:SetAlpha(0)
                                    if obj.Hide then obj:Hide() end
                                    obj.SetAlpha = function() end
                                    if obj.Show then obj.Show = function() end end
                                end
                            end

                            applyFonts(frame)

                            if frame.HookScript then
                                frame:HookScript("OnShow", function()
                                    applyFonts(frame)
                                end)
                            end
                        end

                        if MinimapLayerFrame then
                            if MinimapLayerFrame.StripTextures then MinimapLayerFrame:StripTextures() end
                            if MinimapLayerFrame.SetTemplate then MinimapLayerFrame:SetTemplate("Transparent") end
                            applyFonts(MinimapLayerFrame)
                            if MinimapLayerFrame.tooltip then applySkinToFrame("NWBVersionDragTooltip", MinimapLayerFrame.tooltip) end
                        end
                        if NWBlayerFrame then
                            if NWBlayerFrame.StripTextures then NWBlayerFrame:StripTextures() end
                            if NWBlayerFrame.SetTemplate then NWBlayerFrame:SetTemplate("Transparent") end
                            applyFonts(NWBlayerFrame)
                            if NWBlayerFrameClose and S.HandleCloseButton then S:HandleCloseButton(NWBlayerFrameClose) end
                        end
                        if NWBLayerMapFrame then
                            if NWBLayerMapFrame.StripTextures then NWBLayerMapFrame:StripTextures() end
                            if NWBLayerMapFrame.SetTemplate then NWBLayerMapFrame:SetTemplate("Transparent") end
                            applyFonts(NWBLayerMapFrame)
                            if NWBLayerMapFrameClose and S.HandleCloseButton then S:HandleCloseButton(NWBLayerMapFrameClose) end
                        end

                        -- NWB 动态创建的框体匹配模式 (去掉了 $ 结尾匹配，因为有些动态框体带有数字后缀)
                        local nwbTooltipPatterns = {
                            "NWB.*Tooltip",
                            "NWB.*TimerFrame",
                            "NWBWorldMap",
                            "WorldMapTooltip",
                            "WorldMapTimerFrame",
                            "WorldMapNoLayerFrame",
                            "^flower%d+",
                            "^tuber%d+",
                            "^dragon%d+",
                            "DailyMapTextTooltip",
                            "BlackrockTimerFrame",
                            "StranglethornTimerFrame",
                            "AshenvaleTimerFrame",
                            "NWBDMF"
                        }

                        local function skinNWBFrameByName(name, frame)
                            if not frame or type(frame) ~= "table" or not frame.IsObjectType or not frame:IsObjectType("Frame") then return end
                            if frame.isSkinnedElvUI then return end
                            
                            local match = false
                            for _, pattern in ipairs(nwbTooltipPatterns) do
                                if string.match(name, pattern) then
                                    match = true
                                    break
                                end
                            end
                            if match then
                                -- Tooltip 和 TimerFrame 等带有九宫格边框的框体需要彻底清除背景
                                if string.match(name, "Tooltip") or string.match(name, "TimerFrame") or string.match(name, "NoLayerFrame") then
                                    applySkinToFrame(name, frame)
                                else
                                    -- 纯图标 Marker，只需要更新字体，不能设置背景否则会有黑框
                                    applyFonts(frame)
                                    if frame.HookScript then
                                        frame:HookScript("OnShow", function() applyFonts(frame) end)
                                    end
                                end
                            end
                        end

                        for name, frame in pairs(_G) do
                            if type(name) == "string" then
                                skinNWBFrameByName(name, frame)
                            end
                        end

                        -- 拦截后续动态创建的框体
                        hooksecurefunc("CreateFrame", function(frameType, name, parent, template)
                            if name and type(name) == "string" then
                                local frame = _G[name]
                                if frame then
                                    C_Timer.After(0, function() skinNWBFrameByName(name, frame) end)
                                end
                            end
                        end)
                    end
                end
            end
        end)
    end
end)
