
-- Misc
local function clear_highlights()
    vim.cmd.nohlsearch()
    vim.snippet.stop()
end

vim.keymap.set('n', '<Esc>', clear_highlights)
vim.keymap.set('n', '<Leader>L', '<CMD>Lazy<CR>')
vim.keymap.set('n', '<Leader>o', '<CMD>Explore<CR>')
vim.keymap.set('n', '<Leader>O', '<CMD>Explore .<CR>')

-- Basic movement
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', '¿', '^')

vim.keymap.set('', '<C-j>', '4gj')
vim.keymap.set('', '<C-k>', '4gk')

vim.keymap.set('', '<C-n>', '12gj')
vim.keymap.set('', '<C-p>', '12gk')

vim.keymap.set('', '<C-h>', '10h')
vim.keymap.set('', '<C-l>', '10l')

-- Tabs
vim.keymap.set('', '<C-t>',   function() vim.cmd('tab vsplit') end)
vim.keymap.set('', '<M-t>',   vim.cmd.tabnew)
vim.keymap.set('', '<C-q>',   vim.cmd.quit)
vim.keymap.set('', 'L',       vim.cmd.tabnext)
vim.keymap.set('', 'H',       vim.cmd.tabprevious)
vim.keymap.set('', '<M-h>',   function() vim.cmd.tabmove('-') end)
vim.keymap.set('', '<M-l>',   function() vim.cmd.tabmove('+') end)

-- Quickfix
local function ctoggle()
    local qflist = vim.fn.getqflist({ winid = 0 })

    if qflist.winid == 0 then
        local loclist = vim.fn.getloclist(vim.fn.winnr(), { winid = 0 })
        if loclist.winid == 0 then
            vim.cmd.copen()
        else
            vim.cmd.lclose()
        end
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
    if vim.o.filetype == 'qf' then
        return '<C-w>q' .. vim.fn.winnr() - 1 .. '<C-w>' .. 'w'
    else
        return 'gO'
    end
end

vim.keymap.set('', '<Leader>u', outline_toggle, { expr = true })
vim.keymap.set('', 'gO',        outline_toggle, { expr = true })

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

vim.keymap.set('i', '<C-CR>', '<C-o>o')
vim.keymap.set('i', '<S-CR>', '<C-o>O')

-- Find modified buffers
vim.keymap.set('n', '<Leader>b', function ()
    local bufinfo = vim.fn.getbufinfo()
    local buflist = {}

    for _, buf in ipairs(bufinfo) do
        if buf['changed'] == 1 then
            local name = buf['name']
            if name == "" then
                name = '[No Name]'
            end

            table.insert(buflist, {
                bufnr = buf['bufnr'],
                filename = name,
            })
        end
    end

    vim.fn.setqflist(buflist)
    vim.cmd.copen()
end)


