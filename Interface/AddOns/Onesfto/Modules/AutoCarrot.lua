local IsAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event)
    if not IsAddOnLoaded("ElvUI") or not IsAddOnLoaded("AutoCarrot") then return end

    if event == "PLAYER_ENTERING_WORLD" then
        if AutoCarrotDB and AutoCarrotButton then
            if AutoCarrotDB.hideButtonInInstance and IsInInstance() then
                AutoCarrotButton:Hide()
            else
                if AutoCarrotDB.button then
                    AutoCarrotButton:Show()
                else
                    AutoCarrotButton:Hide()
                end
            end
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        if AutoCarrotDB and not AutoCarrotDB.OnesftoInitialized then
            local defaults = {
                ["ridingGloves"] = true,
                ["bootsLink"] = "item:22500:911:",
                ["buttonScale"] = 0.96,
                ["wasAutoDisabled"] = false,
                ["button"] = true,
                ["beltId"] = 22730,
                ["enchantBootsLink"] = "item:19131:464:",
                ["enabled"] = false,
                ["handsLink"] = "item:21585:2616:",
                ["headId"] = 22498,
                ["instance"] = true,
                ["trinketId"] = 18820,
                ["enchantHandsLink"] = "item:16440:930:",
                ["swimHelm"] = true,
                ["mithrilSpurs"] = true,
                ["hideButtonInInstance"] = true,
                ["swimBelt"] = true,
                ["trinketSlot1"] = true,
                ["OnesftoInitialized"] = true,
            }
            for k, v in pairs(defaults) do
                AutoCarrotDB[k] = v
            end
        end
        if AutoCarrot_OnLoad then
            hooksecurefunc("AutoCarrot_OnLoad", function()
                if AutoCarrotDB.hideButtonInInstance and IsInInstance() then
                    if AutoCarrotButton then AutoCarrotButton:Hide() end
                end
            end)
        end

        local E = unpack(ElvUI)
    
    local function InsertOptions()
        if not E.Options.args.onesfto then
            E.Options.args.onesfto = {
                order = 100,
                type = "group",
                name = "Onesfto",
                args = {}
            }
        end
        
        E.Options.args.onesfto.args.autocarrot = {
            order = 1,
            type = "group",
            name = "AutoCarrot",
            get = function(info) return AutoCarrotDB[info[#info]] end,
            set = function(info, value) 
                AutoCarrotDB[info[#info]] = value 
                if info[#info] == "button" or info[#info] == "buttonScale" then
                    if AutoCarrot_OnLoad then AutoCarrot_OnLoad() end
                end
                if info[#info] == "enabled" then
                    if AutoCarrot_OnLoad then AutoCarrot_OnLoad() end
                    if not value and AutoCarrot_EquipNormalSet then AutoCarrot_EquipNormalSet() end
                end
                if info[#info] == "hideButtonInInstance" then
                    if value and IsInInstance() then
                        if AutoCarrotButton then AutoCarrotButton:Hide() end
                    else
                        if AutoCarrot_OnLoad then AutoCarrot_OnLoad() end
                    end
                end
            end,
            args = {
                enabled = {
                    order = 1,
                    type = "toggle",
                    name = "启用",
                },
                ridingGloves = {
                    order = 2,
                    type = "toggle",
                    name = "附魔手套-骑乘",
                },
                mithrilSpurs = {
                    order = 3,
                    type = "toggle",
                    name = "秘银马刺",
                },
                swimBelt = {
                    order = 4,
                    type = "toggle",
                    name = "游泳腰带",
                },
                swimHelm = {
                    order = 5,
                    type = "toggle",
                    name = "游泳头盔",
                },
                instance = {
                    order = 6,
                    type = "toggle",
                    name = "进本自动取消",
                    desc = "进入副本自动取消装备胡萝卜等坐骑加速饰品",
                },
                button = {
                    order = 7,
                    type = "toggle",
                    name = "显示悬浮按钮",
                },
                hideButtonInInstance = {
                    order = 7.5,
                    type = "toggle",
                    name = "进本隐藏按钮",
                    desc = "进入副本后自动隐藏悬浮按钮（不会影响开启状态）",
                },
                buttonScale = {
                    order = 8,
                    type = "range",
                    name = "按钮缩放",
                    min = 0.5, max = 3, step = 0.01,
                },
                resetButton = {
                    order = 9,
                    type = "execute",
                    name = "重置按钮位置",
                    func = function()
                        if AutoCarrotButton then
                            AutoCarrotButton:ClearAllPoints()
                            AutoCarrotButton:SetPoint("CENTER")
                            AutoCarrotDB.buttonScale = 1
                            if AutoCarrot_OnLoad then AutoCarrot_OnLoad() end
                        end
                    end,
                }
            }
        }
    end
    
    InsertOptions()
    
    if AutoCarrotButton then
        -- 移除暴雪原有的边框材质
        AutoCarrotButton:StripTextures()
        
        -- 套用 ElvUI 模板（创建 1 像素边框和背景）
        AutoCarrotButton:SetTemplate("Default")
        
        -- 添加鼠标悬停和点击时的 ElvUI 材质高亮
        AutoCarrotButton:StyleButton()
        
        -- 恢复并裁剪图标
        if AutoCarrotButton.icon then
            AutoCarrotButton.icon:SetTexture(134010) -- 直接重新指定胡萝卜图标的材质 ID
            AutoCarrotButton.icon:Show() -- 强制显示，防止被隐藏
            AutoCarrotButton.icon:SetTexCoord(unpack(E.TexCoords))
            AutoCarrotButton.icon:SetInside()
            -- 确保图标层级低于高亮层
            AutoCarrotButton.icon:SetDrawLayer("ARTWORK")
        end
        
        -- 让 overlay 遮罩层也对齐
        if AutoCarrotButton.overlay then
            -- 重新设置一下颜色，防止被 StripTextures 清除
            if AutoCarrotDB and AutoCarrotDB.enabled then
                AutoCarrotButton.overlay:SetColorTexture(0, 1, 0, 0.3)
            else
                AutoCarrotButton.overlay:SetColorTexture(1, 0, 0, 0.5)
            end
            AutoCarrotButton.overlay:SetInside()
        end
    end
    end
end)
