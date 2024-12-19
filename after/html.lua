-- Lokale Einstellungen für HTML-Dateien
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4 -- Wichtig für konsistentes Verhalten
vim.opt_local.expandtab = true

-- Explizit die HTML-spezifische Einrückung setzen
vim.b.html_indent_script1 = "inc"
vim.b.html_indent_style1 = "inc"

-- Sicherstellen, dass keine anderen Plugins diese Einstellungen überschreiben
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
  group = vim.api.nvim_create_augroup("HTMLIndentation", { clear = true }),
})

-- Debug-Information ausgeben (optional)
vim.api.nvim_create_user_command("CheckHTMLIndent", function()
  print("Current HTML indent settings:")
  print("shiftwidth: " .. vim.bo.shiftwidth)
  print("tabstop: " .. vim.bo.tabstop)
  print("softtabstop: " .. vim.bo.softtabstop)
end, {})
