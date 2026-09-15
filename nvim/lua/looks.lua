vim.pack.add({
    {
        src = 'https://github.com/catppuccin/nvim',
        name = 'catppuccin',
        version = vim.version.range('2.*'),
    },
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        name = 'treesitter',
        version = 'main',
    },
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
        name = 'treesitter-context',
        version = 'master',
    },
    {
        src = 'https://github.com/saghen/blink.lib',
        version = 'main'
    },
    {
        src = 'https://github.com/saghen/blink.pairs',
        version = vim.version.range('*')
    },
    {
        src = 'https://github.com/saghen/blink.indent',
        name = 'blink.indent',
        version = vim.version.range('2.*'),
    },
})

if os.getenv('COLORTERM') == 'truecolor' then
    if os.getenv('TERM') == 'xterm-kitty' then
        require('catppuccin').setup({
            flavour = "mocha",
            show_end_of_buffer = true,
            default_integrations = false,
            auto_integrations = false,
            integrations = {
                blink_cmp = true,
                blink_indent = true,
                blink_pairs = true,
            }
        })
        vim.cmd.colorscheme('catppuccin')
    else
        vim.cmd.colorscheme('retrobox')
    end

    local highlights = vim.fn.execute('highlight')
    local guibg_match = string.match(highlights, '\nNormal [^\n]*guibg=#(%x%x%x%x%x%x)')

    for hl_group in string.gmatch(highlights, "\n(%w+) [^\n]*guibg=%#" .. guibg_match) do
        vim.cmd.highlight(hl_group .. " guibg=none")
    end

    vim.cmd.highlight('link netrwMarkFile Identifier')
end

require('nvim-treesitter').install({
    'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
    'python', 'bash', 'rust', 'gitignore', 'gitcommit', 'markdown',
    'markdown_inline', 'make', 'cmake', 'typst', 'systemverilog',
    'dockerfile', 'yaml', 'xml', 'json', 'javascript', 'typescript',
    'tsx', 'html', 'htmldjango', 'css'
})
require('treesitter-context').setup({
    max_lines = '15%',
    multiline_threshold = 2,
})

require('blink.pairs').download():pwait(60000)
require('blink.pairs').setup()
require('blink.indent').setup({
    scope = { enabled = false },
})

