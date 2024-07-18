return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader><leader>t", "<cmd>Telescope<cr>", desc = "Show builtins"},
            { "<leader><leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffer list" },
            { "<leader><leader>f", "<cmd>Telescope find_files<cr>", desc = "Find file" },
            { "<leader><leader>g", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep" },
            { "<leader><leader>j", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { "<leader><leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy finder" },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            Harpoon = require("harpoon")
            Harpoon:setup()
        end,
        keys = {
            {"<leader>hl", function() Harpoon.ui:toggle_quick_menu(Harpoon:list()) end, desc = "List hooks"},

            {"<leader>ha", function() Harpoon:list():add() end,    desc = "Add hook"},
            {"<leader>hr", function() Harpoon:list():remove() end, desc = "Remove hook"},

            {"<leader>hp", function() Harpoon:list():prev({ui_nav_wrap = true}) end, desc = "Previous hook"},
            {"<leader>hn", function() Harpoon:list():next({ui_nav_wrap = true}) end, desc = "Next hook"},
            {"<tab>",      function() Harpoon:list():prev({ui_nav_wrap = true}) end, desc = "Previous hook"},
            {"<s-tab>",    function() Harpoon:list():next({ui_nav_wrap = true}) end, desc = "Next hook"},

            {"<leader>0", function() Harpoon:list():select(0) end},
            {"<leader>1", function() Harpoon:list():select(1) end},
            {"<leader>2", function() Harpoon:list():select(2) end},
            {"<leader>3", function() Harpoon:list():select(3) end},
            {"<leader>4", function() Harpoon:list():select(4) end},
            {"<leader>5", function() Harpoon:list():select(5) end},
            {"<leader>6", function() Harpoon:list():select(6) end},
            {"<leader>7", function() Harpoon:list():select(7) end},
            {"<leader>8", function() Harpoon:list():select(8) end},
            {"<leader>9", function() Harpoon:list():select(9) end},
        }
    },
}
