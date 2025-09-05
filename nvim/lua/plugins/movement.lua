return {
    {
        'stevearc/oil.nvim',
        opts = {
            default_file_explorer = false,
            keymaps = {
                ["<bs>"]      = { "actions.parent",         mode = "n" },
                ["<C-H>"]         = { "actions.toggle_hidden",  mode = "n" },
                ["<leader>o"] = { "actions.close",          mode = "n" },
                ["<leader>e"] = { "actions.close",          mode = "n" },
                ["<esc>"]     = { "actions.close",          mode = "n" },
            },
            view_options = {
                is_always_hidden = function(name, bufnr)
                    return name == '..'
                end,
            },
        },
        keys = {
            { "<leader>o", "<CMD>Oil<CR>", desc = "Open oil.nvim" },
            { "<leader>e", "<CMD>Oil<CR>", desc = "Open oil.nvim" },
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        enabled = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader><leader>t', '<cmd>Telescope<cr>',            desc = 'Telescope builtins'},
            { '<leader><leader>f', '<cmd>Telescope find_files<cr>', desc = 'Find file' },
            { '<leader><leader>g', '<cmd>Telescope live_grep<cr>',  desc = 'Ripgrep' },
        },
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        enabled = false,
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        opts = {
            enable_git_status = false,
            filesystem = {
                hijack_netrw_behavior = "disabled",
                window = {
                    mappings = {
                        ["/"] = "noop",
                    }
                },
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
