vim.g.slime_target = "tmux"
vim.g.slime_cell_delimiter = "# %%"


-- vim.g.mapleader = ','
local set = vim.keymap.set
set('n', "<leader>ss", "<Plug>SlimeSendCell <BAR> /^# %%<CR>")
