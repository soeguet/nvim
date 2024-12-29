return {
    {
        "rcarriga/nvim-dap-ui",
        keys = {
            -- Basic debugging keymaps, feel free to change to your liking!
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Debug: Start/Continue",
            },
            {
                "<F1>",
                function()
                    require("dap").step_into()
                end,
                desc = "Debug: Step Into",
            },
            {
                "<F2>",
                function()
                    require("dap").step_over()
                end,
                desc = "Debug: Step Over",
            },
            {
                "<F4>",
                "<CMD>DapToggleRepl<CR>",
                desc = "Debug: Step Over",
            },
            {
                "<F17>",
                "<CMD>DapTerminate<CR>",
                desc = "Debug: Terminate",
            },
            {
                "<F3>",
                function()
                    require("dap").step_out()
                end,
                desc = "Debug: Step Out",
            },
            {
                "<F8>",
                function()
                    ---@diagnostic disable-next-line: missing-parameter
                    require("dapui").float_element()
                end,
                desc = "Debug: Step Over",
            },
            {
                "<leader>b",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Debug: Toggle Breakpoint",
            },
            {
                "<leader>B",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Debug: Set Breakpoint",
            },
            {
                "<F7>",
                function()
                    require("dapui").toggle()
                end,
                desc = "Debug: Toggle DAP UI",
            },
        },
        opts = function()
            vim.api.nvim_create_user_command("DapUiAddToWatch", function()
                require("dapui").elements.watches.add()
            end, { desc = "DAPUI - adds element under cursor to DAP watches" })

            return {
                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        play = "[ f5 ] ",
                        disconnect = "[  ] ",
                        pause = "[  ] ",
                        run_last = "[  ] ",
                        step_back = "[  ] ",
                        step_into = "[ f1 ] ",
                        step_out = "[ f3 ] ",
                        step_over = "[ f2 ] ",
                        terminate = "[ S-f5 ] ",
                    },
                },
                layouts = {
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 0.25,
                            },
                            {
                                id = "breakpoints",
                                size = 0.25,
                            },
                            {
                                id = "stacks",
                                size = 0.25,
                            },
                            {
                                id = "watches",
                                size = 0.25,
                            },
                        },
                        position = "left",
                        size = 40,
                    },
                },
            }
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
            highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        },
    },
}
