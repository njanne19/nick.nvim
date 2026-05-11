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

-- Split navigation (leader+w+hjkl)
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Toggle inlay hints
vim.keymap.set("n", "<leader>uh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" }) 

-- Diagnostics quick fix list
vim.keymap.set('n', '<leader>x', vim.diagnostic.setqflist, { desc = 'Open diagnostic quickfix list' })
