return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- will be automatically installed with mason and loaded with lspconfig
                pyright = {},
                julials = {
                    mason = false,
                },
                rust_analyzer = {},
            },
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
}
