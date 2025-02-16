vim.g.mapleader = " "
vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

require("glek.lazy_init")
require("glek.remap")
require("glek.set")
require("glek.cmds")
