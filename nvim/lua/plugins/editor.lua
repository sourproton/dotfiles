return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            sort_case_insensitive = true,
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
    }
}
