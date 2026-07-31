-- GW2_UI_PLUS 法术书修复 (Spellbook)
--
-- 修两个经典旧世下的老毛病：
--   1. 带等级的法术左键点了没反应（上游把 spellID 直接塞进 secure 按钮的 spell 属性，
--      CastSpellByID 在 1.15 对多等级法术不可靠；而且只注册了 AnyUp，
--      SecureActionButtonTemplate 对抬起事件有静默拦截）
--   2. 翻页会跳回第一页（上游用 IsVisible() 链式判断推算当前页，
--      SPELLS_CHANGED 引发重绘时所有页面瞬时全隐藏，页码就被重置成 1 了）
--
-- 以前的结论是「只能改源码」，因为 setButtonStyle 和 setUpPaging 都是 local。
-- 但实际上不用碰它们——要改的东西全都够得着：
--   GwSpellbookContainerTab{1..6}   每个专业页的容器，全局名
--     .left / .right / .attrDummy / .container1..7 / .tabs / .buttons   都是它的 parentKey
--   按钮上还存着 .spellbookIndex / .booktype / .isFuture / .isFlyout，
--   所以能原样复刻 setButtonStyle 里那段判断，不用猜。
--
-- 做法是「事后重设」而不是「覆盖函数」：经典旧世下 GW2_UI 在自己的 ADDON_LOADED 里
-- 就跑完了 GW.LoadCharacter()，法术书在 PLUS 加载之前已经建好了，来不及接管构建过程。
--
-- Taint 说明：这些框体本来就是插件创建的，我们只是在非战斗中重设属性，
-- 和 GW2_UI 自己做的事完全一样，不涉及暴雪的受保护框体。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local MAX_TABS = 6      -- 经典旧世 5 个，探索赛季 6 个，多查一个不存在的没代价
local MAX_PAGES = 7     -- 与 GwSpellbookContainerTab 模板里的 container1..7 对应

local Spellbook = {}
addonTable.Spellbook = Spellbook

--------------------------------------------------------------------------------
-- 翻页：换成绝对页码
--------------------------------------------------------------------------------
-- 上游的 _onattributechanged 监听 'page'（值是 "left"/"right"），靠 IsVisible() 一路问下来
-- 才知道现在第几页。我们改成监听 'currentpage'，值直接就是页码，页面重绘也不会丢状态。
-- SetAttribute 是覆盖写，上游那段 snippet 会被整个换掉，不存在两套逻辑打架。

local PAGE_SNIPPET = [=[
    if name ~= 'currentpage' then return end

    local p1 = self:GetFrameRef('container1')
    local p2 = self:GetFrameRef('container2')
    local p3 = self:GetFrameRef('container3')
    local p4 = self:GetFrameRef('container4')
    local p5 = self:GetFrameRef('container5')
    local p6 = self:GetFrameRef('container6')
    local p7 = self:GetFrameRef('container7')
    local left = self:GetFrameRef('left')
    local right = self:GetFrameRef('right')
    local numPages = %s
    local currentPage = tonumber(value) or 1

    local targetPage = currentPage
    if targetPage < 1 then targetPage = 1 end
    if targetPage > numPages then targetPage = numPages end

    if targetPage ~= currentPage then
        self:SetAttribute('currentPage', targetPage)
        return
    end

    p1:Hide() p2:Hide() p3:Hide() p4:Hide() p5:Hide() p6:Hide() p7:Hide()

    if targetPage == 7 then p7:Show()
    elseif targetPage == 6 then p6:Show()
    elseif targetPage == 5 then p5:Show()
    elseif targetPage == 4 then p4:Show()
    elseif targetPage == 3 then p3:Show()
    elseif targetPage == 2 then p2:Show()
    elseif targetPage == 1 then p1:Show()
    end

    if targetPage >= numPages then
        right:Hide()
    else
        right:Show()
    end
    if targetPage == 1 then
        left:Hide()
    else
        left:Show()
    end
]=]

local LEFT_CLICK_SNIPPET = [=[
    local tab = self:GetFrameRef('tab')
    local cp = tab:GetAttribute('currentPage') or 1
    tab:SetAttribute('currentPage', cp - 1)
]=]

local RIGHT_CLICK_SNIPPET = [=[
    local tab = self:GetFrameRef('tab')
    local cp = tab:GetAttribute('currentPage') or 1
    tab:SetAttribute('currentPage', cp + 1)
]=]

local function ApplyPagingFix(container)
    local dummy = container.attrDummy
    if not dummy or not container.left or not container.right then return end

    container.left:SetFrameRef("tab", dummy)
    container.left:SetAttribute("_onclick", LEFT_CLICK_SNIPPET)

    container.right:SetFrameRef("tab", dummy)
    container.right:SetAttribute("_onclick", RIGHT_CLICK_SNIPPET)

    for i = 1, MAX_PAGES do
        local page = container["container" .. i]
        if not page then return end -- 模板不完整就别动，免得 snippet 里 nil 索引
        dummy:SetFrameRef("container" .. i, page)
    end
    dummy:SetFrameRef("left", container.left)
    dummy:SetFrameRef("right", container.right)

    dummy:SetAttribute("_onattributechanged", PAGE_SNIPPET:format(container.tabs or 1))

    -- 安全环境对「写入同样的值」可能直接优化掉、不触发回调，
    -- 所以先写个脏值 0 把状态打断，再写真正的页码，保证一定重排一次。
    local current = dummy:GetAttribute("currentPage") or 1
    dummy:SetAttribute("currentPage", 0)
    dummy:SetAttribute("currentPage", current)
end

--------------------------------------------------------------------------------
-- 按钮：改用精确的法术名字符串施法
--------------------------------------------------------------------------------
-- 上游是 btn:SetAttribute("spell", spellID)。经典旧世下多等级法术按 ID 施放不可靠，
-- 改成底层数据库里的原文，例如 "寒冰箭(等级 1)"。
-- 注意 GetSpellBookItemName 返回的副标题里本来就带空格（"等级 1"），千万不要去掉。

local function ApplyButtonFix(btn)
    -- 只处理普通法术：飞出菜单、未习得法术、宠物技能都保持上游行为
    if not btn or btn.isFlyout or btn.isFuture then return end
    if not btn.spellbookIndex or not btn.booktype then return end
    if btn.booktype == BOOKTYPE_PET then return end

    local realName, realSubtext = GetSpellBookItemName(btn.spellbookIndex, btn.booktype)
    if not realName or realName == "" then return end

    local castStr = realName:match("^%s*(.-)%s*$")
    if realSubtext and realSubtext ~= "" then
        local trimSub = realSubtext:match("^%s*(.-)%s*$")
        -- 只有带数字的副标题才是「等级 N」，像「被动」这种不能拼进去
        if string.find(trimSub, "%d") then
            castStr = castStr .. "(" .. trimSub .. ")"
        end
    end

    -- 注册按下事件，绕开 SecureActionButtonTemplate 对纯抬起事件的静默拦截
    btn:RegisterForClicks("AnyUp", "AnyDown")

    btn:SetAttribute("type", "spell")
    btn:SetAttribute("type1", "spell")
    btn:SetAttribute("type2", "spell")
    btn:SetAttribute("spell", castStr)

    -- 按钮是复用的，清掉上一次可能残留的宏文本
    btn:SetAttribute("macrotext", nil)
    btn:SetAttribute("macrotext1", nil)
    btn:SetAttribute("macrotext2", nil)
    btn:SetAttribute("*macrotext1", nil)
    btn:SetAttribute("*macrotext2", nil)
end

--------------------------------------------------------------------------------
-- 应用与调度
--------------------------------------------------------------------------------

local pending = false

local function ApplyAll()
    -- 战斗中动不了 secure 属性，标记一下等出战再补
    if InCombatLockdown() then
        pending = true
        return
    end
    pending = false

    for tab = 1, MAX_TABS do
        local container = _G["GwSpellbookContainerTab" .. tab]
        if container then
            ApplyPagingFix(container)
            if container.buttons then
                for _, btn in pairs(container.buttons) do
                    ApplyButtonFix(btn)
                end
            end
        end
    end
end

Spellbook.ApplyAll = ApplyAll

local hooked = false

local function HookRefreshPoints()
    if hooked then return end

    -- 法术书每次刷新（updateSpellbookTab）都会重设按钮属性和翻页 snippet，
    -- 所以得在刷新之后再补一遍。这里挂窗口显示时机——真正要点按钮时一定经过它。
    local spellbook = _G.GwSpellbook
    if spellbook then
        spellbook:HookScript("OnShow", ApplyAll)
    end
    for tab = 1, MAX_TABS do
        local container = _G["GwSpellbookContainerTab" .. tab]
        if container then
            container:HookScript("OnShow", ApplyAll)
        end
    end

    hooked = spellbook ~= nil
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
-- 这几个事件 GwSpellbookMenu 也在听，它注册得比我们早，所以它的刷新先跑、我们后补
f:RegisterEvent("SPELLS_CHANGED")
f:RegisterEvent("LEARNED_SPELL_IN_SKILL_LINE")
f:RegisterEvent("SKILL_LINES_CHANGED")
f:RegisterEvent("PLAYER_LEVEL_UP")

f:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_ENABLED" then
        if pending then ApplyAll() end
        return
    end

    HookRefreshPoints()
    ApplyAll()

    if event == "PLAYER_LOGIN" then
        -- 上游在 PLAYER_ENTERING_WORLD 里还有一次 C_Timer.After(0.1, updateSpellbookTab)，
        -- 那次刷新会把我们刚设好的属性重新盖掉，所以稍晚再补一遍。
        -- 这不是在猜插件加载时机，是在等上游那个已知的延时刷新。
        C_Timer.After(0.3, ApplyAll)
    end
end)
