return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"arduino_language_server",
					"bashls",
					"clangd",
					"fortls",
					"tsserver",
					"julials",
					"ltex",
					"lua_ls",
					"marksman",
					"matlab_ls",
					"pyright",
					"rust_analyzer",
					"taplo",
					"typst_lsp",
					"vimls",
					"yamlls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.arduino_language_server.setup({})
			lspconfig.bashls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.fortls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.julials.setup({})
			lspconfig.ltex.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.matlab_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.taplo.setup({})
			lspconfig.typst_lsp.setup({})
			lspconfig.vimls.setup({})
			lspconfig.yamlls.setup({})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "open float" })
			vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_prev, { desc = "next diag" })
			vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_next, { desc = "prev diag" })

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set(
						"n",
						"<leader>ld",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "go to definition" }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "hover" })
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<leader>la",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "code actions" }
					)
					vim.keymap.set("n", "<leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = ev.buf, desc = "format" })
					vim.keymap.set("n", "<leader>lh", function()
						vim.lsp.inlay_hint.enable(ev.buf, not vim.lsp.inlay_hint.is_enabled())
					end, { buffer = ev.buf, desc = "inlay hints" })
				end,
			})
		end,
	},
}
