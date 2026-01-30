local function on_tab(callback)
    return function()
        vim.cmd('tab split')
        callback()
    end
end

return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        dependencies = {
            'saghen/blink.cmp',
        },
        ft = {
            'python', 'c', 'cpp', 'verilog', 'systemverilog', 'cmake', 'lua',
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
                'pyrefly',
                'clangd',
                'svlangserver',
                'ts_ls',
                'tinymist',
                'texlab',
                'bashls',
                'neocmake',
                'lua_ls',
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
