return {
    {
        "hrsh7th/nvim-cmp",
        event = {"InsertEnter", "CmdlineEnter"},
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")

            local toggle_docs = function (callback)
                if cmp.visible() then
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                else
                    callback()
                end
            end

            local select_prev_item = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end

            local select_next_item = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end

            local scroll_docs_up = function()
                if cmp.visible() then
                    cmp.scroll_docs(-4)
                else
                    cmp.complete()
                end
            end

            local scroll_docs_down = function()
                if cmp.visible() then
                    cmp.scroll_docs(4)
                else
                    cmp.complete()
                end
            end

            local confirm_select = function(callback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    callback()
                end
            end

            local confirm_noselect = function(callback)
                if cmp.visible() then
                    if not cmp.confirm({ select = false }) then
                        callback()
                    end
                else
                    callback()
                end
            end

            local confirm_nocallback = function ()
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    cmp.complete()
                end
            end

            local toggle_complete = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end

            local mappings = {
                ["<C-Space>"] = cmp.mapping(toggle_complete, {"i","c"}),
                ["<tab>"] = {
                    i = confirm_select,
                    c = confirm_nocallback,
                },
                ["<CR>"] = {
                    i = confirm_select,
                    c = confirm_noselect,
                },

                ["<C-k>"] = cmp.mapping(select_prev_item, {"i", "c"}),
                ["<C-j>"] = cmp.mapping(select_next_item, {"i", "c"}),

                ["<C-d>"] = cmp.mapping(toggle_docs, {"i", "c"}),
                ["<C-h>"] = cmp.mapping(scroll_docs_up, {"i", "c"}),
                ["<C-l>"] = cmp.mapping(scroll_docs_down, {"i", "c"}),
            }


            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                view = {
                    docs = { auto_open = false },
                },

                experimental = {
                    ghost_text = true,
                },

                mapping = mappings,

                sources = cmp.config.sources( {
                        { name = "nvim_lsp" },
                        { name = "nvim_lsp_signature_help" },
                    }, {
                        { name = "lazydev" },
                        { name = "buffer" }
                    }
                )
            })

            cmp.setup.cmdline(":", {
                mapping = mappings,
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" }
                })
            })

            cmp.setup.cmdline("/", {
                mapping = mappings,
                sources = cmp.config.sources({
                    { name = "buffer" },
                    { name = "nvim_lsp_document_symbol" }
                })
            })
        end,
    },
}
