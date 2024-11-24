return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "html"
            },
            sync_install = false,
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}
