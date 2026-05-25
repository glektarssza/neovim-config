local m = {}

function m.live_grep_from_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")

        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end

    local opts = {}

    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end

    require("telescope.builtin").live_grep(opts)
end

function m.find_files_from_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
    end
    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end
    local opts = {}
    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end
    require("telescope.builtin").find_files(opts)
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "wsl -exec bash -c 'CC=x86_64-w64-mingw32-gcc make'" },
        -- Optional but a good idea
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-u>"] = false,
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "fd", "--type", "f", "-strip-cwd-prefix" },
                    },
                    git_files = {},
                    git_commits = {},
                    git_branches = {},
                    git_status = {},
                    git_stash = {},
                    live_grep = {},
                    command_history = {},
                    help_tags = {},
                    lsp_references = {},
                    lsp_incoming_calls = {},
                    ls_outgoing_calls = {},
                    lsp_document_symbols = {},
                    lsp_workspace_symbols = {},
                    diagnostics = {},
                    lsp_implementations = {},
                    lsp_type_definitions = {},
                    treesitter = {},
                },
                extensions = {
                    nerdy = {},
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim",
                },
            },
        })
    end,
}
