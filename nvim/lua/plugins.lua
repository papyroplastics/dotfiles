
-- lazy seems to overrides plugin loading so doing:
-- vim.cmd.packadd({ 'cfilter', bang = true })
-- doesn't work until migrate to vim.pack
vim.schedule(function ()
    vim.cmd.packadd('cfilter')
    vim.cmd.packadd('nvim.undotree')
    vim.cmd.packadd('nvim.difftool')

    local no_args = vim.fn.argc(-1) == 0
    local empty_buf = vim.fn.wordcount()['bytes'] == 0
    local unchanged = vim.fn.getbufinfo(vim.fn.bufnr())[1].changed == 0

    if no_args and empty_buf and unchanged then
        vim.cmd.edit('.')
    end
end)

