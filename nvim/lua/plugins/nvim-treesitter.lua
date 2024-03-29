return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"arduino",
					"bash",
					"c",
					"cpp",
					"fortran",
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"javascript",
					"julia",
					"latex",
					"lua",
					"luadoc",
					"markdown",
					"matlab",
					"python",
					"rust",
					"toml",
					"typst",
					"vim",
					"vimdoc",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
