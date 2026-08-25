
vim.cmd.cabbrev('S', '%s')
vim.cmd.cabbrev('man', 'Man')
vim.cmd.cabbrev('f-', 'Lfilter! ^-')

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
local function cmd_to_qflist(cmd_prefix, args, efm)
    local command = cmd_prefix
    for _, arg in ipairs(args) do
        table.insert(command, arg)
    end

    local line_limit = 50000
    local time_limit = 1000

    local cmd_bin = cmd_prefix[1]
    local cmd_str = table.concat(command, ' ')
    local cmd_ind = "cmd: " .. cmd_str

    local raw_cwd = vim.fn.expand('%:p:h')
    local cwd = string.gsub(raw_cwd, '^%l*://', '', 1)
    local cwd_relative = vim.fn.fnamemodify(cwd, ':~:.')
    local cwd_ind = "cwd: " .. cwd_relative

    local function on_exit(out)
        if out.code ~= 0 and out.stderr and out.stderr ~= '' then
            vim.print(
                cmd_bin .. ' exited an error\n'
                .. 'code:' .. out.code .. '\n'
                .. cmd_ind .. '\n'
                .. cwd_ind .. '\n'
                .. 'stderr:' .. out.stderr
            )
        end

        if not out.stdout or out.stdout == '' then
            vim.print(
                cmd_bin .. ' had no output\n'
                .. cmd_ind .. '\n'
                .. cwd_ind .. '\n'
            )
        else
            vim.schedule(function ()
                local lines = { cmd_ind, cwd_ind }
                local line_count = 0

                for s in vim.gsplit(out.stdout, '\n', { plain=true, trimempty = true }) do
                    table.insert(lines, s)

                    line_count = line_count + 1
                    if line_count >= line_limit then
                        vim.print(cmd_bin .. ' outputted too many lines,stopping at ' .. line_limit)
                        break
                    end
                end

                vim.fn.setqflist({})
                vim.fn.setqflist({}, 'a', {
                    efm =  '%Dcwd: %f,%+Gcmd: %.%#,' .. efm,
                    lines = lines,
                    nr = 0,
                })
                vim.cmd.copen()
            end)
        end
    end

    local cmd_opts = {
        cwd = cwd,
        stdout = true,
        text = false,
        timeout = time_limit,
    }
    vim.system(command, cmd_opts, on_exit)
end

vim.api.nvim_create_user_command('Find', function (opts)
    cmd_to_qflist({'fd'}, opts.fargs, '%f')
end, { nargs = '+' })

vim.api.nvim_create_user_command('Grep', function (opts)
    local cmd = {'rg', '--vimgrep', '--smart-case'}
    cmd_to_qflist(cmd, opts.fargs, '%f:%l:%c:%m')
end, { nargs = '+' })

