return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader><leader>t', '<cmd>Telescope<cr>', desc = 'Telescope builtins'},
            { '<leader><leader>b', '<cmd>Telescope buffers<cr>', desc = 'Buffer list' },
            { '<leader><leader>f', '<cmd>Telescope find_files<cr>', desc = 'Find file' },
            { '<leader><leader>g', '<cmd>Telescope live_grep<cr>', desc = 'Ripgrep' },
            { '<leader><leader>j', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
            { '<leader><leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy finder' },
            { '<leader><leader>n', '<cmd>Telescope notify<cr>', desc = 'Notify' },
        },
    },

    {
        'nvim-neo-tree/neo-tree.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        opts = {
            enable_git_status = false,
            filesystem = {
                hijack_netrw_behavior = "disabled"
            },
        },
        keys = {
            { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
        },
    },

    {
        'folke/flash.nvim',
        version = '*',
        opts = function ()
            Flash = require('flash')
            Flash.setup({})
        end,
        keys = {
            'f', 'F', 't', 'T',
            { '<leader>s', function () Flash.jump() end, mode = '', desc = 'Flash' },
            { '<leader>a', function () Flash.treesitter_search() end, mode = '', desc = 'Flash Arround' },
        },
    }
}
