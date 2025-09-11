return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        opts = {
            keymaps = {
                insert = '<C-g>s',
                insert_line = '<C-g>S',
                normal = 's',
                normal_cur = 'ss',
                normal_line = 'S',
                normal_cur_line = 'SS',
                visual = 's',
                visual_line = 'S',
                delete = 'ds',
                change = 'cs',
                change_line = 'cS',
            },
        },
        keys = {
            {'s', mode=''}, {'S', mode=''},
            'ds', 'cs', 'cS',
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {
            default_file_explorer = false,
            keymaps = {
                ["<Bs>"]      = { "actions.parent",         mode = "n" },
                ["<C-H>"]         = { "actions.toggle_hidden",  mode = "n" },
                ["<Leader>o"] = { "actions.close",          mode = "n" },
                ["<Leader>e"] = { "actions.close",          mode = "n" },
                ["<Esc>"]     = { "actions.close",          mode = "n" },
            },
            view_options = {
                is_always_hidden = function(name, bufnr)
                    return name == '..'
                end,
            },
        },
        keys = {
            { "<Leader>o", "<CMD>Oil<CR>", desc = "Open oil.nvim" },
            { "<Leader>e", "<CMD>Oil<CR>", desc = "Open oil.nvim" },
        }
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
            { '<Leader>s', function () Flash.jump() end, mode = '', desc = 'Flash' },
            { '<Leader>a', function () Flash.treesitter_search() end, mode = '', desc = 'Flash Arround' },
        },
    }
}
