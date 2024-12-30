vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("config.lazy")

local project_dap_config = vim.fn.getcwd() .. "/dap.lua"
if vim.fn.filereadable(project_dap_config) == 1 then
    dofile(project_dap_config)
end

-- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#a9a9a9" })
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#fda000", bg = "" })

if vim.g.neovide then
    vim.print(vim.g.neovide_version)

    vim.o.guifont = "Iosevka Nerd Font:h20"
end

if vim.g.vscode then
    -- call is synchronous
    -- action is async
    local vscode = require("vscode")
    vim.notify = vscode.notify
    print(vscode.call("_ping")) -- outputs: pong

    vim.keymap.set("n", "<leader>bv", "<C-w>t<C-w>H", { desc = "change buffer to vertical split" })
    vim.keymap.set("n", "<leader>bh", "<C-w>t<C-w>K", { desc = "change buffer to horizontal split" })

    vim.keymap.set({ "n", "x", "i" }, "<C-m>", function()
        vscode.with_insert(function()
            vscode.call("editor.action.addSelectionToNextFindMatch")
        end)
    end)

    vim.keymap.set({ "n", "x" }, "<leader>rr", function()
        vscode.call("editor.action.refactor")
    end)

    vim.keymap.set({ "n", "x" }, "<leader>rn", function()
        vscode.call("editor.action.rename")
    end)

    vim.keymap.set({ "n" }, "<leader>sf", function()
        vscode.call("workbench.action.quickOpen")
    end)

    vim.keymap.set({ "n", "v" }, "\\", function()
        vscode.call("editor.action.smartSelect.expand")
    end)

    vim.keymap.set({ "v" }, "|", function()
        vscode.call("editor.action.smartSelect.shrink")
    end)

    vim.keymap.set({ "i" }, "<C-space>", function()
        vscode.with_insert(function()
            vscode.call("editor.action.triggerSuggest")
        end)
    end)

    vim.keymap.set({ "n" }, "<leader>ss", function()
        vscode.call("workbench.action.gotoSymbol")
    end)

    vim.keymap.set({ "n" }, "<leader>nh", function()
        vscode.call("cancelSelection")
    end)

    vim.keymap.set({ "n" }, "<leader>sg", function()
        vscode.call("workbench.action.quickTextSearch")
    end)

    vim.keymap.set({ "v" }, "<leader>sw", function()
        vscode.call("workbench.action.quickTextSearch", {
            args = { query = vim.fn.expand("<cword>") },
        })
    end)

    vim.keymap.set({ "n" }, "<leader>sw", function()
        vscode.call("editor.action.smartSelect.expand")
        vscode.call("workbench.action.quickTextSearch", {
            args = { query = vim.fn.expand("<cword>") },
        })
    end)

    vim.keymap.set({ "n" }, "<leader>1", function()
        vscode.call("workbench.view.explorer")
    end)
    vim.keymap.set({ "n" }, "<leader>ee", function()
        vscode.call("workbench.view.explorer")
    end)

    -- vim.keymap.set({ "n" }, "L", function()
    --   vscode.call("workbench.action.nextEditorInGroup")
    -- end)
    -- vim.keymap.set({ "n" }, "H", function()
    --   vscode.call("workbench.files.action.focusOpenEditorsView")
    -- end)

    vim.keymap.set({ "n" }, "<c-l>", function()
        vscode.call("workbench.action.focusRightGroup")
    end)
    vim.keymap.set({ "n" }, "<c-s-l>", function()
        vscode.call("workbench.action.moveEditorToRightGroup")
    end)

    vim.keymap.set({ "n" }, "<c-h>", function()
        vscode.call("workbench.action.focusLeftGroup")
    end)
    vim.keymap.set({ "n" }, "<c-s-h>", function()
        vscode.call("workbench.action.moveEditorToLeftGroup")
    end)

    vim.keymap.set({ "n" }, "<c-j>", function()
        vscode.call("workbench.action.focusBelowGroup")
    end)
    vim.keymap.set({ "n" }, "<c-s-j>", function()
        vscode.call("workbench.action.moveEditorToBelowGroup")
    end)

    vim.keymap.set({ "n" }, "<c-k>", function()
        vscode.call("workbench.action.focusAboveGroup")
    end)
    vim.keymap.set({ "n" }, "<c-s-k>", function()
        vscode.call("workbench.action.moveEditorToAboveGroup ")
    end)

    vim.keymap.set({ "n" }, "<leader>|", function()
        vscode.call("workbench.action.splitEditorRight")
    end)

    vim.keymap.set({ "n" }, "<leader>-", function()
        vscode.call("workbench.action.splitEditorDown")
    end)

    vim.keymap.set({ "n" }, "<leader>bd", function()
        vscode.call("workbench.action.closeActiveEditor")
    end)

    vim.keymap.set({ "n" }, "<C-M-l>", function()
        vscode.call("editor.action.formatDocument")
    end)

    vim.keymap.set({ "n" }, "<leader>ef", function()
        vscode.call("workbench.files.action.showActiveFileInExplorer")
    end)

    vim.keymap.set({ "n" }, "<leader>eq", function()
        vscode.call("workbench.action.toggleSidebarVisibility")
    end)

    vim.keymap.set({ "n" }, "<c-up>", function()
        vscode.call("workbench.action.increaseViewWidth")
    end)

    vim.keymap.set({ "n" }, "<c-down>", function()
        vscode.call("workbench.action.decreaseViewWidth")
    end)
end
