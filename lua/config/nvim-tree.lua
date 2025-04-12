require("nvim-tree").setup({
    view = {
      width = 30,
      side = "left",
    },
    filters = {
      dotfiles = true,
    },
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer (NvimTree)",
    silent = true,
    })
})
