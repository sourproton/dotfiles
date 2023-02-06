return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    
    -- colorschemes
    use "EdenEast/nightfox.nvim"

    -- file explorer
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
            "nvim-telescope/telescope-file-browser.nvim",
        }
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

