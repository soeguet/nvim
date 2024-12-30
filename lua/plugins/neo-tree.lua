return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({ reveal = true, dir = LazyVim.root() })
            end,
            desc = "Explorer NeoTree (Root Dir)",
        },
        {
            "<leader>fE",
            function()
                require("neo-tree.command").execute({ reveal = true, dir = vim.uv.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        { "<leader>e", false },
        { "<leader>ee", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
        { "<leader>e", false },
        { "<leader>eE", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
        { "<leader>eq", "<CMD>Neotree close<CR>", desc = "Explorer NeoTree (Root Dir)", remap = true },
    },
}
