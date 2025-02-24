
local colorterm = os.getenv('COLORTERM') ~= nil

if not colorterm then
    vim.cmd.colorscheme('vim')
end

return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        version = '*',
        cond = colorterm,
        lazy = false,
        priority = 1000, config = function()
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
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VeryLazy',
        cond = colorterm,
        config = function ()
            vim.opt.showmode = false
            require('lualine').setup({
                sections = {
                    lualine_x = {'filetype'},
                }
            })
        end
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        lazy = false,
        cond = colorterm,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        cond = colorterm,
        opts = {
            scope = { enabled = false },
        },
    },
}
