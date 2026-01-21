return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
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
        version = '*',
        lazy = false,
        config = function(plug, opts)
            Oil = require('oil')
            Oil.setup(opts)

            if vim.fn.argc() == 0 then
                Oil.open('.')
            end
        end,
        opts = {
            keymaps = {
                ['<C-h>']     = { 'actions.toggle_hidden',  mode = 'n' },
                ['<Leader>o'] = { 'actions.close',          mode = 'n' },
            },
            view_options = {
                is_always_hidden = function(name, bufnr)
                    return name == '..'
                end,
            },
            skip_confirm_for_simple_edits = true,
        },
        keys = {
            { '<Leader>o', function() Oil.open() end },
            { '<Leader>O', function() Oil.open('.') end },
        },
    },
}
