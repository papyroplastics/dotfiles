local function on_tab(callback)
    return function()
        vim.cmd('tab vsplit')
        callback()
    end
end

return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
        },
        ft = {
            'python', 'c', 'cpp', 'verilog', 'systemverilog', 'cmake',
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
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
        },
        config = function()
            local cmp = require('cmp')

            local function select_prev_item(callback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else 
                    callback()
                end
            end

            local function select_next_item(_)
                if not cmp.visible() then
                  cmp.complete()
                end
                cmp.select_next_item()
            end

            local function toggle_docs(callback)
                if cmp.visible() then
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                else
                    callback()
                end
            end

            local function scroll_docs_up(callback)
                if cmp.visible_docs() then
                    cmp.scroll_docs(-4)
                else
                    callback()
                end
            end

            local function scroll_docs_down(callback)
                if cmp.visible_docs() then
                    cmp.scroll_docs(4)
                else
                    callback()
                end
            end

            local function confirm(callback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    callback()
                end
            end

            local function toggle_complete()
                if cmp.visible() then
                    cmp.abort()
                else
                    cmp.complete()
                end
            end

            cmp.setup({
                view = { 
                    entries = "native",
                    docs = {
                        auto_open = false 
                    }
                },

                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                },

                mapping = {
                    ['<C-Space>'] = toggle_complete,
                    ['<Tab>'] = confirm,
                    ['<CR>']  = confirm,
                    ['<C-k>'] = select_prev_item,
                    ['<C-j>'] = select_next_item,
                    ['<C-i>'] = toggle_docs,
                    ['<C-h>'] = scroll_docs_up,
                    ['<C-l>'] = scroll_docs_down,
                },
            })
        end,
    },
}
