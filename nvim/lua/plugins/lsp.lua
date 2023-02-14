return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- will be automatically installed with mason and loaded with lspconfig
                pyright = {
                    mason = false,
                },
                julials = {
                    -- LanguageServer.jl installed manually
                    -- location: ~/.julia/environments/nvim-lspconfig/
                    -- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
                    -- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.update()'
                    -- julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.instantiate()'
                    mason = false,
                },
                -- rust_analyzer = {
                --     -- rust-analyzer installed with rustup
                --     -- rustup component add rust-analyzer
                --     mason = false,
                --     cmd = {
                --         "rustup", "run", "stable", "rust-analyzer"
                --     },
                -- },
            },
        },
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            server = {
                -- rust-analyzer installed with rustup
                -- rustup component add rust-analyzer
                cmd = {
                    "rustup", "run", "stable", "rust-analyzer",
                },
                -- on_attach = function(_, bufnr)
                --     local rt = require("rust-tools")
                --     -- Hover actions
                --     vim.keymap.set("n", "<leader>ch", rt.hover_actions.hover_actions, { buffer = bufnr })
                --     -- Code action groups
                --     -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                -- end,
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
