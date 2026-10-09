vim.g.c_syntax_for_h = true

vim.g.netrw_banner = 0
vim.g.netrw_list_hide = '^\\..*'
vim.g.netrw_sort_sequence = '\\/$,*,@$'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.cedit = '^L'

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 5

vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = false

vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true
vim.opt.mouse = ''
vim.opt.virtualedit = 'block'

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.laststatus = 3
vim.opt.statusline = '%t %h%w%m%r%=%-10.(%l %c%V%) %P'

vim.opt.path='**3,./**2'
vim.opt.shortmess:append('I')

vim.filetype.add({
    extension = {
        Containerfile = 'dockerfile',
        sway = 'swayconfig',
        tf = 'terraform',
        sv = 'systemverilog',
        v = 'verilog',
    },
})
