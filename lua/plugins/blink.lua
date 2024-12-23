vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuOpen",
  callback = function()
    require("copilot.suggestion").dismiss()
    vim.b.copilot_suggestion_hidden = true
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = {
        function(cmp)
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return
          elseif cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<CR>"] = { "accept", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      trigger = {
        show_on_accept_on_trigger_character = false,
        -- show_in_snippet = false,
      },
      list = {
        selection = "preselect", -- "manual" | "auto_insert" | "preselect"
      },
      menu = {
        border = "rounded",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
}
