return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    vim.keymap.set("n", "<leader>rsm", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "<leader>rss", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "<leader>rse", substitute.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("x", "<leader>rsv", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
