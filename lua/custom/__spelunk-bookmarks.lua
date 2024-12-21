return {
  "EvWilson/spelunk.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- For window drawing utilities
    -- "nvim-telescope/telescope.nvim", -- Optional: for fuzzy search capabilities
  },
  config = function()
    require("spelunk").setup({
      enable_persist = true,
      base_mappings = {
        -- Toggle the UI open/closed
        toggle = "<leader>bt",
        -- Add a bookmark to the current stack
        add = "<leader>ba",
        -- Move to the next bookmark in the stack
        next_bookmark = "<leader>bn",
        -- Move to the previous bookmark in the stack
        prev_bookmark = "<leader>bp",
        -- Fuzzy-find all bookmarks
        search_bookmarks = "<leader>bf",
        -- Fuzzy-find bookmarks in current stack
        search_current_bookmarks = "<leader>bc",
        -- Fuzzy find all stacks
        search_stacks = "<leader>bs",
      },
      window_mappings = {
        -- Move the UI cursor down
        cursor_down = "j",
        -- Move the UI cursor up
        cursor_up = "k",
        -- Move the current bookmark down in the stack
        bookmark_down = "<C-j>",
        -- Move the current bookmark up in the stack
        bookmark_up = "<C-k>",
        -- Jump to the selected bookmark
        goto_bookmark = "<CR>",
        -- Jump to the selected bookmark in a new vertical split
        goto_bookmark_hsplit = "x",
        -- Jump to the selected bookmark in a new horizontal split
        goto_bookmark_vsplit = "v",
        -- Delete the selected bookmark
        delete_bookmark = "d",
        -- Navigate to the next stack
        next_stack = "<Tab>",
        -- Navigate to the previous stack
        previous_stack = "<S-Tab>",
        -- Create a new stack
        new_stack = "n",
        -- Delete the current stack
        delete_stack = "D",
        -- Rename the current stack
        edit_stack = "E",
        -- Close the UI
        close = "q",
        -- Open the help menu
        help = "h",
      },
    })
  end,
}
