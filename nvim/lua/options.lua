
vim.g.netrw_banner = 0
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.c_syntax_for_h = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 5

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.virtualedit = 'block'
vim.opt.wrap = false
vim.opt.mouse = ''

vim.opt.pumblend = 7
vim.opt.completeopt = {'fuzzy', 'menu', 'menuone', 'noinsert', 'popup', 'preview'}

vim.opt.laststatus = 3
vim.opt.statusline = '%t %h%w%m%r%=%-10.(%l %c%V%) %P'

vim.opt.number = true
vim.opt.relativenumber = true

vim.filetype.add({
    extension = {
        sway = 'swayconfig',
        sv = 'systemverilog',
        v = 'verilog',
    },
})

