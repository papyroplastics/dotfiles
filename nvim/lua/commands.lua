
vim.cmd.cabbrev('S', '%s')

vim.api.nvim_create_user_command('Wrap', function ()
    if vim.o.wrap then
        vim.o.wrap = false
        print('  nowrap')
        vim.keymap.del('', 'k')
        vim.keymap.del('', 'j')
        vim.keymap.del('', '$')
        vim.keymap.del('', '0')
        vim.keymap.del('', '^')
    else
        vim.o.wrap = true
        print('  wrap')
        vim.keymap.set('', 'k', 'gk')
        vim.keymap.set('', 'j', 'gj')
        vim.keymap.set('', '$', 'g$')
        vim.keymap.set('', '0', 'g0')
        vim.keymap.set('', '^', 'g^')
    end
end, {})

vim.api.nvim_create_user_command('Config', function ()
    vim.cmd.tabnew()
    vim.cmd.tcd(vim.fn.stdpath('config'))
    vim.cmd.normal(vim.g.mapleader .. 'e')
end, {})

--- Quickfix list facilities
local function cmd_to_qflist(command, handler)
    vim.fn.setqflist({}, 'r')
    local no_output = true

    local function stdout_handler(err, data)
        if data and data ~= '' then
            vim.schedule(function() 
                handler(data)
                if no_output then
                    vim.schedule(vim.cmd.copen)
                    no_output = false
                end
            end)
        end
    end

    local function on_exit(out) 
        if out.code ~= 0 and out.stderr and out.stderr ~= '' then
            vim.print(out.stderr)
        end
    end

    vim.system(command, { stdout = stdout_handler, text = true, }, on_exit)
end


vim.api.nvim_create_user_command('Find', function (opts)
    local command = { 'fd', '-t', 'f', '--', table.concat(opts.fargs, ' ') }
        
    cmd_to_qflist(command, function (data)
        filenames = {}
        for s in vim.gsplit(data, '\n', { plain=true, trimempty = true }) do
            table.insert(filenames, { filename = s })
        end
        vim.fn.setqflist(filenames, 'a')
    end)
end, { nargs = '+' })


vim.api.nvim_create_user_command('Grep', function (opts)
    local command = { 'rg', '--vimgrep', '--', table.concat(opts.fargs, ' ') }

    cmd_to_qflist(command, function (data)
        lines = {}
        for s in vim.gsplit(data, '\n', { plain=true, trimempty = true}) do
            table.insert(lines, s)
        end
        vim.fn.setqflist({}, 'a', { lines = lines, nr = 0, })
    end)

end, { nargs = '+' })

vim.cmd.cabbrev('find', 'Find')
vim.cmd.cabbrev('fd', 'Find')
vim.cmd.cabbrev('grep', 'Grep')
vim.cmd.cabbrev('gr', 'Grep')
vim.cmd.cabbrev('rg', 'Grep')

-- For use as pager for kitty
vim.api.nvim_create_user_command('PagerSetLine', function (opts)
    vim.opt.number = false
    vim.opt.relativenumber = false

    local scroll_line = tonumber(opts.fargs[1])

    if (scroll_line ~= nil) then
        local term_height = vim.o.lines
        local half_term = math.floor(term_height / 2)

        if vim.fn.getline('$') ~= '' then 
            half_term = half_term + 1
        end

        local buf_len = vim.fn.line('$')

        vim.fn.setpos('.', { 0, buf_len - (scroll_line + half_term), 0, 0 })
    end
        
end, { nargs = '?' })

