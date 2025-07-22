local function is_win()
    return package.config:sub(1, 1) == "\\"
end

local function get_path_separator()
    if is_win() then
        return "\\"
    end
    return "/"
end

local function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    if is_win() then
        str = str:gsub("/", "\\")
    end
    return str:match("(.*" .. get_path_separator() .. ")")
end

local function nvim_user_root()
    return vim.fs.normalize(vim.fs.joinpath(script_path(), ".."))
end

return {
    "SergioRibera/codeshot.nvim",
    config = function()
        vim.print(vim.fs.normalize(vim.fs.joinpath(nvim_user_root(), "ayu-mirage.tmTheme")))
        require("codeshot").setup({
            use_current_theme = false,
            theme = vim.fs.normalize(vim.fs.joinpath(nvim_user_root(), "ayu-mirage.tmTheme")),
            background = "#FFFFFF00",
            radius = 15,
            padding_x = 0,
            padding_y = 0,
            window_controls = true,
        })
    end,
}
