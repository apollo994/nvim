require("telescope").setup({

  vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
    desc = "Telescope: Find files"
  }),

  vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
    desc = "Telescope: Search in files"
  }),
  vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "Telescope: List buffers" }),
})
