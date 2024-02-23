return {
	{
		"sourproton/tunnell.nvim",
		-- dir = '/home/sourproton/tunnell.nvim',
		-- dev = true,
		config = true,
		keys = {
			{ "<leader>st", ":TunnellCell<CR>", mode = { "n" }, desc = "Tunnell cell" },
			{ "<leader>st", ":TunnellRange<CR>", mode = { "v" }, desc = "Tunnell range" },
			{ "<leader>sc", ":TunnellConfig<CR>", mode = { "n" }, desc = "Tunnell config" },
		},
		cmd = {
			"TunnellCell",
			"TunnellRange",
			"TunnellConfig",
		},
	},
}
