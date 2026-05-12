local ensure_installed = {
    "lua",
    "bash",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "c",
    "cpp",
    "groovy",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if not lang or lang == "" then return end
        local ok = pcall(vim.treesitter.start, bufnr, lang)
        if ok then
            vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- Incremental selection (was removed from nvim-treesitter main; reimplement minimally)
local function start_incremental()
    local node = vim.treesitter.get_node()
    if not node then return end
    local srow, scol, erow, ecol = node:range()
    vim.fn.setpos("'<", { 0, srow + 1, scol + 1, 0 })
    vim.fn.setpos("'>", { 0, erow + 1, ecol, 0 })
    vim.cmd("normal! gv")
    vim.b.ts_inc_node = node
end

local function expand_incremental()
    local node = vim.b.ts_inc_node
    if not node then start_incremental() return end
    local parent = node:parent()
    if not parent then return end
    local srow, scol, erow, ecol = parent:range()
    vim.fn.setpos("'<", { 0, srow + 1, scol + 1, 0 })
    vim.fn.setpos("'>", { 0, erow + 1, ecol, 0 })
    vim.cmd("normal! gv")
    vim.b.ts_inc_node = parent
end

vim.keymap.set("n", "<leader>v", start_incremental, { desc = "Start treesitter selection" })
vim.keymap.set("x", "<leader>v", expand_incremental, { desc = "Expand treesitter selection" })

-- Textobjects (main branch API)
local ok_to, tobj = pcall(require, "nvim-treesitter-textobjects")
if ok_to then
    tobj.setup({
        select = { lookahead = true },
        move = { set_jumps = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)

    local move = require("nvim-treesitter-textobjects.move")
    vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
    vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
end
