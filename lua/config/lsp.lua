local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Default on_attach function for keymaps
local on_attach = function(_, bufnr)
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition,
        { buffer = bufnr, silent = true, desc = "Go to definition" })
    keymap("n", "K", vim.lsp.buf.hover,
        { buffer = bufnr, silent = true, desc = "Show hover info" })
    keymap("n", "gr", vim.lsp.buf.references,
        { buffer = bufnr, silent = true, desc = "List references" })
    keymap("n", "<leader>rn", vim.lsp.buf.rename,
        { buffer = bufnr, silent = true, desc = "Rename symbol" })
    keymap("n", "<leader>ca", vim.lsp.buf.code_action,
        { buffer = bufnr, silent = true, desc = "Code action" })
    keymap("n", "<space>F", function()
        vim.lsp.buf.format { async = true }
    end, { buffer = bufnr, silent = true, desc = "Format buffer" })

    -- highlight under cursor (only if an attached client supports it)
    local function has_highlight_capability()
        for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
            if c:supports_method("textDocument/documentHighlight") then
                return true
            end
        end
        return false
    end

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            if has_highlight_capability() then
                pcall(vim.lsp.buf.document_highlight)
            end
        end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        callback = function()
            pcall(vim.lsp.buf.clear_references)
        end,
    })
end

-- How to render diagnostics
vim.diagnostic.config({
    virtual_text = true, -- Show inline messages
    signs = true,        -- Show icons in the gutter
    underline = true,    -- Underline the problem
    update_in_insert = true,
    severity_sort = true,
})

-- Setup handlers
local servers = { "pyright", "clangd", "lua_ls", "bashls" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

