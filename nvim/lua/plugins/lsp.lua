return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        julials = {},
        rust_analyzer = {},
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          require("null-ls").builtins.formatting.autopep8,
        },
      },
    },
  },
}
