local function on_tab(callback)
    return function()
        vim.cmd('tab split')
        callback()
    end
end

local function docsymbol(options)
    vim.fn.setloclist(0, {}, ' ', options)
    vim.cmd.lopen()
    vim.cmd.Lfilter('Function\\|Method\\|Class\\|Constructor')
end

local function lsp_outline()
    vim.lsp.buf.document_symbol({ on_list = docsymbol })
end

return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        dependencies = {
            'saghen/blink.cmp',
        },
        ft = {
            'python', 'lua', 'php', 'bash', 'sh',
            'c', 'cpp', 'cmake', 'verilog', 'systemverilog',
            'javascript', 'javascriptreact', 'javascript.jsx',
            'typescript', 'typescriptreact', 'typescript.tsx',
            'typst', 'tex', 'html', 'css', 'json',
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
                'pyrefly',
                'lua_ls',
                'intelephense',
                'bashls',
                'clangd',
                'neocmake',
                'svlangserver',
                'ts_ls',
                'eslint',
                'tinymist',
                'texlab',
                'html',
                'cssls',
                'jsonls',
            })
        end,
        keys = {
            { '<Leader>lk', vim.lsp.buf.hover },
            { '<Leader>ls', vim.lsp.buf.signature_help },

            { '<Leader>ld', vim.lsp.buf.definition },
            { '<Leader>li', vim.lsp.buf.implementation },
            { '<Leader>lh', vim.lsp.buf.declaration },
            { '<Leader>lt', vim.lsp.buf.type_definition },

            { '<Leader>lD', on_tab(vim.lsp.buf.definition) },
            { '<Leader>lI', on_tab(vim.lsp.buf.implementation) },
            { '<Leader>lH', on_tab(vim.lsp.buf.declaration) },
            { '<Leader>lT', on_tab(vim.lsp.buf.type_definition) },

            { '<Leader>lu', vim.lsp.buf.references },
            { '<Leader>lc', vim.lsp.buf.incoming_calls },

            { '<Leader>lr', vim.lsp.buf.rename },
            { '<Leader>lf', vim.lsp.buf.format },
            { '<Leader>la', vim.lsp.buf.code_action },

            { '<Leader>lo', vim.lsp.buf.document_symbol },
            { '<Leader>lO', lsp_outline },
            { '<Leader>le', vim.diagnostic.open_float },
            { '<Leader>lq', vim.diagnostic.setloclist },

        },
    },
    {
        'saghen/blink.cmp',
        version = '*',
        event = 'InsertEnter',
        opts = {
            keymap = { preset = 'enter' },
        },
    },
}
