require("bufferline").setup({
  options = {
    mode = "buffers",           -- "tabs" for tab pages
    numbers = "ordinal",           -- could be "ordinal" or "buffer_id" or "none"
    close_command = "bdelete %d",
    right_mouse_command = "bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    show_buffer_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "thin",   -- "slant", "thick", or "thin"
    diagnostics = "nvim_lsp",   -- show LSP errors on tabs
    always_show_bufferline = true,
  },
  vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" }),
  vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" }),
  vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" }),
  vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" }),
  vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" }),
})
