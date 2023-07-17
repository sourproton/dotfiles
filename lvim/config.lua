-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.textwidth = 100
vim.opt.cc = "+1"      -- draw vertical line
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4    -- Number of spaces tabs count for

lvim.transparent_window = true

lvim.plugins = {
    {
        "sourproton/tunnell.nvim",
        -- dir = "/home/sourproton/tunnell.nvim",
        -- dev = true,
        config = true
    }
}
