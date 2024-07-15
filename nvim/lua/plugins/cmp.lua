return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "L3MON4D3/LuaSnip",             version = "*" },
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },

        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
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
                    { name = "lazydev", },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
