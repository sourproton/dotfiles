return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")
			gruvbox.setup({
				transparent_mode = true,
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
