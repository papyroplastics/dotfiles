return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 700

            local wk = require('which-key')

            wk.setup({
                icons = {
                    rules = false,
                    color = false
                }
            })

            wk.add({
                { '<leader>b', group = 'buffes' },
                { '<leader>t', group = 'tabs' },
                { '<leader>l', group = 'lsp' },
                { '<leader><leader>', group= 'telescope' },

                { '<leader>g', desc = 'Treesitter'},
                { '<leader>g', group = 'treesitter', mode='v'},

                { '<leader>w', hidden = true },
                { '<leader>a', hidden = true },
                { '<leader>q', hidden = true },

                -- { '<leader>h', group = 'harpoon' },
                -- { '<leader>0', hidden = true },
                -- { '<leader>1', hidden = true },
                -- { '<leader>2', hidden = true },
                -- { '<leader>3', hidden = true },
                -- { '<leader>4', hidden = true },
                -- { '<leader>5', hidden = true },
                -- { '<leader>6', hidden = true },
                -- { '<leader>7', hidden = true },
                -- { '<leader>8', hidden = true },
                -- { '<leader>9', hidden = true },
            })
        end,
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
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },

    {
        'hiberabyss/readline.nvim',
        event = {'InsertEnter', 'CmdlineEnter'},
        config = function ()
            local readline = require('readline')
            vim.keymap.set('!', '<C-p>', '<Up>')
            vim.keymap.set('!', '<C-n>', '<Down>')
            vim.keymap.set('i', '<M-p>', '<Esc>O')
            vim.keymap.set('i', '<M-n>', '<Esc>o')

            vim.keymap.set('!', '<M-f>', readline.forward_word)
            vim.keymap.set('!', '<M-b>', readline.backward_word)
            vim.keymap.set('!', '<C-f>', '<Right>')
            vim.keymap.set('!', '<C-b>', '<Left>')

            vim.keymap.set('!', '<C-a>', readline.dwim_beginning_of_line)
            vim.keymap.set('!', '<C-e>', readline.end_of_line)

            vim.keymap.set('!', '<M-d>', readline.kill_word)
            vim.keymap.set('!', '<C-d>', '<Del>')
            vim.keymap.set('!', '<C-h>', '<BS>')
            vim.keymap.set('!', '<M-h>', readline.backward_kill_word)

            vim.keymap.set('!', '<M-BS>',readline.backward_kill_word)
            vim.keymap.set('!', '<C-BS>',readline.backward_kill_word)
            vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)

            vim.keymap.set('!', '<M-k>', readline.kill_line)
            vim.keymap.set('!', '<C-u>', readline.backward_kill_line)

            vim.keymap.set('!', '<M-m>', readline.back_to_indentation)
        end,
    },
}
