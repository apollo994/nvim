vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.keymap.set("i", "<C-l>", 'copilot#Accept("")', {
  expr = true,
  replace_keycodes = false,
  silent = true,
  desc = "Copilot: accept suggestion",
})
