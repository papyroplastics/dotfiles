
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
    {
        "srcarriga/nvim-notify",
        version = "*",
        lazy = true,
        cond = colorterm,
        opts = {
            background_colour = "#181826",
            fps = 1,
            level = 3,
            render = "wrapped-compact",
            stages = nil,
            timeout = 3000,
        },
    },
    {
        "folke/noice.nvim",
        version = "*",
        event = "VeryLazy",
        cond = colorterm,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        }
    },
}
