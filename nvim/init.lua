
Colorterm = os.getenv('COLORTERM') == 'truecolor'
Catppuccin = os.getenv('TERM') == 'xterm-kitty'

require('options')
require('commands')
require('keymaps')

local plugin_mark = vim.fn.stdpath('config') .. '/.load_plugins'
local load_plugins = vim.fn.filereadable(plugin_mark) == 1

if load_plugins and not vim.g.vscode then
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if vim.fn.filereadable(lazypath) == 0 then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable',
            lazypath,
        })
    end
    vim.opt.runtimepath:prepend(lazypath)

    require('lazy').setup('plugins')
end

vim.schedule(function ()
    vim.cmd.packadd('cfilter')
    vim.cmd.packadd('nvim.undotree')
    vim.cmd.packadd('nvim.difftool')

    local no_args = vim.fn.argc(-1) == 0
    local empty_buf = vim.fn.wordcount()['bytes'] == 0
    local unchanged = vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0

    if no_args and empty_buf and unchanged then
        vim.cmd.edit('.')
    end
end)


if Colorterm then
    vim.cmd.colorscheme(Catppuccin and 'catppuccin' or 'retrobox')

    local highlights = vim.fn.execute('highlight')
    local guibg_match = string.match(highlights, '\nNormal [^\n]*guibg=#(%x%x%x%x%x%x)')

    for hl_group in string.gmatch(highlights, "\n(%w+) [^\n]*guibg=%#" .. guibg_match) do
        vim.cmd.highlight(hl_group .. " guibg=none")
    end
end
