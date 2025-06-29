return {
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
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },

    {
        'hiberabyss/readline.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        config = function ()
            Readline = require('readline')
            vim.keymap.set('!', '<C-p>', '<Up>')
            vim.keymap.set('!', '<C-n>', '<Down>')
            vim.keymap.set('i', '<M-p>', function() vim.cmd.norm('O') end)
            vim.keymap.set('i', '<M-n>', function() vim.cmd.norm('o') end)

            vim.keymap.set('!', '<M-f>', Readline.forward_word)
            vim.keymap.set('!', '<M-b>', Readline.backward_word)
            vim.keymap.set('!', '<C-f>', '<Right>')
            vim.keymap.set('!', '<C-b>', '<Left>')

            vim.keymap.set('!', '<C-a>', Readline.dwim_beginning_of_line)
            vim.keymap.set('!', '<C-e>', Readline.end_of_line)

            vim.keymap.set('!', '<M-d>', Readline.kill_word)
            vim.keymap.set('!', '<C-d>', '<Del>')
            vim.keymap.set('!', '<C-h>', '<BS>')
            vim.keymap.set('!', '<M-h>', Readline.backward_kill_word)

            vim.keymap.set('!', '<M-BS>',Readline.backward_kill_word)
            vim.keymap.set('!', '<C-BS>',Readline.backward_kill_word)
            vim.keymap.set('!', '<C-w>', Readline.unix_word_rubout)

            vim.keymap.set('!', '<M-k>', Readline.kill_line)
            vim.keymap.set('!', '<C-u>', Readline.backward_kill_line)

            vim.keymap.set('!', '<M-m>', Readline.back_to_indentation)
        end,
    },
}
