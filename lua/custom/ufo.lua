return {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = "kevinhwang91/promise-async",
    config = function(_, opts)
        vim.keymap.set("n", "<leader><F1>", require("ufo").openAllFolds, { desc = "ufo open all folds" })
        vim.keymap.set("n", "<leader><F2>", require("ufo").closeAllFolds, { desc = "ufo close all folds" })

        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })
    end,
}
