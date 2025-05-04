return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "nvim-lua/plenary.nvim",
        "onsails/lspkind.nvim",
        "nvim-web-devicons",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_kinds = {
            Text = "  ",
            Method = "  ",
            Function = "  ",
            Constructor = "  ",
            Field = "  ",
            Variable = "  ",
            Class = "  ",
            Interface = "  ",
            Module = "  ",
            Property = "  ",
            Unit = "  ",
            Value = "  ",
            Enum = "  ",
            Keyword = "  ",
            Snippet = "  ",
            Color = "  ",
            File = "  ",
            Reference = "  ",
            Folder = "  ",
            EnumMember = "  ",
            Constant = "  ",
            Struct = "  ",
            Event = "  ",
            Operator = "  ",
            TypeParameter = "  ",
        }
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-s>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                },
                {
                    name = "vsnip",
                },
            }, {
                {
                    name = "buffer",
                },
            }),
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
                    return vim_item
                end,
            },
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
        require("lspconfig")["lua_ls"].setup({
            capabilities = capabilities,
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = "Disable",
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    },
                })
            end,
            settings = {
                Lua = {},
            },
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
        require("lspconfig")["cmake"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["awk_ls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["cssls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["dockerls"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["eslint"].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })
        require("lspconfig")["pug"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["ruby_lsp"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["rust_analyzer"].setup({
            capabilities = capabilities,
        })
        require("lspconfig")["powershell_es"].setup({
            bundle_path = vim.env.USERPROFILE .. "/repositories/github/PowerShell/PowerShellEditorServices/module",
        })
        require("lspconfig")["gh_actions_ls"].setup({
            capabilities = capabilities,
        })
    end,
}
