
require('options')
require('keymaps')
require('commands')
require('filetypes')
require('netrd')

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

if not vim.g.vscode then
    require('lazy').setup('plugins')
end

