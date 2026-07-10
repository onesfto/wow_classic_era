local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then

        C_Timer.After(1, function()
            -- 调整 WhisperPop
            if WhisperPopNotifyButton then
                if WhisperPopNotifyButton.icon and not C_AddOns.IsAddOnLoaded("NDui_Plus") then
                    WhisperPopNotifyButton.icon:SetTexture("Interface\\Buttons\\UI-GuildButton-MOTD-Up")
                end
                if WhisperPopNotifyButton.text then
                    WhisperPopNotifyButton.text:ClearAllPoints()
                    WhisperPopNotifyButton.text:SetPoint("RIGHT", WhisperPopNotifyButton, "LEFT", -2, 0)
                end
            end
            
            -- 放大 WhisperPop 主窗口关闭按钮的点击区域
            if WhisperPopFrameTopCloseButton then
                WhisperPopFrameTopCloseButton:SetHitRectInsets(-5, -5, -5, -5)
                -- WhisperPopFrameTopCloseButton:SetSize(30, 30)
            end
            
            -- 放大聊天列表悬停时出现的删除(X)按钮的点击区域
            if WhisperPopFrameListDelete then
                WhisperPopFrameListDelete:SetHitRectInsets(-5, -5, -5, -5)
                -- WhisperPopFrameListDelete:SetSize(30, 30)
            end
        end)
    end
end)
