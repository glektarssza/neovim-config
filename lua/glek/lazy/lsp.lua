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
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })
        vim.lsp.config("jsonls", {
            capabilities = capabilities,
        })
        vim.lsp.config("cmake", {
            capabilities = capabilities,
        })
        vim.lsp.config("clangd", {
            capabilities = capabilities,
        })
        vim.lsp.config("denols", {
            capabilities = capabilities,
        })
        vim.lsp.config("yamlls", {
            capabilities = capabilities,
        })
        vim.lsp.config("bashls", {
            capabilities = capabilities,
        })
        vim.lsp.config("html", {
            capabilities = capabilities,
        })
        vim.lsp.config("lua_ls", {
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
        vim.lsp.config("ols", {
            capabilities = capabilities,
        })
        vim.lsp.config("omnisharp", {
            capabilities = capabilities,
        })
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
        })
        vim.lsp.config("wgsl_analyzer", {
            capabilities = capabilities,
        })
        vim.lsp.config("cmake", {
            capabilities = capabilities,
        })
        vim.lsp.config("awk_ls", {
            capabilities = capabilities,
        })
        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })
        vim.lsp.config("dockerls", {
            capabilities = capabilities,
        })
        vim.lsp.config("eslint", {
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })
        vim.lsp.config("pug", {
            capabilities = capabilities,
        })
        vim.lsp.config("ruby_lsp", {
            capabilities = capabilities,
        })
        local sysname = vim.uv.os_uname().sysname
        local home = nil
        if sysname:match("^Windows") ~= nil then
            home = os.getenv("USERPROFILE")
        else
            home = os.getenv("HOME")
        end
        if home ~= nil then
            vim.lsp.config("powershell_es", {
                bundle_path = home .. "/repositories/github/PowerShell/PowerShellEditorServices/module",
            })
        end
        vim.lsp.config("gh_actions_ls", {
            capabilities = capabilities,
        })
        vim.lsp.config("jqls", {
            capabilities = capabilities,
        })
    end,
}
