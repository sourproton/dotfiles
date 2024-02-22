return {
	{
		"sourproton/tunnell.nvim",
		-- dir = '/home/sourproton/tunnell.nvim',
		-- dev = true,
		config = true,
		keys = {
			{ "<leader>tt", ":TunnellCell<CR>", mode = { "n" }, desc = "Tunnell cell" },
			{ "<leader>tt", ":TunnellRange<CR>", mode = { "v" }, desc = "Tunnell range" },
			{ "<leader>tc", ":TunnellConfig<CR>", mode = { "n" }, desc = "Tunnell config" },
		},
		cmd = {
			"TunnellCell",
			"TunnellRange",
			"TunnellConfig",
		},
	},
}
