
-- General
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Clean search' })
vim.keymap.set('n', '´', '^', { desc = 'Go to start of text in line' })
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy Panel' })

-- Tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>',      { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>',    { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>',     { desc = 'Next tab' })

-- Buffers
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>',     { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bm', '<cmd>bmodified<cr>', { desc = 'Modified buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>',   { desc = 'Delete buffer' })

-- Write
vim.keymap.set('n', '<leader>w', '<cmd>up<cr>', { desc = 'Current' })
vim.keymap.set('n', '<leader>a', '<cmd>wa<cr>', { desc = 'All' })
vim.keymap.set('n', '<leader>q', '<cmd>wq<cr>', { desc = 'Quit' })

