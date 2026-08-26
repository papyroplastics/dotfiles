return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        cond = Catppuccin,
        version = '*',
        lazy = false,
        opts = {
            flavour = "mocha",
            show_end_of_buffer = true,
            default_integrations = false,
            auto_integrations = true,
        },
    },
    {
        'saghen/blink.indent',
        version = '*',
        lazy = false,
        cond = Colorterm,
        opts = {
            scope = { enabled = false },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = function()
            local ts = require('nvim-treesitter')
            ts.update()
            ts.install({
                'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
                'python', 'bash', 'rust', 'gitignore', 'gitcommit', 'markdown',
                'markdown_inline', 'make', 'cmake', 'typst', 'systemverilog',
                'dockerfile', 'yaml', 'xml', 'json', 'javascript', 'typescript',
                'tsx', 'html', 'htmldjango', 'css'
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = false,
        dependencies = 'nvim-treesitter',
        opts = {
            max_lines = '15%',
            multiline_threshold = 2,
        }
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
        dependencies = 'nvim-treesitter',
        cond = Colorterm,
    },
}
