--- **AceLocale-3.0** 管理插件中的本地化，允许注册多个语言环境，并在未翻译的字符串中回退到基础语言环境。
-- @class file
-- @name AceLocale-3.0
-- @release $Id: AceLocale-3.0.lua 1284 2022-09-25 09:15:30Z nevcairiel $
local MAJOR,MINOR = "AceLocale-3.0", 6

local AceLocale, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

if not AceLocale then return end -- 不需要升级

-- Lua API
local assert, tostring, error = assert, tostring, error
local getmetatable, setmetatable, rawset, rawget = getmetatable, setmetatable, rawset, rawget

local gameLocale = GetLocale()
if gameLocale == "enGB" then
    gameLocale = "enUS"
end

AceLocale.apps = AceLocale.apps or {}          -- 数组，格式为 ["AppName"]=localetableref
AceLocale.appnames = AceLocale.appnames or {}  -- 数组，格式为 [localetableref]="AppName"

-- 此元表用于从 GetLocale 返回的所有表
local readmeta = {
    __index = function(self, key) -- 请求完全未知的条目：触发一个不中断的错误并返回键名
        rawset(self, key, key)      -- 确实只需要看到一次警告
        geterrorhandler()(MAJOR..": "..tostring(AceLocale.appnames[self])..": Missing entry for '"..tostring(key).."'")
        return key
    end
}

-- 如果 silent 标志为 true，此元表用于从 GetLocale 返回的所有表，它不会对未知的键发出警告
local readmetasilent = {
    __index = function(self, key) -- 请求完全未知的条目：返回键名
        rawset(self, key, key)      -- 只需要调用此函数一次
        return key
    end
}

-- 记住当前正在注册的语言表（由 :NewLocale() 设置）
-- 注意：绝对不要尝试同时注册 2 个语言表并混合它们的定义。
local registering

-- 局部 assert false 函数
local assertfalse = function() assert(false) end

-- 注册非默认语言环境时，使用此元表代理
local writeproxy = setmetatable({}, {
    __newindex = function(self, key, value)
        rawset(registering, key, value == true and key or value) -- 赋值：将 'true' 替换为键名字符串
    end,
    __index = assertfalse
})

-- 注册默认语言环境时，使用此元表代理。
-- 它拒绝覆盖已存在的值
-- 原因 1：允许以任意顺序加载语言环境
-- 原因 2：如果 2 个模块具有相同的字符串，但只有首先加载的模块具有当前语言环境的翻译，那么该翻译不会被覆盖。
--
local writedefaultproxy = setmetatable({}, {
    __newindex = function(self, key, value)
        if not rawget(registering, key) then
            rawset(registering, key, value == true and key or value)
        end
    end,
    __index = assertfalse
})

--- 为指定的应用程序注册新的语言环境（或扩展现有的语言环境）。
-- :NewLocale 将返回一个你可以填入语言环境的表，如果玩家的游戏语言环境不需要该语言，则返回 nil。
-- @paramsig application, locale[, isDefault[, silent]]
-- @param application 插件 / 模块的唯一名称
-- @param locale 要注册的语言环境名称，例如 "enUS", "deDE" 等。
-- @param isDefault 此语言环境是否为正在注册的默认语言环境（你的插件通常用这种语言编写，通常是 enUS）
-- @param silent 如果为 true，该语言环境不会针对缺失的键发出警告。必须在注册的第一个语言环境上设置。如果设置为 "raw"，未知键将返回 nil（不使用元表）。
-- @usage
-- -- enUS.lua
-- local L = LibStub("AceLocale-3.0"):NewLocale("TestLocale", "enUS", true)
-- L["string1"] = true
--
-- -- deDE.lua
-- local L = LibStub("AceLocale-3.0"):NewLocale("TestLocale", "deDE")
-- if not L then return end
-- L["string1"] = "Zeichenkette1"
-- @return 用于添加本地化的语言表，如果不需要当前语言环境则返回 nil。
function AceLocale:NewLocale(application, locale, isDefault, silent)

    -- GAME_LOCALE 允许翻译者在未安装特定 wow 客户端的情况下测试插件的翻译
    local activeGameLocale = GAME_LOCALE or gameLocale

    local app = AceLocale.apps[application]

    if silent and app and getmetatable(app) ~= readmetasilent then
        geterrorhandler()("Usage: NewLocale(application, locale[, isDefault[, silent]]): 'silent' must be specified for the first locale registered")
    end

    if not app then
        if silent=="raw" then
            app = {}
        else
            app = setmetatable({}, silent and readmetasilent or readmeta)
        end
        AceLocale.apps[application] = app
        AceLocale.appnames[app] = application
    end

    if locale ~= activeGameLocale and not isDefault then
        return -- 无操作，我们不需要这些翻译
    end

    registering = app -- 全局记住以用于 writeproxy 和 writedefaultproxy

    if isDefault then
        return writedefaultproxy
    end

    return writeproxy
end

--- 返回当前语言环境的本地化文本（如果缺少翻译，则返回默认语言环境文本）。
-- 如果未注册任何内容则报错（应责怪开发者，这不仅仅是缺少翻译）
-- @param application 插件 / 模块的唯一名称
-- @param silent 如果为 true，则语言环境是可选的，找不到时会静默返回 nil（默认为 false，可选）
-- @return 当前语言的语言表。
function AceLocale:GetLocale(application, silent)
    if not silent and not AceLocale.apps[application] then
        error("Usage: GetLocale(application[, silent]): 'application' - No locales registered for '"..tostring(application).."'", 2)
    end
    return AceLocale.apps[application]
end
