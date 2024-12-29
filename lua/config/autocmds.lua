-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format()
end, { desc = "Lsp Format" })

-- [[ close some filetypes with <q> ]]
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "PlenaryTestPopup",
        "checkhealth",
        "dbout",
        "gitsigns.blame",
        "grug-far",
        "help",
        "lspinfo",
        "man",
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_user_command("Qa", "qa!", {})
vim.api.nvim_create_user_command("QA", "qa!", {})
vim.api.nvim_create_user_command("Q", "q!", {})
vim.api.nvim_create_user_command("W", "w!", {})
vim.api.nvim_create_user_command("Wq", "wq!", {})
vim.api.nvim_create_user_command("WQ", "wq!", {})
vim.api.nvim_create_user_command("WQ", "wq!", {})
vim.api.nvim_create_user_command("Wqa", "wqa!", {})
vim.api.nvim_create_user_command("WQa", "wqa!", {})
vim.api.nvim_create_user_command("Wa", "wa!", {})
vim.api.nvim_create_user_command("WA", "wa!", {})
vim.api.nvim_create_user_command("Wqa", "wqa!", {})
vim.api.nvim_create_user_command("WQA", "wqa!", {})

vim.api.nvim_create_user_command("CloseTab", function()
    vim.cmd("tabclose")
end, { desc = "Close Tab" })

vim.api.nvim_create_user_command("DiffOrig", "w !diff % -", {})

-- [[ in quickfix, will auto open the selected item ]]
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "<C-n>", "<cmd>cn | wincmd p<CR>", opts)
        vim.keymap.set("n", "<C-p>", "<cmd>cN | wincmd p<CR>", opts)
    end,
})

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("json_conceal"),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})
-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("man_unlisted"),
    pattern = { "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.b.copilot_suggestion_hidden = false
        -- vim.lsp.inlay_hint.enable(false)
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.b.copilot_suggestion_hidden = true
        -- vim.lsp.inlay_hint.enable(true)
    end,
})

-- if not vim.g.vscode then
--   -- LuaSnip stop if insert is left
--   vim.api.nvim_create_autocmd("ModeChanged", {
--     pattern = "*",
--     callback = function()
--       if
--         ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--         and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--         and not require("luasnip").session.jump_active
--       then
--         require("luasnip").unlink_current()
--       end
--     end,
--   })
-- end
