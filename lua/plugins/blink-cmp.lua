local config_path = vim.fn.stdpath("config")

return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        snippets = {
          opts = {
            search_paths = { config_path .. "/lua/snippets/" },
          },
        },
      },
    },
  },
}
