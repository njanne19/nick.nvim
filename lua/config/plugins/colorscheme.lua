-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavor = "mocha",
--             transparent_background = true,
-- 		})
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
return { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = function() 
        require("gruvbox").setup({})
        vim.cmd.colorscheme("gruvbox")
    end,
}
