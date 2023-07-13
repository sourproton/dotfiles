-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true

vim.opt.textwidth = 100
vim.opt.cc = "+1"

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for

-- send selection to tmux tmux

-- sets buffer-variable `tmuxtarget` to value read from `vim.fn.input`
local function config_tmuxtarget()
    vim.b.tmuxtarget = vim.fn.input("Tmux target: ")
end

-- sends selected text to target
local function send_selection()
    -- checks if `tmuxtarget` exists, calls `config_tmuxtarget` if not
    if vim.b.tmuxtarget == nil then config_tmuxtarget() end

    -- load tmux buffer with selected text
    vim.api.nvim_feedkeys(":'<,'>:w !tmux load-buffer - \r", "t", true)
    -- paste buffer to target
    vim.api.nvim_feedkeys(":silent !tmux paste-buffer -dpr -t " .. vim.b.tmuxtarget .. "\r", "t", true)
    -- sends carriage return
    vim.api.nvim_feedkeys(":silent !tmux send-keys -t " .. vim.b.tmuxtarget .. " Enter\r", "t", true)
end

-- send cell to target
local function send_cell()
    -- checks if `tmuxtarget` exists, calls `config_tmuxtarget` if not
    if vim.b.tmuxtarget == nil then config_tmuxtarget() end

    -- select current cell
    vim.api.nvim_feedkeys("/# %%\rNvnk", "t", true)

    -- send selection
    send_selection()

    -- go to next cell
    vim.api.nvim_feedkeys("n", "t", true)
end

lvim.builtin.which_key.mappings["r"] = {
    name = "Tmux send",
    c = { config_tmuxtarget, "Configure target" },
    s = { send_cell, "Send cell" },
}

lvim.builtin.which_key.vmappings["r"] = {
    name = "Tmux send",
    c = { config_tmuxtarget, "Configure target" },
    s = { send_selection, "Send selection" },
}
