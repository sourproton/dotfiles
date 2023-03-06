return {
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = {
    --         colorscheme = "tokyonight",
    --         style = "night",
    --     },
    -- },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd("colorscheme carbonfox")
        end
    },
}
