return {
    {
        'windwp/nvim-autopairs',
        version = '*',
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
        event = 'VeryLazy',
        opts = {
            keymaps = {
                ['<C-h>']     = { 'actions.toggle_hidden',  mode = 'n' },
                ['<Leader>o'] = { 'actions.close',          mode = 'n' },
            },
            view_options = {
                is_always_hidden = function(name, _)
                    return name == '..'
                end,
            },
            skip_confirm_for_simple_edits = true,
        },
        config = function (_, opts)
            local oil = require('oil')
            oil.setup(opts)

            if vim.fn.argc() == 0
                and vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0
                and vim.fn.wordcount()['bytes'] == 0 then
                vim.schedule(oil.open)
            end
        end,
        keys = {
            { '<Leader>o', '<CMD>Oil<CR>' },
            { '<Leader>O', '<CMD>Oil .<CR>' },
        },
    },
}
