
-- General
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Clean search' })
vim.keymap.set('', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy Panel' })

-- Normal
vim.keymap.set('', '<C-j>', '4j', { remap = true })
vim.keymap.set('', '<C-k>', '4k', { remap = true })

vim.keymap.set('', '<C-n>', '8j', { remap = true })
vim.keymap.set('', '<C-p>', '8k', { remap = true })

vim.keymap.set('', '<C-h>', '20h', { remap = true })
vim.keymap.set('', '<C-l>', '20l', { remap = true })

vim.keymap.set('', '¿', '^', { remap = true })

-- Insert
vim.keymap.set('i', '<S-CR>', function() vim.cmd.norm('O') end)
vim.keymap.set('i', '<C-CR>', function() vim.cmd.norm('o') end)

-- Windows
vim.keymap.set('', '<M-h>', '<C-w>h')
vim.keymap.set('', '<M-j>', '<C-w>j')
vim.keymap.set('', '<M-k>', '<C-w>k')
vim.keymap.set('', '<M-l>', '<C-w>l')
vim.keymap.set('', '<M-l>', '<C-w>l')

-- Tabs
vim.keymap.set('', '<C-t>', vim.cmd.tabnew,      { desc = 'New tab' })
vim.keymap.set('', '<C-q>', vim.cmd.tabclose,    { desc = 'Close tab' })
vim.keymap.set('', '<Tab>', vim.cmd.tabnext,     { desc = 'Next tab' })
vim.keymap.set('', '<S-Tab>', vim.cmd.tabprevious, { desc = 'Previous tab' })

-- Write
vim.keymap.set('', '<leader>w', vim.cmd.up, { desc = 'Write current' })
vim.keymap.set('', '<leader>a', vim.cmd.wa, { desc = 'Write All' })
vim.keymap.set('', '<leader>q', vim.cmd.wq, { desc = 'Quit' })

