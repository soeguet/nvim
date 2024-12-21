-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>xf", "<cmd>source %<CR>", { desc = "source this" })
vim.keymap.set("n", "<leader>xF", ":.lua<CR>", { desc = "source this" })
vim.keymap.set("v", "<leader>xF", ":lua<CR>", { desc = "source this" })

vim.keymap.set("i", "kj", "<esc>==")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<M-q>", "q:")

vim.keymap.set("n", "<leader>bv", "<C-w>t<C-w>H", { desc = "change buffer to vertical split" })
vim.keymap.set("n", "<leader>bh", "<C-w>t<C-w>K", { desc = "change buffer to horizontal split" })

vim.keymap.set("n", "`", "<CMD>FzfLua buffers<CR>", { desc = "Fzf buffers" })
vim.keymap.set("n", "<leader>sf", "<CMD>FzfLua files<CR>", { desc = "Fzf find files" })

-- [[ move highlighted stuff ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

-- vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })
vim.api.nvim_create_user_command("ClearHighlights", function()
  vim.cmd("nohlsearch")
end, { desc = "Clear highlights" })

vim.keymap.set({ "n", "v", "i", "x", "c" }, "<S-CR>", "<C-o>o", { desc = "Insert line below" })
vim.keymap.set({ "n", "v", "i", "x", "c" }, "<C-CR>", "<C-o>o", { desc = "Insert line below" })

vim.keymap.set("n", "<c-m-l>", function()
  vim.lsp.buf.format()
end, { desc = "Format" })

-- [[ search filename ]]
function Search_filename()
  local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
  local basename = filename:match("([^%.]+)")
  vim.api.nvim_command('let @/ = "' .. basename .. '"')

  -- Prüfe, ob das Muster gefunden wurde
  if vim.fn.search(basename) > 0 then
    vim.api.nvim_command("normal! ggn")
  else
    print("Pattern not found: " .. basename)
  end

  vim.api.nvim_command("nohlsearch")
end

function Search_word()
  local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
  local basename = filename:match("([^%.]+)")
  vim.api.nvim_command('let @/ = "' .. basename .. '"')

  -- Prüfe, ob das Muster gefunden wurde
  if vim.fn.search(basename) > 0 then
    vim.api.nvim_command("normal! ggn")
  else
    print("Pattern not found: " .. basename)
  end

  vim.api.nvim_command("nohlsearch")
end

vim.keymap.set(
  "n",
  "<leader>i",
  ":lua Search_word()<CR>",
  { noremap = true, silent = true, desc = "search for filename in buffer" }
)
vim.api.nvim_create_user_command("SearchFilename", function()
  Search_filename()
end, { desc = "search for filename in buffer" })
-- [[ search filename ]]

-- [[ Go to Definition ]]
vim.api.nvim_set_keymap("n", "<C-LeftMouse>", "<cmd>lua GotoDefinitionOrEcho()<CR>", { noremap = true, silent = true })
function GotoDefinitionOrEcho()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000)
  if result and next(result) ~= nil then
    vim.lsp.buf.definition()
  else
    print("No definition found for the word under the cursor.")
  end
end

-- [[ Go to Definition ]]

-- [[ quickfix magic ]]
local function is_quickfix_visible()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      return true
    end
  end
  return false
end

local function quickfix_next()
  if is_quickfix_visible() and vim.fn.winnr() ~= vim.fn.bufwinnr("quickfix") then
    local ok, err = pcall(vim.cmd, "cnext")
    if not ok then
      print(err) -- Prints any errors encountered
    end
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", false)
  end
end

local function quickfix_prev()
  if is_quickfix_visible() and vim.fn.winnr() ~= vim.fn.bufwinnr("quickfix") then
    local ok, err = pcall(vim.cmd, "cprev")
    if not ok then
      print(err) -- Prints any errors encountered
    end
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", false)
  end
end

-- Key mappings for <C-n> and <C-p> when in normal mode
vim.keymap.set("n", "<C-n>", function()
  quickfix_next()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function()
  quickfix_prev()
end, { noremap = true, silent = true })
-- [[ quickfix magic ]]
