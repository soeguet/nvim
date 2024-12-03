return {
  "LintaoAmons/scratch.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "VeryLazy",
  opts = {
    use_telescope = true,
    file_picker = "telescope",
    filetypes = {
      "lua",
      "js",
      "sh",
      "java",
      "sql",
      "http",
      "ts",
      "tsx",
      "html",
      "css",
      "json",
      "yaml",
      "md",
    },
    filetype_details = {
      java = {
        -- requireDir = true, -- true if each scratch file requires a new directory
        -- filename = "main", -- the filename of the scratch file in the new directory
        content = {
          "package com.scratchpad;",
          "",
          "public class Scratchpad {",
          "",
          "    public static void main(String[] args){",
          "        ",
          "    }",
          "",
          "}",
        },
        cursor = {
          location = { 6, 8 },
          insert_mode = true,
        },
      },
    },
  },
  keys = function()
    print("lol")
    vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
    vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")
  end,
}
