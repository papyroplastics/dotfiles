return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {'lua', 'vim', 'vimdoc', 'query', 'c', 'cpp',
                    'python', 'bash', 'rust', 'gitignore', 'gitcommit', 'markdown',
                    'markdown_inline', 'make', 'cmake', 'racket', 'haskell',
                    'verilog', 'kotlin', 'dockerfile', 'yaml', 'xml', 'json',
                    'javascript', 'typescript', 'tsx', 'html', 'htmldjango', 'css'},
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
                        init_selection = '<leader>g',
                        node_incremental = '<leader>gi',
                        scope_incremental = '<leader>gs',
                        node_decremental = '<leader>gd',
                    },
                },
            })
        end,
    },
}
