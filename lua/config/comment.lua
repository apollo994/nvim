local comment = require("Comment")

-- Plugin setup 
comment.setup({
})

vim.keymap.set("n", "gcc", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "gc", "gc", { remap = true, desc = "Toggle comment on selection" })
vim.keymap.set("n", "gbc", "gbc", { remap = true, desc = "Toggle block comment (line)" })
vim.keymap.set("v", "gb", "gb", { remap = true, desc = "Toggle block comment (selection)" })
