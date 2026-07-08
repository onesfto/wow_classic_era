local function NuclearDisable()
    if not _G.NDui then return end
    local B = unpack(_G.NDui)
    
    if B then
        -- 核心：阻止 NDui 修改全局 UI 缩放。UI 缩放必须由 ElvUI 接管，NDui 的强行缩放会导致 ElvUI 布局全面错乱
        B.SetupUIScale = function() end
        
        if B.GetModule then
            -- 穷举所有 NDui 模块，阻止它们初始化
            local modulesToKill = {
                "Mover", "GUI", "Settings", "AurasTable", "Maps", 
                "Misc", "Tooltip", "Chat", "Auras", "UnitFrames", 
                "Skins", "Infobar", "Cooldown", "Actionbar", 
                "ButtonRange", "Bags", "Tutorial"
            }
            
            for _, name in ipairs(modulesToKill) do
                local mod = B:GetModule(name)
                if mod then
                    mod.OnLogin = nil
                end
            end
        end
    end
end

-- 由于 Onesfto 在 NDui 之后加载（TOC 依赖），此时 NDui 的文件已全部读取完毕，
-- 所有的模块已经注册进 B:GetModule() 里。
-- 我们必须立刻将其设为 nil，千万不能等 ADDON_LOADED，因为那时早就错过了 NDui 的加载事件！
NuclearDisable()
