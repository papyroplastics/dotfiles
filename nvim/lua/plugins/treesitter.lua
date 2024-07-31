
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local filetypes = { 'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
                'python', 'bash', 'rust', 'gitignore', 'gitcommit',
                'markdown', 'make', 'cmake' }

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
