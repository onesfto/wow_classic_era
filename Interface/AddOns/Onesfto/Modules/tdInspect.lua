local frame = CreateFrame("Frame")


-- 2. 修改界面位置
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if C_AddOns.IsAddOnLoaded("tdInspect") then
            local tdInspect = LibStub("AceAddon-3.0"):GetAddon("tdInspect", true)
            if tdInspect and type(tdInspect.GetCharacterGearFrame) == "function" then
                -- 避免在 tdInspect 初始化前提前创建 Frame 导致父级丢失
                -- 我们等 tdInspect 自己获取 Frame 时再去 Hook 它
                hooksecurefunc(tdInspect, "GetCharacterGearFrame", function(self)
                    if not self._onesfto_hooked_char then
                        self._onesfto_hooked_char = true
                        local charFrame = self.CharacterGearFrame
                        if charFrame then
                            hooksecurefunc(charFrame, "TapTo", function(self)
                                local point, relativeTo, relativePoint, x, y = self:GetPoint()
                                if point then
                                    self:ClearAllPoints()
                                    self:SetPoint(point, relativeTo, relativePoint, x, (y or 0) + 0)
                                end
                            end)
                        end
                    end
                end)
            end

        end
    end
end)
