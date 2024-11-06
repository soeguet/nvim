return {
  "nvim-telescope/telescope.nvim",
  keys = {

    {
      "H",
      "<CMD>Telescope buffers initial_mode=normal ignore_current_buffer=true only_cwd=true sort_lastused=true theme=ivy<CR>",
    },
    {
      "<leader>sf",
      "<CMD>Telescope find_files theme=ivy<CR>",
      { desc = "find files" },
    },
    {
      "<leader>sF",
      "<CMD>Telescope find_files hidden=true no_ignore=true theme=ivy<CR>",
      { desc = "find ALL files" },
    },
  },
}
