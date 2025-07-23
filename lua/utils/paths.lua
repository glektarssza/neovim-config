local os = require("utils.os")

local m = {}

--- Get the path separator used on this operating system.
--- @return string sep The path separator used on this operating system.
local function get_path_separator()
    if os.is_win() then
        return "\\"
    end
    return "/"
end
m.get_path_separator = get_path_separator

--- Get the path to the currently executing script.
--- @return string path The path to the currently executing script.
local function get_script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    if os.is_win() then
        str = str:gsub("/", "\\")
    end
    return str:match("(.*" .. m.get_path_separator() .. ")")
end
m.get_script_path = get_script_path

--- Get the path to script directory for the given user.
--- @param user string The user to get the script directory for.
--- @return string path The path to script directory for the given user.
local function get_user_script_dir(user)
    return vim.fs.normalize(vim.fs.joinpath(m.get_script_path(), "..", user))
end
m.get_user_script_dir = get_user_script_dir

--- Check whether a path exists.
--- @param path string The path to check.
--- @return boolean result Whether the path exists.
local function exists(path)
    return vim.uv.fs_stat(path) ~= nil
end
m.exists = exists

--- Check whether a path exists and is a directory.
--- @param path string The path to check.
--- @return boolean result Whether the path exists and is a directory.
local function is_directory(path)
    return m.exists(path) and vim.uv.fs_stat(path).type == "directory"
end
m.is_directory = is_directory

--- Check whether a path exists and is a file.
--- @param path string The path to check.
--- @return boolean result Whether the path exists and is a file.
local function is_file(path)
    return m.exists(path) and vim.uv.fs_stat(path).type == "file"
end
m.is_file = is_file

return m
