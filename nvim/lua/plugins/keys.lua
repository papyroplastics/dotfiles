return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local wk = require("which-key")
            wk.setup({
                icons = {
                    rules = false,
                    color = false
                }
            })
            wk.add({
                { "<leader>h", group = "harpoon" },
                { "<leader>b", group = "buffes" },
                { "<leader>t", group = "tabs" },
                { "<leader>l", group = "lsp" },
                { "<leader><leader>", group= "telescope" },

                { "<leader>w", hidden = true },
                { "<leader>a", hidden = true },
                { "<leader>q", hidden = true },

                { "<leader>0", hidden = true },
                { "<leader>1", hidden = true },
                { "<leader>2", hidden = true },
                { "<leader>3", hidden = true },
                { "<leader>4", hidden = true },
                { "<leader>5", hidden = true },
                { "<leader>6", hidden = true },
                { "<leader>7", hidden = true },
                { "<leader>8", hidden = true },
                { "<leader>9", hidden = true },
            })
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
}
