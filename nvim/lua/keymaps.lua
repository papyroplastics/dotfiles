
-- General
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Clean search' })
vim.keymap.set('', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy Panel' })
vim.keymap.set('', '<leader>e', '<cmd>25Lex<cr>')

-- New lines
vim.keymap.set('i', '<S-CR>', function() vim.cmd.norm({'O', bang = true}) end)
vim.keymap.set('i', '<C-CR>', function() vim.cmd.norm({'o', bang = true}) end)

-- Fast movement
vim.keymap.set('', '<C-j>', '4j',  { remap = true })
vim.keymap.set('', '<C-k>', '4k',  { remap = true })

vim.keymap.set('', '<C-n>', '8j',  { remap = true })
vim.keymap.set('', '<C-p>', '8k',  { remap = true })

vim.keymap.set('', '<C-h>', '20h', { remap = true })
vim.keymap.set('', '<C-l>', '20l', { remap = true })

vim.keymap.set('', '¿', '^', { remap = true })

-- Windows
local function close_tab()
    if (vim.fn.winnr('$') ~= 1) then
        vim.cmd.quit()
    elseif (vim.fn.tabpagenr('$') ~= 1) then
        vim.cmd.tabclose()
    else
        vim.cmd.quitall()
    end
end

vim.keymap.set('', '<M-h>', '<C-w>h')
vim.keymap.set('', '<M-j>', '<C-w>j')
vim.keymap.set('', '<M-k>', '<C-w>k')
vim.keymap.set('', '<M-l>', '<C-w>l')
vim.keymap.set('', '<M-l>', '<C-w>l')

-- Tabs
vim.keymap.set('', '<C-t>', vim.cmd.tabnew,        { desc = 'New tab' })
vim.keymap.set('', '<C-q>', close_tab,             { desc = 'Close tab' })
vim.keymap.set('', '<Tab>', vim.cmd.tabnext,       { desc = 'Next tab' })
vim.keymap.set('', '<S-Tab>', vim.cmd.tabprevious, { desc = 'Previous tab' })

-- Quickfix
local function ctoggle ()
    local qfix = vim.fn.getqflist({ winid = 0 })
    if qfix.winid == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

vim.keymap.set('', '<leader>q', ctoggle)

vim.keymap.set('', '<leader>$', function()
    vim.ui.input({ prompt = '$' }, function (input)
        if not input or input == '' then
            print("Invalid command.")
            return
        end

        local result = vim.fn.systemlist(input)
        if not result or  result == '' then
            print("No output.")
            return
        end

        vim.cmd('noswapfile new')
        vim.bo.buftype = 'nofile'
        vim.bo.bufhidden = 'wipe'
        vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
    end)
end)

vim.keymap.set('', '<leader>g', ':grep ')
vim.keymap.set('', '<leader>f', ':Find ')
vim.keymap.set('', '<leader>n', '<cmd>cnext<cr>')
vim.keymap.set('', '<leader>N', '<cmd>cprevious<cr>')

-- Outline
local function outline_toggle()
    local prev_wincnt = vim.fn.winnr('$')
    vim.cmd.normal({'gO', bang = true})
    if (prev_wincnt == vim.fn.winnr('$') and vim.o.filetype == "qf") then
        local prev_winnr = vim.fn.winnr()
        vim.cmd.normal({'<c-w>k', bang = true})
        vim.cmd(string.format('%iquit', prev_winnr))
    end
end

vim.keymap.set('', '<leader>u', outline_toggle, { desc = 'Buffer outline' })
vim.keymap.set('', 'gO', outline_toggle, { desc = 'Buffer outline' })


