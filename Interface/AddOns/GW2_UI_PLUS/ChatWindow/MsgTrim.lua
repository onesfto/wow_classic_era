-- GW2_UI_PLUS 重复内容裁减
--
-- 整文件搬迁自 CChatFilter/msgtrim.lua（第三方插件，本机 Interface/AddOns/CChatFilter）。
-- 算法逐字保留，只把原来的全局函数 bff_msg_split / bfwf_trim_message 收成局部，
-- 出口改挂 addonTable.ChatMsgTrim，避免和 CChatFilter 本体抢全局名——
-- 两个插件同时开着也各跑各的。
--
-- 干三件事：
--   1. 叠字：连续重复的数字/字母/汉字留两个，重复的符号全去掉，符号后的空格去掉
--   2. 叠句：找出前后重复的最大文字块删掉（反复跑到不再变化为止）
--   3. 物品链接和颜色码整体保护，不会被拆坏

local _, addonTable = ...

local function utf8bytes(bs, offset)
    local b = bs[offset]
    if b < 128 then
        return 1
    end

    if b <= 192 then  -- 非法 utf8 序列
        return 0
    end
    local bvs = {128, 64, 32, 16, 8, 4}
    for i = 1, #bvs do
        b = b - bvs[i]
        if b < 0 then
            return i - 1
        end
    end

    return 0
end

-- 字符串拆成字数组
local function msg_split(msg, arr)
    local bs = {string.byte(msg, 1, -1)}
    local i = 1
    arr = arr or {}
    while i <= #bs do
        local n = utf8bytes(bs, i)
        if n == 0 then
            return nil
        end
        -- 物品链接作为一个整体
        -- 非物品链接的彩色文字，颜色标识单独提取出来
        -- 物品链接基本样式：|cffaabbcc|Hitem::::::::::::::|h[]|h|r
        local item_link = false
        if n == 1 and (#bs - i) > 12 and bs[i] == 0x7c and bs[i + 1] == 0x63 then  -- |c 开头，物品链接或彩色文字
            local start = i + 10
            local color = true
            for j = i + 2, i + 9 do
                if bs[j] < 48 then
                    color = false
                    break
                elseif bs[j] > 57 and bs[j] < 65 then
                    color = false
                    break
                elseif bs[j] > 70 and bs[j] < 97 then
                    color = false
                    break
                elseif bs[j] > 102 then
                    color = false
                    break
                end
            end

            if not color then
                table.insert(arr, '|c')
                i = i + 2
            else
                if string.sub(msg, i + 10, i + 15) == '|Hitem' then
                    start = i + 16
                    item_link = true
                end
                local end_idx = 0

                for j = start, #bs - 1 do
                    if end_idx > 0 then
                        break
                    end
                    if bs[j] == 0x7c and bs[j + 1] == 0x72 then -- 结束 |r
                        end_idx = j
                    end
                end
                if end_idx > 0 then
                    if item_link then   -- 物品链接作为一个整体
                        table.insert(arr, string.sub(msg, i, end_idx + 1))
                        i = end_idx + 2
                    else -- 颜色标识符作为一个整体
                        table.insert(arr, string.sub(msg, i, i + 9))
                        i = i + 10
                    end
                else
                    table.insert(arr, string.sub(msg, i, i + 9))
                    i = i + 10
                end
            end
        else
            table.insert(arr, string.sub(msg, i, i + n - 1))
            i = i + n
        end
    end

    return arr
end

local function is_symbol(c)
    local cv = string.byte(c)
    if not cv then
        return false
    end
    if cv < 48 then
        return true
    end

    if cv > 57 and cv < 65 then
        return true
    end

    if cv > 90 and cv < 97 then
        return true
    end

    if cv > 122 and cv < 128 then
        return true
    end

    return false
end

-- 叠字过滤
local function trim_rchars(cs)
    local _cs = {}
    local lastc = ''
    local rn = 0
    local force = false
    for _, c in ipairs(cs) do
        if force then
            lastc = c
            table.insert(_cs, c)
        elseif lastc == '|' and c == 'c' then -- 颜色表达式(|cffff0000 |r)的处理
            lastc = c
            table.insert(_cs, c)
            force = true
        elseif lastc == '|' and c == 'r' then
            lastc = c
            table.insert(_cs, c)
            force = false
        elseif lastc ~= c then
            rn = 1
            if is_symbol(lastc) and c == ' ' then
                -- 符号后面的空格直接不要
            else
                rn = 0
                lastc = c
                table.insert(_cs, c)
            end
        else
            rn = rn + 1
            if rn < 4 then
                -- 数字、字母、中文留两个
                if not is_symbol(c) then
                    table.insert(_cs, c)
                end
            end
        end
    end

    return _cs
end

-- 叠句过滤
-- 处理方法
-- 两张纸条内容一样，一上一下
-- 上方的纸条不动，向右滑动下方的纸条
-- 在两张纸条重叠处找出文字相同的最大区域，删除上方纸条该区域的文字
-- xabcdefxabcdefxxxx
--        xabcdefxabcdefxxxx
local function trim_rsentence(cs)
    local total = #cs
    if total < 15 then
        return cs
    end

    local fin = false
    for i = 10, total - 10 do
        if fin then
            break
        end
        local nm = 0
        local start = 1
        for j = 1, total - 10 do
            if fin then
                break
            end
            if cs[j] == cs[i + j] then
                nm = nm + 1
            else
                if nm > 4 then
                    for _ = 1, nm do
                        table.remove(cs, i + start)
                    end
                    fin = true
                end
                start = j + 1
                nm = 0
            end
        end
    end

    return cs
end

-- 返回 (裁掉的字数, 处理后的消息)。裁不动就原样返回，字数为 0。
local function TrimMessage(msg)
    if not msg then
        return 0, msg
    end

    local cs = msg_split(msg)
    if not cs then
        return 0, msg
    end

    local len = #cs
    local cs1 = trim_rchars(cs)
    local n = #cs1
    local cs2 = trim_rsentence(cs1)
    while n ~= #cs2 do
        n = #cs2
        cs2 = trim_rsentence(cs2)
    end

    if #cs == #cs2 then
        return 0, msg
    end

    if #cs1 ~= #cs2 then    -- 叠句过滤后可能会产生叠字
        cs2 = trim_rchars(cs2)
    end

    return (len - #cs2), table.concat(cs2)
end

addonTable.ChatMsgTrim = TrimMessage
