require('vim._core.ui2').enable({})

require('options')
require('commands')
require('keymaps')
require('lsp')
require('plugins')

vim.schedule(function ()
    local no_args = vim.fn.argc(-1) == 0
    local empty_buf = vim.fn.wordcount()['bytes'] == 0
    local unchanged = vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0

    if no_args and empty_buf and unchanged then
        vim.cmd.edit('.')
    end
end)
