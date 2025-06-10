-- Set color scheme
vim.cmd.colorscheme("onedark")

-- Set clipboard provider based on system
vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("win32yank.exe") == 1 then
        vim.g.clipboard = "win32yank"
    else
        vim.g.clipboard = {
            name = "WslClipboard",
            copy = {
                ["+"] = "clip.exe",
                ["*"] = "clip.exe",
            },
            paste = {
                ["+"] =
                "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
                ["*"] =
                "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
            },
            cache_enabled = 0
        }
    end
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.g.clipboard = "clip"
end

-- Use line numbers
vim.opt.nu = true

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable wrapping
vim.opt.wrap = false

-- Enable incremental searching
vim.opt.incsearch = true

-- Enable terminal GUI colors
vim.opt.termguicolors = true

if not vim.opt.modifiable then
    -- Force Unix file mode
    vim.opt.fileformat = "unix"
end

-- Fix end of lines
vim.opt.fixeol = true
