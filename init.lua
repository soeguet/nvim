-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local project_dap_config = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.filereadable(project_dap_config) == 1 then
  dofile(project_dap_config)
end

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#fda000", bg = "#1e1e1e" })
