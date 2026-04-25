return { 
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = { "%.git/", "node_modules" },
            },
            extensions = {
                fzf = {}
            },
        })

        telescope.load_extension("fzf")

        -- Keymaps
        vim.keymap.set("n", "<leader>sf", builtin.find_files,  { desc = "Find files" })
        vim.keymap.set("n", "<leader> ",  builtin.find_files,  { desc = "Find files" }) 
        vim.keymap.set("n", "<leader>sg", builtin.live_grep,   { desc = "Live grep" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers,     { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags,   { desc = "Help tags" })
        vim.keymap.set("n", "<leader>sr", builtin.oldfiles,    { desc = "Recent files" })
    end,
}
