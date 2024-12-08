local builtin = require("telescope.builtin")

local custom_file_ignore_patterns = {
  "node%_modules/.*",
  "target/.*",
  "^jdt:/*",
  "%.class$",
}

local function filenameFirst_no_path(_, path)
  local tail = vim.fs.basename(path)
  return string.format("%s", tail)
end

local function filenameFirst(abc, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)

  if parent == "." then
    return tail
  end

  return string.format("%s\t\t%s", tail, parent)
end

return {
  "neovim/nvim-lspconfig",
  keys = {
    { "gr", false },
    -- {
    --   "gr",
    --   function()
    --     builtin.lsp_references(require("telescope.themes").get_ivy({
    --       debounce = 100,
    --       path_display = filenameFirst,
    --       sorting_strategy = "descending",
    --       hidden = true,
    --       no_ignore = true,
    --       no_ignore_parent = true,
    --       file_ignore_patterns = custom_file_ignore_patterns,
    --     }))
    --   end,
    -- },
  },
  -- ---@class PluginLspOpts
  --   return {}
  -- end,
  -- opts = {
  --   ---@type lspconfig.options
  --   servers = {
  --     -- pyright will be automatically installed with mason and loaded with lspconfig
  --     pyright = {},
  --   },
  -- },
}
