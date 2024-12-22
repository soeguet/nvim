return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "vertical", -- | top | left | right | horizontal | vertical
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
    },
  },
}
