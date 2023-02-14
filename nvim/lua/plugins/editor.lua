return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            sort_case_insensitive = true,
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
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension "file_browser"
        end,
        keys = {
            { "<leader>fd", "<cmd>Telescope file_browser<cr>", desc = "File Browser (cwd)" },
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
