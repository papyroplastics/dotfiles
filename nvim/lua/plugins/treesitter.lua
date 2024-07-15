return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "query", "c", "cpp",
                    "python", "bash", "glsl", "html", "css", "htmldjango",
                    "gitignore", "gitcommit", "markdown", "make", "cmake"},

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
                        init_selection = "gs",
                        node_incremental = "gi",
                        scope_incremental = "gs",
                        node_decremental = "gd",
                    },
                },
            })
        end,
    },
}
