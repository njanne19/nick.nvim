vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i-ci-ve:block-blinkwait300-blinkon200-blinkoff150"

-- Highlight when you yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- WSL compat for system clipboard yank
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ["+"] = "wl-copy",
      ["*"] = "wl-copy",
    },
    paste = {
      ['+'] = 'wl-paste --no-newline',
      ['*'] = 'wl-paste --no-newline',
    },
    cache_enabled = 0,
  }
end
