local m = {}

--- Check if the current operating system is Windows.
--- @return boolean result `true` if the current operating system is Windows, `false` otherwise.
local function is_win()
    return vim.uv.os_uname().sysname == "Windows_NT"
end
m.is_win = is_win

--- Check if the current operating system is Linux.
--- @return boolean result `true` if the current operating system is Linux, `false` otherwise.
local function is_linux()
    return vim.uv.os_uname().sysname == "Linux"
end
m.is_linux = is_linux

--- Get a variable from the user environment.
--- @param name string The name of the variable to get.
--- @return string | nil result The value of the variable or `nil` if the variable does not exist.
--- @return string | nil err The error that occurred if the variable could not be fetched.
--- @return uv.error_name | nil err_name The name of the error that occurred if the variable could not be fetched.
local function get_env_var(name)
    return vim.uv.os_getenv(name)
end
m.get_env_var = get_env_var

--- Get the home directory of the current user.
--- @return string | nil result The home directory of the current user.
--- @return string | nil err The error that occurred while fetching the home directory of the current user.
--- @return uv.error_name | nil err_name The name of the error that occurred while fetching the home directory of the current user.
local function get_user_home_dir()
    return vim.uv.os_homedir()
end
m.get_user_home_dir = get_user_home_dir

return m
