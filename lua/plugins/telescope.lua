vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

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

local custom_file_ignore_patterns = {
  "package%-lock%.json",
  "tsconfig%.json",
  "/%.git/.*",
  "/%.github/.*",
  "*.d.ts",
  "/node%_modules/.*",
  "target/.*",
  "package-lock.json",
  "^jdt:/*",
  "%.class$",
}

local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",

  opts = {
    defaults = {
      file_ignore_patterns = custom_file_ignore_patterns,
      path_display = {
        "filename_first",
      },
      layout_config = {
        bottom_pane = {
          height = 25,
          preview_cutoff = 120,
          prompt_position = "top",
        },
        center = {
          height = 0.4,
          preview_cutoff = 40,
          prompt_position = "top",
          width = 0.9,
        },
        cursor = {
          height = 0.9,
          preview_cutoff = 40,
          width = 0.8,
        },
        horizontal = {
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = "bottom",
          width = 0.8,
        },
        vertical = {
          height = 0.9,
          preview_cutoff = 40,
          prompt_position = "bottom",
          width = 0.8,
        },
      },
    },
    pickers = {
      lsp_references = {
        path_display = filenameFirst_no_path,
      },
    },
  },
  keys = {
    {
      "H",
      "<CMD>Telescope buffers initial_mode=normal ignore_current_buffer=true only_cwd=true sort_lastused=true theme=ivy<CR>",
    },
    {
      "<leader><space>",
      false,
    },
    {
      "<leader><space>",
      "<CMD>Telescope buffers initial_mode=normal ignore_current_buffer=true only_cwd=true sort_lastused=true theme=ivy<CR>",
    },
    {
      "<leader>sf",
      function()
        builtin.find_files(require("telescope.themes").get_ivy({
          debounce = 100,
          path_display = filenameFirst,
          sorting_strategy = "descending",
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
          file_ignore_patterns = custom_file_ignore_patterns,
        }))
      end,
      { desc = "find files" },
    },
    {
      "<leader>sF",
      "<CMD>Telescope find_files hidden=true no_ignore=true theme=ivy<CR>",
      { desc = "find ALL files" },
    },
    {
      "<leader>sw",
      false,
    },
    {
      "<leader>sw",
      "<CMD>Telescope grep_string theme=ivy initial_mode=normal<CR>",
      { desc = "search word" },
    },
    {
      "<leader>sg",
      function()
        builtin.live_grep({
          layout_config = {
            width = 0.9,
            height = 0.9,
            prompt_position = "top",
          },
          layout_strategy = "vertical",
        })
      end,
      { desc = "find files" },
    },
  },
}
