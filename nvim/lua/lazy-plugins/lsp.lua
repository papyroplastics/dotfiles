
vim.lsp.log.set_level(vim.lsp.log.levels.ERROR)

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    update_in_insert = false,
    signs = false,
})

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
    'texlab'
})

local function on_tab(callback)
    return function()
        vim.cmd('tab split')
        callback()
    end
end

local function docsymbol(options)
    vim.fn.setloclist(0, {}, ' ', options)
    vim.cmd.lopen()
    vim.cmd.Lfilter('\\[\\(Function\\|Method\\|Class\\|Constructor\\)\\]')
end

local function lsp_outline()
    vim.lsp.buf.document_symbol({ on_list = docsymbol })
end


vim.keymap.set('n', '<Leader>lk', vim.lsp.buf.hover)
vim.keymap.set('n', '<Leader>ls', vim.lsp.buf.signature_help)

vim.keymap.set('n', '<Leader>ld', vim.lsp.buf.definition)
vim.keymap.set('n', '<Leader>li', vim.lsp.buf.implementation)
vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.declaration)
vim.keymap.set('n', '<Leader>lt', vim.lsp.buf.type_definition)

vim.keymap.set('n', '<Leader>lD', on_tab(vim.lsp.buf.definition))
vim.keymap.set('n', '<Leader>lI', on_tab(vim.lsp.buf.implementation))
vim.keymap.set('n', '<Leader>lH', on_tab(vim.lsp.buf.declaration))
vim.keymap.set('n', '<Leader>lT', on_tab(vim.lsp.buf.type_definition))

vim.keymap.set('n', '<Leader>lu', vim.lsp.buf.references)
vim.keymap.set('n', '<Leader>lc', vim.lsp.buf.incoming_calls)

vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action)

vim.keymap.set('n', '<Leader>lo', vim.lsp.buf.document_symbol)
vim.keymap.set('n', '<Leader>lO', lsp_outline)
vim.keymap.set('n', '<Leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>lq', vim.diagnostic.setloclist)

return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        config = false,
    },
    {
        'saghen/blink.cmp',
        version = '*',
        event = 'InsertEnter',
        opts = {
            keymap = { preset = 'enter', },
            cmdline = { enabled = false },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
}
