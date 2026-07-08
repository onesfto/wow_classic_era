local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            local buttons = {}
            
            -- 强制整理世界地图右上角的插件按钮
            local function ArrangeWorldMapButtons()
                if not WorldMapFrame then return end
                
                -- 1. 获取所有地图按钮 (Krowi 库及原生 Tracking)
                local Krowi = LibStub("Krowi_WorldMapButtons-1.4", true)
                if Krowi and Krowi.Buttons then
                    for _, btn in ipairs(Krowi.Buttons) do
                        if btn then
                            local alreadyAdded = false
                            for _, v in ipairs(buttons) do
                                if v == btn then alreadyAdded = true break end
                            end
                            if not alreadyAdded then table.insert(buttons, btn) end
                        end
                    end
                else
                    for i = 1, 20 do
                        local btn = _G["Krowi_WorldMapButtons" .. i]
                        if btn then
                            local alreadyAdded = false
                            for _, v in ipairs(buttons) do
                                if v == btn then alreadyAdded = true break end
                            end
                            if not alreadyAdded then table.insert(buttons, btn) end
                        end
                    end
                end
                
                -- 2. 强制抓取原生的 Tracking 按钮 (地球)
                if WorldMapFrame.overlayFrames then
                    for _, btn in ipairs(WorldMapFrame.overlayFrames) do
                        local isTrackingButton = false
                        local name = btn:GetName()
                        
                        -- 根据已知属性识别
                        if btn.Icon or (name and name:find("Tracking")) or (btn.IsObjectType and btn:IsObjectType("DropDownToggleButton")) then
                            isTrackingButton = true
                        end
                        
                        -- 根据贴图特征暴力识别（解决匿名框体无特征的问题）
                        if not isTrackingButton and btn.GetRegions then
                            for _, region in ipairs({btn:GetRegions()}) do
                                if region.GetObjectType and region:GetObjectType() == "Texture" then
                                    local file = region:GetTexture()
                                    if file then
                                        local fStr = tostring(file):lower()
                                        if fStr:find("trackingborder") or file == 136430 then
                                            isTrackingButton = true
                                            break
                                        end
                                    end
                                end
                            end
                        end
                        
                        if isTrackingButton then
                            local alreadyAdded = false
                            for _, v in ipairs(buttons) do
                                if v == btn then alreadyAdded = true break end
                            end
                            if not alreadyAdded then
                                table.insert(buttons, btn)
                            end
                        end
                    end
                end
                
                -- 3. 获取 HandyNotes_NPCs 按钮
                local AceAddon = LibStub("AceAddon-3.0", true)
                if AceAddon then
                    local HN_NPCs = AceAddon:GetAddon("HandyNotes_NPCs (Classic)", true)
                    if HN_NPCs and HN_NPCs.button then
                        local alreadyAdded = false
                        for _, v in ipairs(buttons) do
                            if v == HN_NPCs.button then alreadyAdded = true break end
                        end
                        if not alreadyAdded then table.insert(buttons, HN_NPCs.button) end
                    end
                end
                
                -- 4. 重新排列
                local anchorFrame = WorldMapFrame.ScrollContainer or WorldMapFrame.BorderFrame or WorldMapFrame
                local isLeatrix = IsAddOnLoaded("Leatrix_Maps")
                local startX = isLeatrix and -35 or -40
                local startY = isLeatrix and -2 or -35
                
                for _, btn in ipairs(buttons) do
                    btn.expectedX = startX
                    btn.expectedY = startY
                    
                    if not btn.isPointHooked then
                        btn.isPointHooked = true
                        btn.isUpdatingPoint = false
                        hooksecurefunc(btn, "SetPoint", function(self, point, anchor, relPoint, x, y)
                            if self.isUpdatingPoint then return end
                            if x ~= self.expectedX or y ~= self.expectedY then
                                self.isUpdatingPoint = true
                                self:ClearAllPoints()
                                self:SetPoint("TOPRIGHT", anchorFrame, "TOPRIGHT", self.expectedX, self.expectedY)
                                self.isUpdatingPoint = false
                            end
                        end)
                    end
                    
                    btn.isUpdatingPoint = true
                    btn:ClearAllPoints()
                    btn:SetPoint("TOPRIGHT", anchorFrame, "TOPRIGHT", startX, startY)
                    btn.isUpdatingPoint = false
                    
                    -- 拔高层级防遮挡
                    if btn.GetFrameLevel and btn:GetFrameLevel() < 1000 then
                        btn:SetFrameLevel(2000)
                    end
                    
                    -- 专门把 NPCs 按钮伪装成原生 tracking 按钮风格
                    if btn.GetText and btn:GetText() == "NPCs" then
                        btn:SetText("")
                        btn:SetSize(32, 32)
                        
                        -- 去除 ElvUI 默认给 UIPanelButton 加的皮肤和多余的纹理
                        if btn.backdrop then btn.backdrop:Hide() end
                        if btn.SetBackdrop then btn:SetBackdrop(nil) end
                        if btn.Left then btn.Left:SetAlpha(0) end
                        if btn.Middle then btn.Middle:SetAlpha(0) end
                        if btn.Right then btn.Right:SetAlpha(0) end
                        
                        -- 加上类似原生 Tracking 按钮的背景底图
                        if not btn.NativeBackground then
                            btn.NativeBackground = btn:CreateTexture(nil, "BACKGROUND")
                            btn.NativeBackground:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
                            btn.NativeBackground:SetSize(25, 25)
                            btn.NativeBackground:SetPoint("TOPLEFT", btn, "TOPLEFT", 2, -4)
                        end
                        
                        -- 加上原生 Tracking 按钮的金边
                        if not btn.NativeBorder then
                            btn.NativeBorder = btn:CreateTexture(nil, "OVERLAY")
                            btn.NativeBorder:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
                            btn.NativeBorder:SetSize(54, 54)
                            btn.NativeBorder:SetPoint("TOPLEFT", btn, "TOPLEFT", 0, 0)
                        end
                        
                        -- 加上原生 Tracking 图标（这里用个找人的图标代表 NPCs）
                        if not btn.NativeIcon then
                            btn.NativeIcon = btn:CreateTexture(nil, "ARTWORK")
                            btn.NativeIcon:SetTexture("Interface\\Icons\\INV_Misc_GroupLooking")
                            btn.NativeIcon:SetSize(20, 20)
                            btn.NativeIcon:SetPoint("TOPLEFT", btn, "TOPLEFT", 6, -5)
                            btn.NativeIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
                        end
                    end
                    
                    startX = startX - (btn.GetWidth and btn:GetWidth() or 32) - 6
                end
            end

            -- 登录时尝试整理一次
            ArrangeWorldMapButtons()
            
            -- 地图每次打开或刷新时，再次尝试整理
            if WorldMapFrame then
                WorldMapFrame:HookScript("OnShow", ArrangeWorldMapButtons)
                if WorldMapFrame.OnMapChanged then
                    hooksecurefunc(WorldMapFrame, "OnMapChanged", ArrangeWorldMapButtons)
                end
            end

            -- Hook Krowi_WorldMapButtons-1.4 的排版函数，以覆盖它的默认位置
            local Krowi = LibStub("Krowi_WorldMapButtons-1.4", true)
            if Krowi and Krowi.SetPoints then
                hooksecurefunc(Krowi, "SetPoints", ArrangeWorldMapButtons)
            end
            -- 地图事件
            if WorldMapFrame then
                if WorldMapFrame.OnMapChanged then
                    hooksecurefunc(WorldMapFrame, "OnMapChanged", ArrangeWorldMapButtons)
                end
                WorldMapFrame:HookScript("OnShow", function()
                    C_Timer.After(0.1, ArrangeWorldMapButtons)
                end)
            end
        end)
    end
end)
