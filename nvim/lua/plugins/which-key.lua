return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local which_key = require("which-key")
			which_key.setup({})
			which_key.register({
				f = { name = "+telescope" },
				l = { name = "+LSP" },
				t = { name = "+neotree" },
				s = { name = "+tunnell" },
			}, { prefix = "<leader>" })
		end,
	},
}
