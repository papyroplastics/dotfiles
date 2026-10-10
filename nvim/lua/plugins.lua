vim.pack.add({
    {
        src = 'https://github.com/catppuccin/nvim',
        name = 'catppuccin',
        version = vim.version.range('2.*'),
    },
    {
        src = 'https://github.com/kylechui/nvim-surround',
        name = 'surround',
        version = vim.version.range('4.*'),
    },
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        name = 'lspconfig',
        version = 'master',
    },
    {
        src = 'https://github.com/rafamadriz/friendly-snippets',
        name = 'friendly-snippets',
        version = 'main',
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
    {
        src = 'https://github.com/saghen/blink.cmp',
        name = 'blink.cmp',
        version = vim.version.range('1.*'),
    },
})

if os.getenv('COLORTERM') == 'truecolor' then
    require('catppuccin').setup({
        flavour = 'mocha',
        compile_path = vim.fs.joinpath(vim.fn.stdpath('cache'), 'catppuccin'),
        show_end_of_buffer = true,
        default_integrations = false,
        auto_integrations = false,
        integrations = {
            treesitter_context = true,
            nvim_surround = true,
            blink_indent = true,
            blink_pairs = true,
            blink_cmp = true,
        }
    })
    vim.cmd.colorscheme('catppuccin')
end

local highlights = vim.fn.execute('highlight')
local guibg_match = string.match(highlights, '\nNormal [^\n]*guibg=#(%x%x%x%x%x%x)')

for hl_group in string.gmatch(highlights, "\n(%w+) [^\n]*guibg=%#" .. guibg_match) do
    vim.cmd.highlight(hl_group .. " guibg=none")
end

vim.cmd.highlight('link netrwMarkFile Identifier')

require('nvim-surround').setup({
    move_cursor = 'sticky',
})

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
require('blink.pairs').setup({
    mappings = {
        enabled = true,
        cmdline = true,
        wrap = {
            ['<C-b>'] = false,
            ['<C-S-b>'] = false,

            ['<C-l>'] = 'motion',
            ['<C-h>'] = 'motion_reverse',
        },
    },
    highlights = {
        enabled = true,
        cmdline = true,
    }
})

require('blink.indent').setup({
    scope = { enabled = false },
})

require('blink.cmp').setup({
    cmdline = { enabled = false },
    fuzzy = { implementation = "rust" },
    signature = { enabled = true },
    keymap = {
        preset = 'enter',
        ['<C-s>'] = { 'show_signature', 'hide_signature' },
        ['<C-k>'] = false,
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    },
})

-- Plugin management
vim.api.nvim_create_user_command('PlugList', function (_)
    local plugins = vim.pack.get()
    local plug_str = ''

    for i, plugin in ipairs(plugins) do
        plug_str = plug_str
                    .. i .. ') '
                    .. '[' .. (plugin.active and 'active' or 'inactive') .. '] '
                    .. plugin.spec.name
                    .. '\n'
    end

    vim.print(plug_str)
end, {})

vim.api.nvim_create_user_command('PlugClean', function (_)
    local inactive = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    vim.ui.select({'yes', 'no'}, {
        prompt = 'Delete inactive plugins? ('.. table.concat(inactive, ', ') ..')',
    }, function (_, idx)
        if idx == 1 then
            vim.pack.del(inactive)
        end
    end
    )
end, {})

vim.api.nvim_create_user_command('PlugUpdate', function (_)
    vim.pack.update()
end, {})
