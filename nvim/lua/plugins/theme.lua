
local colorterm = os.getenv("COLORTERM") ~= nil

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        version = "*",
        cond = colorterm,
        lazy = false,
        priority = 1000, config = function() require("catppuccin").setup() vim.cmd.colorscheme("catppuccin-mocha") vim.cmd.highlight("Normal", "ctermbg=none", "guibg=none") vim.cmd.highlight("NormalNC", "ctermbg=none", "guibg=none") vim.cmd.highlight("NonText", "ctermbg=none", "guibg=none")
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
        "folke/noice.nvim",
        version = "*",
        event = "VeryLazy",
        cond = colorterm,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function ()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end
    }
}
