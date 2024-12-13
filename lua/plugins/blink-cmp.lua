local config_path = vim.fn.stdpath("config")

return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  -- opts = {
  --   sources = {
  --     providers = {
  --       snippets = {
  --         opts = {
  --           -- search_paths = { config_path .. "/lua/snippets/" },
  --         },
  --       },
  --     },
  --   },
  -- },
}
