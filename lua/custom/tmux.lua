local tmux_executable = vim.fn.executable("tmux") == 1

return {
    "alexghergh/nvim-tmux-navigation",
    enabled = tmux_executable,
    keys = {
        {
            "<C-L>",
            "<CMD>NvimTmuxNavigateRight<CR>",
        },
        {
            "<C-H>",
            "<CMD>NvimTmuxNavigateLeft<CR>",
        },
        {
            "<C-J>",
            "<CMD>NvimTmuxNavigateDown<CR>",
        },
        {
            "<C-K>",
            "<CMD>NvimTmuxNavigateUp<CR>",
        },
    },
    opts = {
        disable_when_zoomed = true, -- defaults to false
    },
}
