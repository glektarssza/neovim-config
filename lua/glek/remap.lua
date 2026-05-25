local wk = require("which-key")
local function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
wk.add({
    "<C-a>d",
    [[<C-\><C-n>]],
    desc = "Escape terminal mode",
    noremap = true,
    mode = "t",
})
