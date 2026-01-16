vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = "??"
vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

require("glek.lazy_init")
require("glek.remap")
require("glek.set")
require("glek.cmds")
require("glek.filetypes")
