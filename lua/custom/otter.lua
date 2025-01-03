vim.api.nvim_create_user_command("OtterStart", function()
    require("otter").activate()
end, { desc = "OtterStart" })

return {
    "jmbuhr/otter.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
}
