return {
    {
        'neovim/nvim-lspconfig',
        varsion = '*',
        config = false,
    },
    {
        'saghen/blink.cmp',
        cond = false,
        version = '*',
        event = 'InsertEnter',
        opts = {
            keymap = { preset = 'enter', },
            cmdline = { enabled = false },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
}
