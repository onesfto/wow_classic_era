-- MeetingHornFix.lua
-- 归属：Onesfto 插件
-- 修复集结号在魔兽世界 1.15.x (探索赛季/经典旧世) 版本的常见 API 不兼容报错

local fixFrame = CreateFrame("Frame")
fixFrame:RegisterEvent("ADDON_LOADED")
fixFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "MeetingHorn" then
        -- 1. 修复 1.15.x 中被移除的 BlizzardOptionsPanel_CheckButton API
        if not BlizzardOptionsPanel_CheckButton_Disable then
            BlizzardOptionsPanel_CheckButton_Disable = function(button)
                if button then
                    button:Disable()
                    local text = _G[button:GetName() .. "Text"]
                    if text then
                        text:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
                    end
                end
            end
        end

        if not BlizzardOptionsPanel_CheckButton_Enable then
            BlizzardOptionsPanel_CheckButton_Enable = function(button)
                if button then
                    button:Enable()
                    local text = _G[button:GetName() .. "Text"]
                    if text then
                        text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
                    end
                end
            end
        end
        
        -- 2. 修复 11.0 / 1.15.x 中废弃的 GetSpellInfo API
        if not GetSpellInfo and C_Spell and C_Spell.GetSpellInfo then
            GetSpellInfo = function(spellID)
                if not spellID then return nil end
                local info = C_Spell.GetSpellInfo(spellID)
                if info then
                    return info.name, nil, info.iconID, info.castTime, info.minRange, info.maxRange, info.spellID, info.originalIconID
                end
            end
        end
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)
