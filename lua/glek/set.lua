-- Set color scheme
vim.cmd.colorscheme("onedark")

-- Set system keyboard for yank
vim.opt.clipboard = "unnamedplus"

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

if vim.opt.modifiable then
    -- Force Unix file mode
    vim.opt.fileformat = "unix"
end

-- Fix end of lines
vim.opt.fixeol = true
