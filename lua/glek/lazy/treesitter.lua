return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "html",
            },
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            refactor = {
                enabled = true,
                highlight_current_scope = {
                    enabled = true,
                },
                smart_rename = {
                    enabled = true,
                    keymaps = {
                        smart_rename = "grr",
                    },
                },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>",
                    },
                },
            },
        })
    end,
}
