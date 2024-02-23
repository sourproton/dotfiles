-- [[ leader key ]]
-- set <space> as the leader key
-- NOTE: must happen before plugins are required (otherwise wrong leader will be used)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ install `lazy.nvim` plugin manager ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ plugins ]]

require("lazy").setup("plugins")

-- [[ options ]]

require("nvim-options")

-- [[ keymaps ]]
require("keymaps")
