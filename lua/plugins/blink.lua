return {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

        keymap = {
            preset = "super-tab",
            ["<Tab>"] = {
                function(cmp)
                    if require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                        return
                    elseif cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
            ["<C-f>"] = { "snippet_forward", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
            ["<C-b>"] = { "snippet_backward", "fallback" },
            ["<C-l>"] = { "snippet_forward", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
        },
        completion = {
            keyword = { range = "full" },
            trigger = {
                show_on_accept_on_trigger_character = false,
                -- show_in_snippet = false,
            },
            list = {
                selection = "manual", -- "manual" | "auto_insert" | "preselect"
            },
            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "kind_icon", "kind", gap = 1 },
                        { "label", "label_description" },
                    },
                    treesitter = {
                        "lsp",
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                },
            },
        },
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
        sources = {
            -- adding any nvim-cmp sources here will enable them
            -- with blink.compat
            default = { "lazydev", "lsp", "path", "snippets" },
        },
    },
}
