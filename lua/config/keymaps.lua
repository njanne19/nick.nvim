vim.g.mapleader = " "

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move visual block up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remove weird carrage return at the end of some pastes
vim.keymap.set("n", "<leader>cr", ":%s/\\r//g<CR>", { desc = "Remove ^M carriage returns" })

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>",     { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprev<CR>",     { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })

-- Split resizing (Ctrl+hjkl)
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>",  { desc = "Resize split left" })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>",  { desc = "Resize split right" })
vim.keymap.set("n", "<C-k>", ":resize -2<CR>",           { desc = "Resize split up" })
vim.keymap.set("n", "<C-j>", ":resize +2<CR>",           { desc = "Resize split down" })
