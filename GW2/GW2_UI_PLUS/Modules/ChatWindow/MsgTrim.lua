local _, addonTable = ...
local function utf8bytes(bs, offset)
    local b = bs[offset]
    if b < 128 then
        return 1
    end
    if b <= 192 then
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
local function msg_split(msg, arr)
    local bs = {string.byte(msg, 1, -1)}
    local i = 1
    arr = arr or {}
    while i <= #bs do
        local n = utf8bytes(bs, i)
        if n == 0 then
            return nil
        end
        local item_link = false
        if n == 1 and (#bs - i) > 12 and bs[i] == 0x7c and bs[i + 1] == 0x63 then
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
                    if bs[j] == 0x7c and bs[j + 1] == 0x72 then
                        end_idx = j
                    end
                end
                if end_idx > 0 then
                    if item_link then
                        table.insert(arr, string.sub(msg, i, end_idx + 1))
                        i = end_idx + 2
                    else
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
local function trim_rchars(cs)
    local _cs = {}
    local lastc = ''
    local rn = 0
    local force = false
    for _, c in ipairs(cs) do
        if force then
            lastc = c
            table.insert(_cs, c)
        elseif lastc == '|' and c == 'c' then
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
            else
                rn = 0
                lastc = c
                table.insert(_cs, c)
            end
        else
            rn = rn + 1
            if rn < 4 then
                if not is_symbol(c) then
                    table.insert(_cs, c)
                end
            end
        end
    end
    return _cs
end
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
    if #cs1 ~= #cs2 then
        cs2 = trim_rchars(cs2)
    end
    return (len - #cs2), table.concat(cs2)
end
addonTable.ChatMsgTrim = TrimMessage
