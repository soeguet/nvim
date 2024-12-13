return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      list = {
        selection = "manual", -- "manual" | "auto_insert"
      },
      menu = {
        enabled = true,
        border = "rounded",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
  },
}
