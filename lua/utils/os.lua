local m = {}

local function is_win()
    return package.config:sub(1, 1) == "\\"
end
m.is_win = is_win

return m
