vim.pack.add({
    { src = "https://github.com/jbyuki/venn.nvim" },
})

local function toggle_venn()
    if vim.b.venn_enabled then
        -- Disable Venn mode
        vim.b.venn_enabled = false

        -- Restore previous virtualedit setting
        vim.opt_local.virtualedit = vim.b.venn_old_virtualedit or ""

        -- Remove temporary Venn mappings
        vim.keymap.del("n", "H", { buffer = true })
        vim.keymap.del("n", "J", { buffer = true })
        vim.keymap.del("n", "K", { buffer = true })
        vim.keymap.del("n", "L", { buffer = true })
        vim.keymap.del("v", "f", { buffer = true })

        print("Venn mode disabled")
    else
        -- Enable Venn mode
        vim.b.venn_enabled = true

        -- Save current virtualedit BEFORE changing it
        vim.b.venn_old_virtualedit = vim.opt_local.virtualedit:get()

        vim.opt_local.virtualedit = "all"

        -- Draw lines
        vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", {
            buffer = true,
            silent = true,
        })

        vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", {
            buffer = true,
            silent = true,
        })

        vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", {
            buffer = true,
            silent = true,
        })

        vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", {
            buffer = true,
            silent = true,
        })

        -- Draw a box around a visual selection
        vim.keymap.set("v", "f", ":VBox<CR>", {
            buffer = true,
            silent = true,
        })

        print("Venn mode enabled")
    end
end

vim.keymap.set("n", "<leader>v", toggle_venn, {
    desc = "Toggle Venn diagram mode",
})
