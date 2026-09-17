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

-- require("nvim-treesitter").install(ensure_installed)

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
-- TSNodes are userdata and can't live in buffer variables, so the selection
-- stack is kept module-local, keyed by buffer.
local inc_stack = {}

vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
    callback = function(args)
        inc_stack[args.buf] = nil
    end,
})

local function select_node(node)
    local srow, scol, erow, ecol = node:range()
    vim.fn.setpos("'<", { 0, srow + 1, scol + 1, 0 })
    vim.fn.setpos("'>", { 0, erow + 1, ecol, 0 })
    vim.cmd("normal! gv")
end

local function start_incremental()
    local node = vim.treesitter.get_node()
    if not node then return end
    inc_stack[vim.api.nvim_get_current_buf()] = { node }
    select_node(node)
end

local function expand_incremental()
    local stack = inc_stack[vim.api.nvim_get_current_buf()]
    if not stack or #stack == 0 then return start_incremental() end
    local parent = stack[#stack]:parent()
    if not parent then return select_node(stack[#stack]) end
    stack[#stack + 1] = parent
    select_node(parent)
end

local function shrink_incremental()
    local stack = inc_stack[vim.api.nvim_get_current_buf()]
    if not stack or #stack < 2 then return end
    stack[#stack] = nil
    select_node(stack[#stack])
end

vim.keymap.set("n", "<leader>v", start_incremental, { desc = "Start treesitter selection" })
vim.keymap.set("x", "<leader>v", expand_incremental, { desc = "Expand treesitter selection" })
vim.keymap.set("x", "<leader>V", shrink_incremental, { desc = "Shrink treesitter selection" })

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
