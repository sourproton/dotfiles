return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'find files'},
        { '<leader>fg', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'fuzzy find'},
        { '<leader>fG', '<cmd>Telescope live_grep<cr>', desc = 'live grep'},
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'buffers'},
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'help tags' },
        { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'grep string' },
        { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'commands' },
        { '<leader>fr', '<cmd>Telescope lsp_references<cr>', desc = 'references' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'diagnostics' },
        { '<leader>ft', '<cmd>Telescope treesitter<cr>', desc = 'treesitter' },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = 'preview_scrolling_up',
                        ['<C-e>'] = 'preview_scrolling_down',
                    }
                }
            },
        })

        -- this will load fzf_native and have it override the default file sorter
        require('telescope').load_extension('fzf')
    end,
}
