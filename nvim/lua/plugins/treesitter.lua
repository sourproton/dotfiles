-- obs: code below overwrites
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "cpp",
                "help",
                "html",
                "json",
                "jsonc",
                "julia",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "toml",
                "vim",
                "yaml",
            },
        },
    },
}
