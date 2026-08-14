
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

-- Edit Neovim config
vim.api.nvim_create_user_command('Config', function ()
    vim.cmd.tabnew()
    vim.cmd.tcd(vim.fn.stdpath('config'))
    vim.cmd.edit('.')
end, {})

-- For use as pager for kitty
vim.api.nvim_create_user_command('PagerSetLine', function (opts)
    vim.cmd.file('scrollback')
    vim.opt_local.buftype = 'nofile'
    vim.opt_local.bufhidden = 'hide'
    vim.opt_local.swapfile = false

    vim.opt_local.readonly = true
    vim.opt_local.modifiable = false

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

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


--- Filesystem search utilities
function get_search_path()
    local current_dir = vim.fn.expand('%:p:h')
    local no_proto = string.gsub(current_dir, '^%l*://', '', 1)
    --local relative = vim.fs.relpath(vim.fn.getcwd(), no_proto, {})
    return no_proto
end

vim.api.nvim_create_user_command('SearchPath', function (_)
    vim.print(get_search_path())
end, {})

local function cmd_to_qflist(cmd_prefix, args, handler)
    local command = cmd_prefix
    for _, arg in ipairs(args) do
        table.insert(command, arg)
    end
    table.insert(command, get_search_path())

    vim.fn.setqflist({})

    local no_output = true
    local function stdout_handler(_, data)
        if data and data ~= '' then
            vim.schedule(function()
                handler(data)
                if no_output then
                    vim.cmd.copen()
                    no_output = false
                end
            end)
        end
    end

    local function on_exit(out)
        if out.code ~= 0 and out.stderr and out.stderr ~= '' then
            vim.print(out.stderr)
        elseif no_output then
            vim.print('No output')
        end
    end

    vim.print(table.concat(command, ' ') .. '\n .')
    vim.system(command, { stdout = stdout_handler, text = true }, on_exit)
end

vim.api.nvim_create_user_command('Find', function (opts)
    cmd_to_qflist(
        {'fd'}, opts.fargs,
        function (data)
            local filenames = {}
            for s in vim.gsplit(data, '\n', { plain=true, trimempty = true }) do
                table.insert(filenames, { filename = s })
            end
            vim.fn.setqflist(filenames, 'a')
        end
    )
end, { nargs = '+' })


vim.api.nvim_create_user_command('Grep', function (opts)
    cmd_to_qflist(
        {'rg', '--vimgrep', '--smart-case'}, opts.fargs,
        function (data)
            local lines = {}
            for s in vim.gsplit(data, '\n', { plain=true, trimempty = true}) do
                table.insert(lines, s)
            end
            vim.fn.setqflist({}, 'a', { lines = lines, nr = 0, })
        end
    )
end, { nargs = '+' })

