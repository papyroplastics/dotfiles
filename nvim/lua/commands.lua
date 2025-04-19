
vim.cmd.cabbrev('S', '%s')

vim.cmd.command('-nargs=1', 'SW', 'set shiftwidth=<args>')
vim.cmd.command('SW2', 'SW 2')
vim.cmd.command('SW4', 'SW 4')

local function wrapon()
    vim.o.wrap = true
    vim.keymap.set('', 'k', 'gk')
    vim.keymap.set('', 'j', 'gj')
    vim.keymap.set('', '$', 'g$')
    vim.keymap.set('', '0', 'g0')
    vim.keymap.set('', '^', 'g^')
end

vim.api.nvim_create_user_command('Wrapon', wrapon, {})

local function wrapoff()
    vim.o.wrap = false
    vim.keymap.set('', 'k', 'k')
    vim.keymap.set('', 'j', 'j')
    vim.keymap.set('', '$', '$')
    vim.keymap.set('', '0', '0')
    vim.keymap.set('', '^', '^')
end

vim.api.nvim_create_user_command('Wrapoff', wrapoff, {})

