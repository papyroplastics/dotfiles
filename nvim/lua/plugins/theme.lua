
local colorterm = os.getenv("COLORTERM") ~= nil

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        version = "*",
        cond = colorterm,
        lazy = false,
        priority = 1000, config = function()
            require("catppuccin").setup()
            vim.opt.termguicolors = true
            vim.cmd.colorscheme("catppuccin-mocha")
            vim.cmd.highlight("Normal", "ctermbg=none", "guibg=none")
            vim.cmd.highlight("NormalNC", "ctermbg=none", "guibg=none")
            vim.cmd.highlight("NonText", "ctermbg=none", "guibg=none")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        cond = colorterm,
        config = function ()
            vim.opt.showmode = false
            require("lualine").setup({
                sections = {
                    lualine_x = {"filetype"},
                }
            })
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
        cond = colorterm,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        cond = colorterm,
        opts = {
            scope = { enabled = false },
        },
    },
}
