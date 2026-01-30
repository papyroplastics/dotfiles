local colorterm = os.getenv('COLORTERM') ~= nil

return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        cond = colorterm,
        version = '*',
        lazy = false,
        opts = {
            flavour = "mocha",
            show_end_of_buffer = true,
            default_integrations = false,
            auto_integrations = true,
            custom_highlights = function(colors)
                return {
                    Normal   = { fg = colors.none, bg = colors.none   },
                    NormalNC = { fg = colors.none, bg = colors.none   },
                    NonText  = { fg = colors.none, bg = colors.none   },
                }
            end
        },
        config = function (_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
        cond = colorterm,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        version = '*',
        lazy = false,
        main = 'ibl',
        cond = colorterm,
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
