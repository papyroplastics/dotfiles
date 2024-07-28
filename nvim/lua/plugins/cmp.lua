return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local cmp = require("cmp")

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                experimental = {
                    ghost_text = true,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),

                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),

                    ["<C-h>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-l>"] = cmp.mapping.scroll_docs(4),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "lazydev", },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
