return {
    "aaronik/treewalker.nvim",

    -- The following options are the defaults.
    -- Treewalker aims for sane defaults, so these are each individually optional,
    -- and setup() does not need to be called, so the whole opts block is optional as well.
    opts = function()
        -- movement
        vim.keymap.set({ "n", "v" }, "<M-C-K>", "<cmd>Treewalker Up<cr>", { silent = false })
        vim.keymap.set({ "n", "v" }, "<M-NL>", "<cmd>Treewalker Down<cr>", { silent = true })
        vim.keymap.set({ "n", "v" }, "<M-C-L>", "<cmd>Treewalker Right<cr>", { silent = true })
        vim.keymap.set({ "n", "v" }, "<M-C-H>", "<cmd>Treewalker Left<cr>", { silent = true })

        -- swapping up/down
        vim.keymap.set("n", "<M-J>", "<cmd>Treewalker SwapDown<cr>", { silent = true })
        vim.keymap.set("n", "<M-K>", "<cmd>Treewalker SwapUp<cr>", { silent = true })
        return {
            -- Whether to briefly highlight the node after jumping to it
            highlight = true,

            -- How long should above highlight last (in ms)
            highlight_duration = 750,

            -- The color of the above highlight. Must be a valid vim highlight group.
            -- (see :h highlight-group for options)
            highlight_group = "CursorLine",
        }
    end,
}
