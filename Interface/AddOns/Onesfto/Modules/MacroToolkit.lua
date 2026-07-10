local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- 如果 Blizzard_MacroUI 已经加载
        if IsAddOnLoaded("Blizzard_MacroUI") then
            C_Timer.After(0.5, function()
                if MacroToolkitOpen and MacroNewButton then
                    MacroToolkitOpen:ClearAllPoints()
                    MacroToolkitOpen:SetPoint("RIGHT", MacroNewButton, "LEFT", -5, 0)
                    if ElvUI then
                        local E = unpack(ElvUI)
                        if E and E.GetModule then
                            local S = E:GetModule("Skins")
                            if S and S.HandleButton then
                                if not MacroToolkitOpen.isSkinned then
                                    S:HandleButton(MacroToolkitOpen)
                                    MacroToolkitOpen.isSkinned = true
                                end
                            end
                        end
                    end
                end
            end)
        end
    elseif event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == "Blizzard_MacroUI" then
            C_Timer.After(0.1, function()
                if MacroToolkitOpen and MacroNewButton then
                    MacroToolkitOpen:ClearAllPoints()
                    MacroToolkitOpen:SetPoint("RIGHT", MacroNewButton, "LEFT", -5, 0)
                    if ElvUI then
                        local E = unpack(ElvUI)
                        if E and E.GetModule then
                            local S = E:GetModule("Skins")
                            if S and S.HandleButton then
                                if not MacroToolkitOpen.isSkinned then
                                    S:HandleButton(MacroToolkitOpen)
                                    MacroToolkitOpen.isSkinned = true
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
