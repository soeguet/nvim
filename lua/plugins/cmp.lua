return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    -- table.insert(opts.sources, { name = "supermaven" })

    opts.experimental = vim.tbl_extend("force", opts.experimental, {
      ghost_text = false,
      native_menu = false,
    })

    -- opts.completion = vim.tbl_extend("force", opts.completion, {
    --   autocomplete = cmp.TextChanged,
    --   -- completeopt = 'noselect,noinsert',
    --   completeopt = "menuone,popup,preview,noinsert",
    --   keyword_length = 0,
    -- })

    opts.window = {
      -- documentation = cmp.config.window.bordered(),
      documentation = vim.tbl_extend("force", cmp.config.window.bordered(), {
        border = "rounded",
        winhighlight = "Normal:CmpNormal",
        max_width = 80,
        max_height = 80,
        winblend = 0,
        zindex = 1001,
      }),
      -- completion = cmp.config.window.bordered(),
      completion = vim.tbl_extend("force", cmp.config.window.bordered(), {
        border = "rounded",
        winhighlight = "Normal:CmpNormal",
        zindex = 1001,
        scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = true,
      }),
    }

    -- opts.formatting.format = function(entry, vim_item)
    --   local lspkind_ok, lspkind = pcall(require, "lspkind")
    --   local ELLIPSIS_CHAR = "…"
    --   local MAX_LABEL_WIDTH = 25
    --   if not lspkind_ok then
    --     -- From kind_icons array
    --     vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
    --     -- Source
    --     vim_item.menu = ({
    --       buffer = "[Buffer]",
    --       nvim_lsp = "[LSP]",
    --       luasnip = "[Snip]",
    --       nvim_lua = "[Lua]",
    --       latex_symbols = "[LaTeX]",
    --       supermaven = "[AI]",
    --       copilot = "[AI]",
    --     })[entry.source.name]
    --     -- [[ max length for abbr. ]]
    --     local label = vim_item.abbr
    --     local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
    --     if truncated_label ~= label then
    --       vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
    --     end
    --     return vim_item
    --   else
    --     -- [[ max length for abbr. ]]
    --     local label = vim_item.abbr
    --     local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
    --     if truncated_label ~= label then
    --       vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
    --     end
    --     -- From lspkind
    --     return lspkind.cmp_format()(entry, vim_item)
    --   end
    -- end

    -- gray
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
    -- blue
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
    -- light blue
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
    -- pink
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
    -- front
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
  end,
}
