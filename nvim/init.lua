
require('options')
require('commands')
require('keymaps')
require('plugins')
require('lsp')

-- local plugin_mark = vim.fn.stdpath('config') .. '/.load_plugins'
-- local load_plugins = vim.fn.filereadable(plugin_mark) == 1
--
-- if load_plugins and not vim.g.vscode then
--     local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
--     if vim.fn.filereadable(lazypath) == 0 then
--         vim.fn.system({
--             'git',
--             'clone',
--             '--filter=blob:none',
--             'https://github.com/folke/lazy.nvim.git',
--             '--branch=stable',
--             lazypath,
--         })
--     end
--     vim.opt.runtimepath:prepend(lazypath)
--
--     require('lazy').setup('lazy-plugins')
--     vim.keymap.set('n', '<Leader>L', '<CMD>Lazy<CR>')
-- end

vim.schedule(function ()
    local no_args = vim.fn.argc(-1) == 0
    local empty_buf = vim.fn.wordcount()['bytes'] == 0
    local unchanged = vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0

    if no_args and empty_buf and unchanged then
        vim.cmd.edit('.')
    end
end)
