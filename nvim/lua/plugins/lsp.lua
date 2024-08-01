return {
    {
        'folke/lazydev.nvim',
        lazy = true,
        ft = 'lua',
        version = '*',
        opts = {},
    },

    {
        'williamboman/mason.nvim',
        varsion = '*',
        lazy = true,
        cmd = 'Mason',
        opts = {},
    },

    {
        'williamboman/mason-lspconfig.nvim',
        varsion = '*',
        lazy = true,
        opts = {
            ensure_installed = { 'basedpyright', 'clangd', 'lua_ls', 'neocmake', 'rust_analyzer' },
        },
    },

    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        ft = { 'python', 'c', 'cpp', 'lua', 'cmake', 'rust' },
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
        },

        config = function()
            local lspconfig = require('lspconfig')
            local cmp = require('cmp_nvim_lsp')
            local default_capabilities = cmp.default_capabilities()

            local clangd_default_capabilities = cmp.default_capabilities()
            clangd_default_capabilities.textDocument.semanticHighlighting = true
            clangd_default_capabilities.offsetEncoding = 'utf-8'

            lspconfig.basedpyright.setup({
                capabilities = default_capabilities,
            })

            lspconfig.clangd.setup({
                capabilities = clangd_default_capabilities,
            })

            lspconfig.lua_ls.setup({
                capabilities = default_capabilities,
            })

            lspconfig.neocmake.setup({
                capabilities = default_capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = default_capabilities,
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
