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
            default_integrations = false,
            auto_integrations = true,
            custom_highlights = function(colors)
                return {
                    Normal   = { fg = colors.none, bg = colors.none },
                    NormalNC = { fg = colors.none, bg = colors.none },
                    NonText  = { fg = colors.none, bg = colors.none },
                    Pmenu    = { fg = colors.subtext0, bg = colors.crust  },
                    PmenuSel = { fg = colors.mauve,    bg = colors.mantle },
                }
            end
        },
        config = function (_, opts)
            require("catppuccin").setup(opts)
            vim.cmd([[
                colorscheme catppuccin
                highlight clear PmenuSbar
                highlight clear PmenuThumb
                highlight link  PmenuSbar  Pmenu
                highlight link  PmenuThumb PmenuSel

            ]])
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
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
                'python', 'bash', 'rust', 'gitignore', 'gitcommit', 'markdown',
                'markdown_inline', 'make', 'cmake', 'typst', 'verilog', 'kotlin',
                'dockerfile', 'yaml', 'xml', 'json', 'javascript', 'typescript',
                'tsx', 'html', 'htmldjango', 'css'
            },
            sync_install = false,
            auto_install = false ,
            ignore_install = {},
            modules = {},

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<Leader>t',
                    node_incremental = '<Leader>ti',
                    scope_incremental = '<Leader>ts',
                    node_decremental = '<Leader>td',
                },
            },
        } ,
    },
}
