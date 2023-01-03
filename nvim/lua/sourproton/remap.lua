-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

vim.g.mapleader = ','

local set = vim.keymap.set

set('n', "<leader>ww", "<cmd>write<cr>")
set('n', "<leader>qq", "<cmd>quit<cr>")
set('n', "<leader>wq", "<cmd>write<cr>|<cmd>quit<cr>")
set('n', "<leader>e", "<cmd>Explore<cr>")

set('n', "<leader>tt", "<cmd>NvimTreeToggle<cr>")
set('n', "<leader>tf", "<cmd>NvimTreeFocus<cr>")

