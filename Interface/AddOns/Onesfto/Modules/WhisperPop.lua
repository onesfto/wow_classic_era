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
        end)
    end
end)
