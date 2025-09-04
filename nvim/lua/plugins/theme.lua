
return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        version = '*',
        cond = Colorterm,
        lazy = false,
        priority = 900,
        config = function()
            vim.opt.termguicolors = true
            require('catppuccin').setup()

            vim.cmd([[
                colorscheme catppuccin-mocha
                highlight Normal   ctermbg=none guibg=none
                highlight NormalNC ctermbg=none guibg=none
                highlight NonText  ctermbg=none guibg=none
            ]])
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        enabled = false,
        cond = Colorterm,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VeryLazy',
        config = function ()
            vim.opt.showmode = false
            vim.opt.showtabline = 0

            require('lualine').setup({
                options = {
                    ignore_focus = {
                        'neo-tree',
                    },
                },
                sections = {
                    lualine_b = {{
                        'tabs',
                        tab_max_length = 15,
                        show_modified_status = false,
                    }},
                    lualine_x = {'filetype'},
                }
            })
        end
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
        priority = 800,
        cond = Colorterm,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        cond = Colorterm,
        opts = {
            scope = { enabled = false },
        },
    },
}
