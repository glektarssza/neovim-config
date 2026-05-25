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
wk.add({
    "<Esc>",
    function()
        vim.notify("Sent termianl escape sequence!")
    end,
    desc = "Escape terminal mode",
    noremap = true,
    mode = "n",
})
