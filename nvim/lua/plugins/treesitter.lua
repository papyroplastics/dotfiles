
return {
    {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.2',
        build = ':TSUpdate',
        config = function()
            local filetypes = { 'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
                'python', 'bash', 'rust', 'gitignore', 'gitcommit',
                'markdown', 'make', 'cmake', 'racket'}

            require('nvim-treesitter.configs').setup({
                ensure_installed = filetypes,
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
                        init_selection = 'gs',
                        node_incremental = 'gi',
                        scope_incremental = 'gs',
                        node_decremental = 'gd',
                    },
                },
            })
        end,
    },
}
