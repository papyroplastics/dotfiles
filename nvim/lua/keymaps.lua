
-- General
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch,  { desc = 'Clean search' })
vim.keymap.set('', '<Leader>L', '<CMD>Lazy<CR>',  { desc = 'Lazy Panel' })
vim.keymap.set('', '<Leader>o', '<CMD>Explore<CR>', { desc = 'Open Netrw'})

-- Fast movement
vim.keymap.set('', '<C-j>', '4gj')
vim.keymap.set('', '<C-k>', '4gk')

vim.keymap.set('', '<C-n>', '8gj')
vim.keymap.set('', '<C-p>', '8gk')

vim.keymap.set('', '<C-h>', '20h')
vim.keymap.set('', '<C-l>', '20l')

vim.keymap.set('', '¿', '^')

-- Tabs
local function close_tab()
    if (vim.fn.winnr('$') ~= 1) then
        vim.cmd.quit()
    elseif (vim.fn.tabpagenr('$') ~= 1) then
        vim.cmd.tabclose()
    else
        vim.cmd.quitall()
    end
end

vim.keymap.set('', '<C-t>',   vim.cmd.tabnew,      { desc = 'New tab' })
vim.keymap.set('', '<C-q>',   close_tab,           { desc = 'Close tab' })
vim.keymap.set('', 'L',       vim.cmd.tabnext,     { desc = 'Next tab' })
vim.keymap.set('', 'H',       vim.cmd.tabprevious, { desc = 'Previous tab' })
vim.keymap.set('', '<M-h>',   function() vim.cmd.tabmove('-') end, { desc = 'Move tab left' })
vim.keymap.set('', '<M-l>',   function() vim.cmd.tabmove('+') end, { desc = 'Move tab right' })

-- Quickfix
local function ctoggle ()
    local qfix = vim.fn.getqflist({ winid = 0 })
    if qfix.winid == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

vim.keymap.set('', '<Leader>q', ctoggle)

vim.keymap.set('', '<Leader>$', function()
    vim.ui.input({ prompt = '$' }, function (input)
        if not input or input == '' then
            print('Invalid command.')
            return
        end

        local result = vim.fn.systemlist(input)
        if not result or  result == '' then
            print('No output.')
            return
        end

        vim.cmd('noswapfile new')
        vim.bo.buftype = 'nofile'
        vim.bo.bufhidden = 'wipe'
        vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
    end)
end)

vim.keymap.set('', '<Leader>g', ':Grep ')
vim.keymap.set('', '<Leader>f', ':Find ')
vim.keymap.set('', '<Leader>n', '<CMD>cnext<CR>')
vim.keymap.set('', '<Leader>N', '<CMD>cprevious<CR>')
vim.keymap.set('', '<Leader>p', '<CMD>cprevious<CR>')

-- Outline
local function outline_toggle()
    local prev_wincnt = vim.fn.winnr('$')
    vim.cmd.normal({'gO', bang = true})
    if (prev_wincnt == vim.fn.winnr('$') and vim.o.filetype == 'qf') then
        local prev_winnr = vim.fn.winnr()
        vim.cmd.normal({'<C-w>k', bang = true})
        vim.cmd(string.format('%iquit', prev_winnr))
    end
end

vim.keymap.set('', '<Leader>u', outline_toggle, { desc = 'Buffer outline' })
vim.keymap.set('', 'gO', outline_toggle, { desc = 'Buffer outline' })

-- Readline-like keymaps
vim.keymap.set('!', '<C-p>', '<Up>')
vim.keymap.set('!', '<C-n>', '<Down>')

vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<M-f>', '<C-Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<M-b>', '<C-Left>')

vim.keymap.set('!', '<C-d>', '<Delete>')
vim.keymap.set('i', '<M-d>', '<C-o>dw')
vim.keymap.set('c', '<M-d>', '<C-Right><C-w>')
vim.keymap.set('!', '<M-h>', '<C-w>')
vim.keymap.set('!', '<C-BS>','<C-w>')
vim.keymap.set('!', '<M-BS>','<C-w>')

local ctrl_p_bytes = vim.api.nvim_replace_termcodes('<C-p>', true, false, true)

vim.keymap.set('i', '<C-k>', '<C-o>d$')
vim.keymap.set('c', '<C-j>', '<C-n>')
vim.keymap.set('c', '<C-k>', function ()
    if vim.fn.pumvisible() ~= 0 or vim.fn.getcmdpos() - 1 == string.len(vim.fn.getcmdline()) then
        vim.api.nvim_feedkeys(ctrl_p_bytes, 'n', false)
    else
        vim.fn.setcmdline(string.sub(vim.fn.getcmdline(), 1, vim.fn.getcmdpos()-1))
    end
end)

local ctrl_e_bytes = vim.api.nvim_replace_termcodes('<C-e>', true, false, true)
local end_bytes = vim.api.nvim_replace_termcodes('<End>', true, false, true)

vim.keymap.set('!', '<C-a>', '<Home>')
vim.keymap.set('!', '<C-e>', function ()
    if vim.fn.pumvisible() ~= 0 then
        vim.api.nvim_feedkeys(ctrl_e_bytes, 'n', false)
    else 
        vim.api.nvim_feedkeys(end_bytes, 'n', false)
    end
end)

local cr_bytes = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
local ctrl_y_bytes = vim.api.nvim_replace_termcodes('<C-y>', true, false, true)

vim.keymap.set('c', '<CR>', function()
    if vim.fn.pumvisible() ~= 0 then
        vim.api.nvim_feedkeys(ctrl_y_bytes, 'n', false)
    else 
        vim.api.nvim_feedkeys(cr_bytes, 'n', false)
    end
end)

vim.keymap.set('i', '<C-CR>', '<C-e><C-o>o')
vim.keymap.set('i', '<S-CR>', '<C-e><C-o>O')

