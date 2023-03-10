return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            sort_case_insensitive = true,
            window = {
                mappings = {
                    ["-"] = "open_split",
                    ["|"] = "open_vsplit",
                },
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = function(...)
                            return require("telescope.actions").move_selection_next(...)
                        end,
                        ["<C-k>"] = function(...)
                            return require("telescope.actions").move_selection_previous(...)
                        end,
                    },
                },
            },
        },
    },
    {
        "folke/which-key.nvim",
        opts = function()
            require("which-key").register({
                -- mode = { "n", "v" },
                ["<leader>r"] = { name = "+REPL" },
            })
        end
    }
}
