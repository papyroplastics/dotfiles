return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        version = "*",
        config = function()
            local wk = require("which-key")
            wk.setup()

            wk.register(
                {
                    h = { name = "harpoon" },
                    b = { name = "buffer" },
                    t = { name = "tabs" },
                    l = { name = "lsp" },
                    d = { name = "debug" },
                    dw = { name = "widgets" },
                    ["<leader>"] = { name = "telescope" },
                }, {
                    prefix = "<leader>"
                }
            )
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
