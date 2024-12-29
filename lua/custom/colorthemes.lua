return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      -- Default options
      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = true, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = true, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              -- protan = 0, -- Severity [0,1] for protan (red)
              deutan = 1, -- Severity [0,1] for deutan (green)
              -- tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {
          all = { LspInlayHint = { fg = "#a9a9a9", bg = "" } },
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      -- Default options:
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },
  { "rose-pine/neovim", name = "rose-pine", opts = {} },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        transparent = false, -- don't set background
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "none",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        -- Override colors
        colors = {
          BlinkCmpMenu = "#d2788c",
          bg = "#18191a",
          fg = "#cdcdcd",
          floatBorder = "#878787",
          line = "#282830",
          comment = "#646477",
          builtin = "#bad1ce",
          func = "#be8c8c",
          string = "#deb896",
          number = "#d2a374",
          property = "#c7c7d4",
          constant = "#b4b4ce",
          parameter = "#b9a3ba",
          visual = "#363738",
          error = "#d2788c",
          warning = "#e6be8c",
          hint = "#8ca0dc",
          operator = "#96a3b2",
          keyword = "#7894ab",
          type = "#a1b3b9",
          search = "#465362",
          plus = "#8faf77",
          delta = "#e6be8c",
        },
      })
    end,
  },
}
