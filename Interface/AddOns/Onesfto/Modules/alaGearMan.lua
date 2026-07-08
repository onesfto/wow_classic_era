local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            -- 调整 alaGearMan 屏幕上悬浮装备方案按钮的缩放大小
            if _G.__ala_meta__ and _G.__ala_meta__.gear then
                local gearUI = _G.__ala_meta__.gear.ui
                if gearUI then
                    local scaleSize = 1.5
                    if gearUI.quick then
                        gearUI.quick:SetScale(scaleSize)
                    end
                    if gearUI.secure then
                        gearUI.secure:SetScale(scaleSize)
                    end
                end
            end
        end)
    end
end)
