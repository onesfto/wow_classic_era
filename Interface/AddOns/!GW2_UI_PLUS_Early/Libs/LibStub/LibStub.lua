-- $Id: LibStub.lua 76 2007-09-03 01:50:17Z mikk $
-- LibStub 是一个用于库的简单版本控制存根。更多信息请见 http://www.wowace.com/wiki/LibStub
-- LibStub 现已进入公共领域 (Public Domain)
-- 贡献者: Kaelten, Cladhaire, ckknight, Mikk, Ammo, Nevcairiel, joshborke
local LIBSTUB_MAJOR, LIBSTUB_MINOR = "LibStub", 2  -- 绝对不要将此设置为 SVN 修订版！它必须在所有代码库中可用！
local LibStub = _G[LIBSTUB_MAJOR]

-- 检查当前存根的版本是否已过时
if not LibStub or LibStub.minor < LIBSTUB_MINOR then
    LibStub = LibStub or {libs = {}, minors = {} }
    _G[LIBSTUB_MAJOR] = LibStub
    LibStub.minor = LIBSTUB_MINOR

    -- LibStub:NewLibrary(major, minor)
    -- major (string) - 库的主版本号
    -- minor (string or number) - 库的次版本号
    --
    -- 如果已存在较新或相同版本的库，则返回 nil
    -- 如果需要更新，则返回空库对象或旧库对象
    function LibStub:NewLibrary(major, minor)
        assert(type(major) == "string", "Bad argument #2 to `NewLibrary' (string expected)")
        minor = assert(tonumber(strmatch(minor, "%d+")), "Minor version must either be a number or contain a number.")

        local oldminor = self.minors[major]
        if oldminor and oldminor >= minor then return nil end
        self.minors[major], self.libs[major] = minor, self.libs[major] or {}
        return self.libs[major], oldminor
    end

    -- LibStub:GetLibrary(major, [silent])
    -- major (string) - 库的主版本号
    -- silent (boolean) - 如果为 true，则库是可选的，找不到时会静默返回 nil
    --
    -- 如果找不到库且未设置 silent，则抛出错误
    -- 如果找到库，则返回该库对象
    function LibStub:GetLibrary(major, silent)
        if not self.libs[major] and not silent then
            error(("Cannot find a library instance of %q."):format(tostring(major)), 2)
        end
        return self.libs[major], self.minors[major]
    end

    -- LibStub:IterateLibraries()
    --
    -- 返回当前已注册库的迭代器
    function LibStub:IterateLibraries()
        return pairs(self.libs)
    end

    setmetatable(LibStub, { __call = LibStub.GetLibrary })
end
