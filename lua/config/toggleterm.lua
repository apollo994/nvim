require("toggleterm").setup({
  size = 15,
  open_mapping = [[<C-\>]], -- Ctrl + \
  direction = "horizontal", -- could be "float", "vertical"
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
})
