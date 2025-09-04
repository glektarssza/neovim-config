local m = {}

--- Check if the given path is accessible.
--- @param path string The path to check.
--- @param access string A combination of `r`, `w`, and/or `x` indicating the accesses to check for.
--- @return boolean | nil result Whether the path was accessible or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function can_access(path, access)
    return vim.uv.fs_access(path, access)
end
m.can_access = can_access

--- Check if the given path exists.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function exists(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return true, stat_err
end
m.exists = exists

--- Check if the given path exists and is a directory.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a directory or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_directory(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "directory", stat_err
end
m.is_directory = is_directory

--- Check if the given path exists and is a file.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a file or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_file(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "file", stat_err
end
m.is_file = is_file

--- Check if the given path exists and is a link.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a link or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_link(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "link", stat_err
end
m.is_link = is_link

--- Check if the given path exists and is a FIFO special file.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a FIFO special file or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_fifo(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "fifo", stat_err
end
m.is_fifo = is_fifo

--- Check if the given path exists and is a socket special file.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a socket special file or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_socket(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "socket", stat_err
end
m.is_socket = is_socket

--- Check if the given path exists and is a character special device.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a character special device or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_char_device(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "char", stat_err
end
m.is_char_device = is_char_device

--- Check if the given path exists and is a block special device.
--- @param path string The path to check.
--- @return boolean | nil result Whether the path exists and is a block special device or `nil` if an error occurred.
--- @return string | nil err What error occurred, if any.
--- @return string | nil err What error occurred, if any.
local function is_block_device(path)
    local access, access_err = m.can_access(path, "r")
    if not access then
        return nil, access_err
    end
    local stat, stat_err = vim.uv.fs_lstat(path)
    if not stat then
        return false, stat_err
    end
    return stat.type == "block", stat_err
end
m.is_block_device = is_block_device

return m
