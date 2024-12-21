-- local copilot = require("copilot.suggestion")
-- local debounce_timer = nil
--
-- -- Debounce-Funktion
-- local function debounce(func, delay)
--   if debounce_timer then
--     debounce_timer:stop()
--   end
--   debounce_timer = vim.defer_fn(func, delay)
-- end
--
-- -- Cursor-Hold-Event: Copilot Suggestions anzeigen
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     debounce(function()
--       if not copilot.is_visible() then
--         copilot.toggle_auto_trigger()
--       end
--     end, 200) -- 200ms Verzögerung nach Cursor-Stopp
--   end,
-- })
--
-- -- Event für Textänderungen: Copilot Suggestions verstecken
-- vim.api.nvim_create_autocmd({ "TextChangedI", "TextChanged" }, {
--   callback = function()
--     if copilot.is_visible() then
--       copilot.dismiss()
--     end
--   end,
-- })
--
-- -- Cursor bewegt sich: Copilot Suggestions verstecken
-- vim.api.nvim_create_autocmd("CursorMovedI", {
--   callback = function()
--     if copilot.is_visible() then
--       copilot.dismiss()
--     end
--   end,
-- })
--

return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<M-Bslash>",
        accept_word = "<M-Bar>",
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
}
