
require('options')
require('commands')
require('keymaps')

local plugin_mark = vim.fn.stdpath('config') .. '/.load_plugins'
local load_plugins = vim.fn.filereadable(plugin_mark) == 1

if load_plugins and not vim.g.vscode then
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not vim.fn.filereadable(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable',
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup('plugins')
end

