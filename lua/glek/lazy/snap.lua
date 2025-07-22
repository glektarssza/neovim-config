local paths = require("utils.paths")

--- Get the title of the current buffer.
--- @return string title The title of the current buffer.
local function get_window_title()
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
end

return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
        theme = "Ayu Mirage",
        font = "RobotoMono Nerd Font Mono=24;SauceCodePro Nerd Font Mono=24;DroidSansM Nerd Font Mono=24",
        background = "#FFFFFF00",
        no_round_corner = true,
        shadow_blur_radius = 0,
        shadow_offset_x = 0,
        shadow_offset_y = 0,
        shadow_color = "#FFFFFF00",
        pad_horiz = 0,
        pad_vert = 0,
        line_offset = 1,
        window_title = get_window_title,
        wslclipboard = "auto",
        wslclipboardcopy = "delete",
        output = function()
            local save_name = string.gsub(get_window_title(), '%.', "_") ..
                "_" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
            local save_path = vim.fs.normalize(vim.fs.joinpath(paths.get_user_home_dir(), "code_snaps"))
            if paths.is_directory(save_path) then
                return vim.fs.joinpath(save_path, save_name)
            elseif not paths.exists(save_path) then
                vim.fn.mkdir(save_path, "p")
                return vim.fs.joinpath(save_path, save_name)
            end
            return save_name
        end,
    },
}
