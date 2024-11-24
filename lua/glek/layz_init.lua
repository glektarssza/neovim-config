local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazyPath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazyPath,
  })
end
vim.opt.rtp:prepend(lazyPath)

require("lazy").setup({
    spec = "glek.lazy",
    change_detection = { notify = false }
})
