return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
        {
            "<leader>ea",
            function()
                require("harpoon"):list():add()
            end,
        },
        {
            "<leader>eh",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
        },
        {
            "<M-!>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(1)
            end,
        },
        {
            "<M-@>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(2)
            end,
        },
        {
            "<M-#>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(3)
            end,
        },
        {
            "<M-$>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(4)
            end,
        },
        {
            "<M-Right>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():next()
            end,
        },
        {
            "<M-Left>",
            function()
                local harpoon = require("harpoon")
                harpoon:list():prev()
            end,
        },
    },
}
