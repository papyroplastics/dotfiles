return {
    {
        'folke/lazydev.nvim',
        lazy = true,
        ft = 'lua',
        cond = string.sub(vim.fn.getcwd(), -5) == '/nvim',
        version = '*',
        opts = {},
    },

    {
        'williamboman/mason.nvim',
        varsion = '*',
        enabled = false,
        lazy = true,
        cmd = 'Mason',
        opts = {},
    },

    {
        'williamboman/mason-lspconfig.nvim',
        varsion = '*',
        enabled = false,
        lazy = true,
    },

    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        ft = { 'python', 'c', 'cpp', 'lua', 'verilog', 'systemverilog',
            'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
            'typescriptreact', 'typescript.tsx', 'typst', 'tex', 'bash', 'sh' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },

        keys = {
            { '<leader>lh', vim.lsp.buf.hover,          desc = 'Show hover' },
            { '<leader>la', vim.lsp.buf.code_action,    desc = 'Code action' },
            { '<leader>ld', vim.lsp.buf.definition,     desc = 'Go to definition' },
            { '<leader>li', vim.lsp.buf.implementation, desc = 'Go to implementation' },
            { '<leader>le', vim.lsp.buf.declaration,    desc = 'Go to declaration' },
            { '<leader>lr', vim.lsp.buf.rename,         desc = 'Rename symbol' },
            { '<leader>lf', vim.lsp.buf.format,         desc = 'Format document' },
            { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help' },
            { '<leader>lt', vim.lsp.buf.type_definition,desc = 'Type definition' },
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
            local cmp = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            vim.lsp.config('*', {
                capabilities = complete,
            })

            vim.lsp.enable({
                'basedpyright',
                'clangd',
                'lua_ls',
                'svlangserver',
                'ts_ls',
                'tinymist',
                'texlab',
                'bashls'
            })
        end,
    },

    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        version = '*',

        keys = {
            {
                '<leader>r',
                '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>',
                desc = 'Diagnostics',
            },
            {
                '<leader>o',
                '<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>',
                desc = 'Symbols',
            },
        },
    },
}
