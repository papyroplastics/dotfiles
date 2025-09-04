
vim.cmd.cabbrev('S', '%s')

vim.api.nvim_create_user_command('Wrapon', function ()
    vim.o.wrap = true
    vim.keymap.set('', 'k', 'gk')
    vim.keymap.set('', 'j', 'gj')
    vim.keymap.set('', '$', 'g$')
    vim.keymap.set('', '0', 'g0')
    vim.keymap.set('', '^', 'g^')
end, {})

vim.api.nvim_create_user_command('Wrapoff', function()
    vim.o.wrap = false
    vim.keymap.set('', 'k', 'k')
    vim.keymap.set('', 'j', 'j')
    vim.keymap.set('', '$', '$')
    vim.keymap.set('', '0', '0')
    vim.keymap.set('', '^', '^')
end, {})

vim.api.nvim_create_user_command('Config', function ()
    vim.cmd.tabnew()
    vim.cmd.tcd(vim.fn.stdpath('config'))
end, {})

vim.api.nvim_create_user_command('Find', function (opts)
    local command = {'fd', '-t', 'f', '--', table.concat(opts.fargs, ' ')}

    vim.fn.setqflist({}, 'r')

    vim.system(command, { stdout = function(err, data)
        print(data) 

    end}, function(...) end)

    local qflist = {}
    for i, s in ipairs(files) do
        qflist[i] = { filename = s }
    end

    vim.fn.setqflist(qflist)
    vim.cmd.copen()
end, { nargs='+' })

vim.cmd.cabbrev('fd', 'Find')
vim.cmd.cabbrev('find', 'Find')
vim.cmd.cabbrev('rg', 'grep')

