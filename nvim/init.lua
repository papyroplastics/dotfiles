
Colorterm = os.getenv('COLORTERM') == 'truecolor'
Catppuccin = os.getenv('TERM') == 'xterm-kitty'

require('options')
require('commands')
require('keymaps')
require('plugins')
require('lsp')

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

    require('lazy').setup('lazy-plugins')
    vim.keymap.set('n', '<Leader>L', '<CMD>Lazy<CR>')
end

if Colorterm then
    vim.cmd.colorscheme(Catppuccin and 'catppuccin' or 'retrobox')

    local highlights = vim.fn.execute('highlight')
    local guibg_match = string.match(highlights, '\nNormal [^\n]*guibg=#(%x%x%x%x%x%x)')

    for hl_group in string.gmatch(highlights, "\n(%w+) [^\n]*guibg=%#" .. guibg_match) do
        vim.cmd.highlight(hl_group .. " guibg=none")
    end
end
