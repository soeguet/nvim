return {
  "folke/noice.nvim",
  enabled = false,
  opts = function(_, opts)
    opts.lsp.signature = {
      auto_open = { enabled = false },
    }
  end,
}
