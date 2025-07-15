
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.c_syntax_for_h = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 5

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.virtualedit = 'block'
vim.opt.wrap = false

vim.opt.mouse = ''

if vim.g.as_pager then
    vim.opt.number = false
    vim.opt.relativenumber = false
end

Colorterm = os.getenv('COLORTERM') ~= nil

if Colorterm then
    vim.cmd.colorscheme('habamax')
end


vim.g.netrw_banner = 0
vim.g.netrw_browse_split=4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle=3

vim.keymap.set("n", "<leader>e", ":25Lex<CR>")
