return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                },
            }, {
                {
                    name = "buffer",
                },
            }),
        })
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                {
                    name = "git",
                },
            }, {
                {
                    name = "buffer",
                },
            }),
        })
        require("cmp_git").setup()

        cmp.setup.cmdline({
            "/",
            "?",
        }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {
                    name = "buffer",
                },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {
                    name = "path",
                },
            }, {
                {
                    name = "cmdline",
                },
            }),
            matching = {
                disallow_symbol_nonprefix_matching = false,
            },
        })
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")["ts_ls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["jsonls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["gh_action_ls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["cmake"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["clangd"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["denols"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["yamlls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["bashls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["html"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["ols"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["omnisharp"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["rust_analyzer"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["wgsl_analyzer"].setup({
            capabilities = capabilities,
        })
    end,
}
