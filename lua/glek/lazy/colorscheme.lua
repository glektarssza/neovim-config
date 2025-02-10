return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            options = {
                transparency = true,
                terminal_colors = true,
                lualine_transparency = false,
                highlight_inactive_windows = true,
            },
            highlights = {
                Comments = {
                    italic = true,
                },
            },
        })
        vim.cmd.colorscheme("onedark")
    end,
}
