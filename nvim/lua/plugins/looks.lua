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
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
        cond = Colorterm,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        version = '*',
        lazy = false,
        main = 'ibl',
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
}
