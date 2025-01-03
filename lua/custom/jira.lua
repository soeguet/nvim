-- https://github.com/janBorowy/jirac.nvim
-- sample config
-- require("jirac").setup({
--     email = "foobar@mail.com",
--     jira_domain = "developer.atlassian.net",
--     api_key = io.open(os.getenv("HOME") .. "/personal/jira_token.txt"):read("*a"),
--     config = {
--         default_project_key = "EXAMPLE"
--         keymaps = {
--             ["close-window"] = {
--                 mode = 'n',
--                 key = 'q'
--             },
--             ["previous-tab"] = {
--                 mode = 'n',
--                 key = 'H'
--             },
--             ["refresh-window"] = {
--                 mode = 'n',
--                 key = "<F5>"
--             }
--         },
--         window_width = 150,
--         window_height = 50
--     }
-- })
return {
    "janBorowy/jirac.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "grapp-dev/nui-components.nvim",
        "nvim-lua/plenary.nvim",
    },
}
