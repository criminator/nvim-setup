-- Depends on nvim-treesitter and mini.nvim, both installed in init.lua
vim.pack.add({
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})
require("render-markdown").setup({
    render_modes = true,

    latex = {
        enabled = true,
        render_modes = true,
        converter = { "utftex", "latex2text" },
    },
})
