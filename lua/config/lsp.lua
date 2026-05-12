local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
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
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, silent = true, desc = "Format buffer" })

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight") then
            local grp = vim.api.nvim_create_augroup("lsp_doc_highlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd("CursorHold", {
                group = grp,
                buffer = bufnr,
                callback = function() pcall(vim.lsp.buf.document_highlight) end,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                group = grp,
                buffer = bufnr,
                callback = function() pcall(vim.lsp.buf.clear_references) end,
            })
        end
    end,
})

vim.lsp.enable({ "pyright", "clangd", "lua_ls", "bashls" })
