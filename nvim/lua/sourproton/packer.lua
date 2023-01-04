return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    
    -- colorschemes
    use "EdenEast/nightfox.nvim"

    -- icons
    use "nvim-tree/nvim-web-devicons"

    -- file explorer
    use {
        "nvim-tree/nvim-tree.lua",
        -- tag = "nightly", -- optional, updated every week. (see issue #1193)
    }

    -- LSP
    use "neovim/nvim-lspconfig"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "kdheepak/cmp-latex-symbols"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Rust
    use "simrat39/rust-tools.nvim"

    -- Debugging
    use "nvim-lua/plenary.nvim"
    use "mfussenegger/nvim-dap"

    -- Slime (for REPL usage)
    use "jpalardy/vim-slime"
end)

