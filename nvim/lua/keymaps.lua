
-- General
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Clean search' })
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy Panel' })

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
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-l>', '<C-w>l')

-- Tabs
vim.keymap.set('n', '<leader>tt', vim.cmd.tabnew,      { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', vim.cmd.tabclose,    { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tp', vim.cmd.tabprevious, { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnext,     { desc = 'Next tab' })

-- Buffers
vim.keymap.set('n', '<leader>bp', vim.cmd.bprevious, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext,     { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bm', vim.cmd.bmodified, { desc = 'Modified buffer' })
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete,   { desc = 'Delete buffer' })

-- Write
vim.keymap.set('n', '<leader>w', vim.cmd.up, { desc = 'Write current' })
vim.keymap.set('n', '<leader>a', vim.cmd.wa, { desc = 'Write All' })
vim.keymap.set('n', '<leader>q', vim.cmd.wq, { desc = 'Quit' })

