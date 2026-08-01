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
            {"<Leader>s",  "<Plug>(nvim-surround-normal)",           mode="n"},
            {"<Leader>ss", "<Plug>(nvim-surround-normal-cur)",       mode="n"},
            {"<Leader>S",  "<Plug>(nvim-surround-normal)$",          mode="n"},

            {"ds", "<Plug>(nvim-surround-delete)",      mode="n"},
            {"cs", "<Plug>(nvim-surround-change)",      mode="n"},
            {"cS", "<Plug>(nvim-surround-change-line)", mode="n"},

            {"s",  "<Plug>(nvim-surround-visual)",      mode="x"},
            {"S",  "<Plug>(nvim-surround-visual-line)", mode="x"},
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
        config = function (_, opts)
            local oil = require('oil')
            oil.setup(opts)
            vim.schedule(function ()
                local empty_buf = vim.fn.wordcount()['bytes'] == 0
                local unchanged = vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0

                if vim.fn.argc() == 0 and empty_buf and unchanged then
                    oil.open()
                end
            end)
        end,
        keys = {
            { '<Leader>o', '<CMD>Oil<CR>' },
            { '<Leader>O', '<CMD>Oil .<CR>' },
        },
    },
}
