-- Miscellaneous
local function keymap_set_pum(mode, lhs, rhs, rhs_pum)
    vim.keymap.set(mode, lhs, function ()
        return vim.fn.pumvisible() ~= 0 and rhs_pum or rhs
    end, { expr = true })
end

local function clear_highlights()
    vim.cmd.nohlsearch()
    vim.snippet.stop()
end

vim.keymap.set('n', '<Esc>', clear_highlights)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Normal mode movement
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', '$', 'g$')
vim.keymap.set('', '0', 'g0')
vim.keymap.set('', '^', 'g^')
vim.keymap.set('', '¿', 'g^')

vim.keymap.set('', '<C-j>', '4gj')
vim.keymap.set('', '<C-k>', '4gk')
vim.keymap.set('', '<C-h>', '10h')
vim.keymap.set('', '<C-l>', '10l')

-- Insert/Cmdline movement
vim.keymap.set('!', '<C-n>', '<Down>')
vim.keymap.set('!', '<C-p>', '<Up>')

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

keymap_set_pum('!', '<C-e>', '<End>', '<C-e>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('i', '<C-a>', function ()
    local pos = vim.fn.getpos('.')
    local col = pos[3]
    return col == 1 and '<C-o>^' or '<Home>'
end, { expr = true })

vim.keymap.set('i', '<C-CR>', '<C-o>o')
vim.keymap.set('i', '<S-CR>', '<C-o>O')

vim.keymap.set('i', '<C-k>', '<C-o>d$')
vim.keymap.set('c', '<C-k>', function ()
    local until_cursor = vim.fn.getcmdline():sub(1, vim.fn.getcmdpos()-1)
    vim.fn.setcmdline(until_cursor)
end)

-- Tabs
vim.keymap.set('', '<C-t>',   function() vim.cmd('tab vsplit') end)
vim.keymap.set('', '<M-t>',   vim.cmd.tabnew)
vim.keymap.set('', '<C-q>',   vim.cmd.quit)
vim.keymap.set('', 'L',       vim.cmd.tabnext)
vim.keymap.set('', 'H',       vim.cmd.tabprevious)
vim.keymap.set('', '<M-h>',   function() vim.cmd.tabmove('-') end)
vim.keymap.set('', '<M-l>',   function() vim.cmd.tabmove('+') end)

-- Netrw
local scopes = {'b', 'w', 't', 'g'}
local function get_ret_buf()
    for _, s in ipairs(scopes) do
        local buf = vim[s].my_netrw_ret_buf
        if buf and vim.fn.bufexists(buf) then
            return buf
        end
    end
end
local function set_ret_buf()
    local buf = vim.api.nvim_get_current_buf()
    for _, s in ipairs(scopes) do
        vim[s].my_netrw_ret_buf = buf
    end
end

local function open_explorer()
    if vim.o.filetype ~= 'netrw' then
        local filepath = vim.fn.expand('%')
        local filename = vim.fn.expand('%:t')
        set_ret_buf()

        vim.cmd.Explore()

        if vim.uv.fs_stat(filepath) then
            local pattern = '^\\C\\V' .. filename .. '*\\?\\$'

            vim.fn.cursor(1,1)
            local res = vim.fn.search(pattern, 'c', 200)

            if res == 0 then
                local pointed = vim.uv.fs_readlink(filepath)
                vim.print(pointed)
                if pointed ~= nil then
                    pattern = '^\\C\\V' .. filename .. '@\\t --> ' .. pointed
                    vim.print(pattern)
                    vim.fn.search(pattern, 'c', 200)
                end
            end
        end
    else
        local buf = get_ret_buf()
        if buf then
            vim.api.nvim_set_current_buf(buf)
        else
            vim.cmd.enew()
        end
    end
end

local function open_explorer_cwd()
    if vim.o.filetype ~= 'netrw' then
        set_ret_buf()
    end
    vim.cmd.Explore(vim.fn.getcwd())
end

vim.keymap.set('n', '<Leader>o', open_explorer)
vim.keymap.set('n', '<Leader>O', open_explorer_cwd)


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

local function cfilter()
    vim.cmd.lclose()
    vim.cmd.copen()
    vim.api.nvim_feedkeys(':Cfilter ', 'n', true)
end

local function lfilter()
    vim.cmd.cclose()
    vim.cmd.lopen()
    vim.api.nvim_feedkeys(':Lfilter ', 'n', true)
end

local function mux_lists(qf_cb, loc_cb)
    return function ()
        if lcheck() then
            loc_cb()
        else
            qf_cb()
        end
    end
end

vim.keymap.set('', '<Leader>q', ctoggle)
vim.keymap.set('', '<Leader>Q', cfilter)
vim.keymap.set('', '<Leader>w', ltoggle)
vim.keymap.set('', '<Leader>W', lfilter)

vim.keymap.set('', '<Leader>n', mux_lists(vim.cmd.cnext, vim.cmd.lnext))
vim.keymap.set('', '<Leader>p', mux_lists(vim.cmd.cprevious, vim.cmd.lprevious))

vim.keymap.set('', '<Leader><Leader>n', mux_lists(vim.cmd.cnewer, vim.cmd.lnewer))
vim.keymap.set('', '<Leader><Leader>p', mux_lists(vim.cmd.colder, vim.cmd.lolder))

vim.keymap.set('', '<Leader>g', ':Grep ')
vim.keymap.set('', '<Leader>f', ':Find ')

-- Command to scratch buffer
local function cmd_to_scratchbuf()
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
end

vim.keymap.set('', '<Leader>$', cmd_to_scratchbuf)

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

-- Get buffer list
local function changed_to_qflist()
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
end
local function open_files_to_qflist()
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
end

vim.keymap.set('n', '<Leader>b', changed_to_qflist)
vim.keymap.set('n', '<Leader>B', open_files_to_qflist)

-- Yank buffer file name
local function yank_file(absolute)
    local filename = vim.fn.expand('%')
    if not filename or filename == '' then
        filename = vim.fn.getbufinfo(vim.fn.bufnr())[1]['name']
    end

    if vim.o.filetype == 'netrw' then
        if not filename or filename == '' then
            filename = vim.b.netrw_curdir
        end

        filename = vim.fs.joinpath(filename, vim.fn.expand('<cfile>'))
    end

    filename = vim.fn.fnamemodify(filename, absolute and ':p:~' or ':~:.')
    vim.fn.setreg(vim.v.register, filename)
end

vim.keymap.set('n', '<Leader>y', function() yank_file(false) end)
vim.keymap.set('n', '<Leader>Y', function() yank_file(true) end)

-- Surround
vim.pack.add({
    {
        src = 'https://github.com/kylechui/nvim-surround',
        name = 'surround',
        version = vim.version.range('4.*'),
    },
})

require('nvim-surround').setup({
    move_cursor = 'sticky',
})

