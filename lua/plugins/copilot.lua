vim.keymap.set("i", "", "<CMD>Copilot panel<CR>", { desc = "" })

return {
    "zbirenbaum/copilot.lua",
    opts = {
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
            },
            layout = {
                position = "vertical", -- | top | left | right | horizontal | vertical
                ratio = 0.4,
            },
        },
        suggestion = {
            enabled = false,
            auto_trigger = true,
            hide_during_completion = true,
            keymap = {
                accept = "<M-l>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
    },
}
