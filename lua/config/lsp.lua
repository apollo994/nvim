local lspconfig = require("lspconfig")

-- Default on_attach function for keymaps
local on_attach = function(_, bufnr)
  local keymap = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Setup handlers
local servers = { "pyright", "clangd", "lua_ls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  })
end
