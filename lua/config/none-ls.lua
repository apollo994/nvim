local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    -- Ruff diagnostic via none-ls-extras
    require("none-ls.diagnostics.ruff").with({
      extra_args = { "--line-length=88" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>F", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = bufnr, desc = "Format with NoneLS" })
    end
  end,
})
