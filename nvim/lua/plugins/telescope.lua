return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = "preview_scrolling_up",
							["<C-e>"] = "preview_scrolling_down",
						},
					},
				},
			})

			-- keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
			vim.keymap.set("n", "<leader>fg", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find" })
			vim.keymap.set("n", "<leader>fG", builtin.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "grep string" })
			vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "commands" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "references" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
			vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "treesitter" })

			-- this will load fzf_native and have it override the default file sorter
			telescope.load_extension("fzf")

			telescope.load_extension("ui-select")
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
