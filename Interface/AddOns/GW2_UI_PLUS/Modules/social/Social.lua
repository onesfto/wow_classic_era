-- GW2_UI_PLUS 社交窗口 —— 驱动
--
-- GW2_UI 的社交窗口皮肤（好友/公会/屏蔽/谁在线/团队）本来只给正式服和 TBC 用：
--     core/GW2_ui.lua:685   if GW.Retail or GW.TBC then GW.LoadSocialFrame() end
-- 经典旧世下这些 GW.Skin* 函数虽然被定义了，却从来没人调用。
--
-- 原来的做法是改 GW2_UI 那一行加上 or GW.Classic，再把六个文件挨个改到能在经典旧世跑。
-- 现在改成：六个文件搬到 PLUS 覆盖同名 GW.* 函数，然后这里自己调一次。
-- 因为上游在经典旧世根本不会调用它们，所以不存在双跑或竞态。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local function LoadSocial()
    if not GW.LoadSocialFrame then return end
    -- LoadSocialFrame 内部自己会看 GW.settings.USE_SOCIAL_WINDOW
    GW.LoadSocialFrame()
end

-- 上游是在 evPlayerLogin 里调的；经典旧世下那一步早在 PLUS 加载之前就跑完了，
-- 所以这里挂 PLAYER_LOGIN 自己补一次。FriendsFrame 属于 FrameXML，这时一定存在。
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    LoadSocial()
end)

-- 已经过了 PLAYER_LOGIN 才加载（比如插件被中途启用）的兜底
if IsLoggedIn and IsLoggedIn() then
    f:UnregisterEvent("PLAYER_LOGIN")
    LoadSocial()
end

addonTable.LoadSocial = LoadSocial
