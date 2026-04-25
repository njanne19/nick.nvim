return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "]h", gs.next_hunk,            opts)
                vim.keymap.set("n", "[h", gs.prev_hunk,            opts)
                vim.keymap.set("n", "<leader>gs", gs.stage_hunk,   opts)
                vim.keymap.set("n", "<leader>gr", gs.reset_hunk,   opts)
                vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
                vim.keymap.set("n", "<leader>gb", gs.blame_line,   opts)
                vim.keymap.set("n", "<leader>gd", gs.diffthis,     opts)
            end,
        })
    end,
}
