return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
        })
        vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end,
}
