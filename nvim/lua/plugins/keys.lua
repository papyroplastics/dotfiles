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
        opts = {
            keymaps = {
                -- ["<Bs>"]      = { "actions.parent",         mode = "n" },
                ["<C-H>"]     = { "actions.toggle_hidden",  mode = "n" },
                ["<Leader>o"] = { "actions.close",          mode = "n" },
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
        },
    },
}
