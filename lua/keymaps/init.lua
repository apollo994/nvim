local map = vim.keymap.set

-- Buffer 
map("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Tab
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split current buffer" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split current buffer" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close current window" })

-- Window navigation using Ctrl + arrow keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to above split" })
