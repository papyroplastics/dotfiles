return {
    {
        "folke/lazydev.nvim",
        lazy = true,
        ft = "lua",
        version = "*",
        opts = {},
    },

    {
        "williamboman/mason.nvim",
        varsion = "*",
        lazy = true,
        cmd = "Mason",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        varsion = "*",
        lazy = true,
        opts = {
            ensure_installed = { "basedpyright", "cssls", "html", "clangd", "lua_ls", "neocmake"},
        },
    },

    {
        "neovim/nvim-lspconfig",
        varsion = "*",
        ft = { "python", "css", "html", "c", "cpp", "lua", "cmake" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
        },

        keys = {
            { "<leader>lh", vim.lsp.buf.hover,          desc = "Show hover" },
            { "<leader>la", vim.lsp.buf.code_action,    desc = "Code action" },
            { "<leader>ld", vim.lsp.buf.definition,     desc = "Go to definition" },
            { "<leader>li", vim.lsp.buf.implementation, desc = "Go to implementation" },
            { "<leader>lr", vim.lsp.buf.rename,         desc = "Go to implementation" },
            { "<leader>lr", vim.lsp.buf.format,         desc = "Go to implementation" },
        },

        config = function()
            local lspconfig = require("lspconfig")
            local capab = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.basedpyright.setup({
                capabilities = capab,
                settings = {
                    basedpyright= {
                        analysis = {
                            typeCheckingMode = "off"
                        }
                    }
                }
            })

            lspconfig.cssls.setup({
                capabilities = capab,
            })

            local clangd_capab = require("cmp_nvim_lsp").default_capabilities()
            clangd_capab.textDocument.semanticHighlighting = true
            clangd_capab.offsetEncoding = "utf-16"

            lspconfig.clangd.setup({
                capabilities = clangd_capab,
            })

            lspconfig.html.setup({
                capabilities = capab,
                filetypes = {"htmldjango", "html"}
            })

            lspconfig.lua_ls.setup({
                capabilities = capab,
            })

            lspconfig.neocmake.setup({
                capabilities = capab,
            })

        end,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        keys = {
            {
                "<leader>r",
                "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
                desc = "Diagnostics",
            },
            {
                "<leader>o",
                "<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>",
                desc = "Symbols",
            },
        },
    },
}
