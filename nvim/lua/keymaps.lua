-- Normal mode movement
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', '¿', '^')

vim.keymap.set('', '<C-j>', '4gj')
vim.keymap.set('', '<C-k>', '4gk')

vim.keymap.set('', '<C-h>', '10h')
vim.keymap.set('', '<C-l>', '10l')

-- Insert/Cmdline movement
vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<M-f>', '<C-Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<M-b>', '<C-Left>')

vim.keymap.set('!', '<M-h>', '<C-w>')
vim.keymap.set('!', '<C-BS>','<C-w>')
vim.keymap.set('!', '<M-BS>','<C-w>')

vim.keymap.set('!', '<C-d>', '<Delete>')
vim.keymap.set('i', '<M-d>', '<C-o>dw')
vim.keymap.set('c', '<M-d>', '<C-Right><C-w>')

vim.keymap.set('!', '<C-a>', '<Home>')
vim.keymap.set('!', '<C-e>', function ()
    return vim.fn.pumvisible() == 0 and '<End>' or '<C-e>'
end, { expr = true })

vim.keymap.set('c', '<CR>', function()
    return vim.fn.pumvisible() == 0 and '<CR>' or '<C-y>'
end, { expr = true })

vim.keymap.set('i', '<C-CR>', '<C-o>o')
vim.keymap.set('i', '<S-CR>', '<C-o>O')

vim.keymap.set('i', '<C-k>', '<C-o>d$')
vim.keymap.set('c', '<C-k>', function ()
    local until_cursor = vim.fn.getcmdline():sub(1, vim.fn.getcmdpos()-1)
    vim.fn.setcmdline(until_cursor)
end)


-- Editor state
local function clear_highlights()
    vim.cmd.nohlsearch()
    vim.snippet.stop()
end

vim.keymap.set('n', '<Esc>', clear_highlights)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<Leader>L', '<CMD>Lazy<CR>')
vim.keymap.set('n', '<Leader>o', '<CMD>Explore<CR>')
vim.keymap.set('n', '<Leader>O', '<CMD>Explore .<CR>')

-- Tabs
vim.keymap.set('', '<C-t>',   function() vim.cmd('tab vsplit') end)
vim.keymap.set('', '<M-t>',   vim.cmd.tabnew)
vim.keymap.set('', '<C-q>',   vim.cmd.quit)
vim.keymap.set('', 'L',       vim.cmd.tabnext)
vim.keymap.set('', 'H',       vim.cmd.tabprevious)
vim.keymap.set('', '<M-h>',   function() vim.cmd.tabmove('-') end)
vim.keymap.set('', '<M-l>',   function() vim.cmd.tabmove('+') end)

-- Quickfix
local function ccheck()
    local qflist = vim.fn.getqflist({ winid = 0 })
    return qflist.winid ~= 0
end

local function lcheck()
    local loclist = vim.fn.getloclist(vim.fn.winnr(), { winid = 0 })
    return loclist.winid ~= 0
end

local function ctoggle()
    if ccheck() then
        vim.cmd.cclose()
    elseif lcheck() then
        vim.cmd.lclose()
    else
        vim.cmd.copen()
    end
end

local function ltoggle()
    if lcheck() then
        vim.cmd.lclose()
    else
        vim.cmd.cclose()
        vim.cmd.lopen()
    end
end

local function cfilter_interactive()
    vim.cmd.copen()
    vim.api.nvim_feedkeys(':Cfilter ', 'n', true)
end

local function lfilter_interactive()
    vim.cmd.lopen()
    vim.api.nvim_feedkeys(':Lfilter ', 'n', true)
end

vim.keymap.set('', '<Leader>q', ctoggle)
vim.keymap.set('', '<Leader>Q', cfilter_interactive)
vim.keymap.set('', '<Leader>w', ltoggle)
vim.keymap.set('', '<Leader>W', lfilter_interactive)

vim.keymap.set('', '<Leader>n', '<CMD>cnext<CR>')
vim.keymap.set('', '<Leader>p', '<CMD>cprevious<CR>')
vim.keymap.set('', '<Leader>N', '<CMD>lnext<CR>')
vim.keymap.set('', '<Leader>P', '<CMD>lprevious<CR>')

vim.keymap.set('', '<Leader><Leader>n', '<CMD>cnewer<CR>')
vim.keymap.set('', '<Leader><Leader>p', '<CMD>colder<CR>')
vim.keymap.set('', '<Leader><Leader>N', '<CMD>lnewer<CR>')
vim.keymap.set('', '<Leader><Leader>P', '<CMD>lolder<CR>')

vim.keymap.set('', '<Leader>g', ':Grep ')
vim.keymap.set('', '<Leader>f', ':Find ')

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

-- Get buffers
vim.keymap.set('n', '<Leader>B', function ()
    local bufinfo = vim.fn.getbufinfo()
    local buflist = {}

    for _, buf in ipairs(bufinfo) do
        local name = buf['name']
        local changed = buf['changed'] == 1
        if vim.fn.filereadable(name) == 1 or changed then
            table.insert(buflist, {
                bufnr = buf['bufnr'],
                filename = name,
                text = changed and '[+]' or '',
            })
        end
    end

    vim.fn.setqflist(buflist)
    vim.cmd.copen()
end)

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

-- Yank buffer file name
local function yank_file()
    vim.fn.setreg(vim.v.register, vim.fn.expand('%:.'))
end

local function yank_pos()
    local bufinfo = vim.fn.getbufinfo(vim.fn.bufnr())
    local col = bufinfo[1]['lnum']

    vim.fn.setreg(vim.v.register, vim.fn.expand('%:.') .. ':' .. col)
end

vim.keymap.set('n', '<Leader>y', yank_file)
vim.keymap.set('n', '<Leader>Y', yank_pos)

