return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
        ft = {
            'python', 'c', 'cpp', 'verilog', 'systemverilog', 'php',
            'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
            'typescriptreact', 'typescript.tsx', 'typst', 'tex', 'bash', 'sh'
        },
        config = function()
            vim.lsp.log.set_level(vim.lsp.log.levels.ERROR)
            vim.diagnostic.config({
                underline = true,
                virtual_text = true,
                update_in_insert = false,
                signs = false,
            })

            local _ = require('lspconfig')

            vim.lsp.enable({
                'basedpyright',
                'clangd',
                'svlangserver',
                'ts_ls',
                'tinymist',
                'texlab',
                'bashls',
                'phpactor'
            })
        end,
        keys = {
            { '<leader>lh', vim.lsp.buf.hover,              desc = 'Show hover' },
            { '<leader>la', vim.lsp.buf.code_action,        desc = 'Code action' },
            { '<leader>ld', vim.lsp.buf.definition,         desc = 'Go to definition' },
            { '<leader>li', vim.lsp.buf.implementation,     desc = 'Go to implementation' },
            { '<leader>le', vim.lsp.buf.declaration,        desc = 'Go to declaration' },
            { '<leader>lr', vim.lsp.buf.rename,             desc = 'Rename symbol' },
            { '<leader>lf', vim.lsp.buf.format,             desc = 'Format document' },
            { '<leader>ls', vim.lsp.buf.signature_help,     desc = 'Signature help' },
            { '<leader>lt', vim.lsp.buf.type_definition,    desc = 'Type definition' },
            { '<leader>lu', vim.lsp.buf.references,         desc = 'Type definition' },
            { '<leader>lc', vim.lsp.buf.incoming_calls,     desc = 'Type definition' },
            { '<leader>lq', vim.diagnostic.setqflist,       desc = 'Go to declaration' },
        },
    },
    {
        'folke/trouble.nvim',
        enabled = false,
        opts = {},
        cmd = 'Trouble',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        version = '*',
        keys = {
            {
                '<leader>r',
                '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>',
                desc = 'Diagnostics',
            },
            {
                '<leader>o',
                '<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>',
                desc = 'Symbols',
            },
        },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        enabled = false,
        cond = string.sub(vim.fn.getcwd(), -5) == '/nvim',
        version = '*',
        opts = {},
    },

}
