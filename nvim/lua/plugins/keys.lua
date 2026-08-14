vim.g.nvim_surround_no_mappings = true
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
            move_cursor = 'sticky',
        },
        keys = {
            {"<Leader>s",  "<Plug>(nvim-surround-normal)",          mode="n"},
            {"<Leader>ss", "<Plug>(nvim-surround-normal-cur)",      mode="n"},
            {"<Leader>S",  "<Plug>(nvim-surround-normal-line)",     mode="n"},
            {"<Leader>SS", "<Plug>(nvim-surround-normal-cur-line)", mode="n"},

            {"s",  "<Plug>(nvim-surround-visual)",      mode="x"},
            {"S",  "<Plug>(nvim-surround-visual-line)", mode="x"},

            {"ds", "<Plug>(nvim-surround-delete)",      mode="n"},
            {"cs", "<Plug>(nvim-surround-change)",      mode="n"},
            {"cS", "<Plug>(nvim-surround-change-line)", mode="n"},
        },
    },
    {
        'stevearc/oil.nvim',
        version = '*',
        lazy = false,
        opts = {
            keymaps = {
                ['<C-h>']     = { 'actions.toggle_hidden',  mode = 'n' },
                ['<Leader>o'] = { 'actions.close',          mode = 'n' },
                ['<Leader>y'] = { 'actions.yank_entry',     mode = 'n', opts = { modify = ':.' } },
            },
            view_options = {
                is_always_hidden = function(name, _)
                    return name == '..'
                end,
            },
            skip_confirm_for_simple_edits = true,
        },
        keys = {
            { '<Leader>o', '<CMD>Oil<CR>' },
            { '<Leader>O', '<CMD>Oil .<CR>' },
        },
    },
}
