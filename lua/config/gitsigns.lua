require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
}
-- keymap supressed for now

--  on_attach = function(bufnr)
--    local gs = package.loaded.gitsigns
--    local map = function(mode, lhs, rhs, desc)
--      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
--    end


--    -- Navigation
--    map("n", "]h", gs.next_hunk, "Next Git hunk")
--    map("n", "[h", gs.prev_hunk, "Previous Git hunk")
--
--    -- Actions
--    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
--    map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
--    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
--    map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
--    map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
--    map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
--
--    -- Visual mode staging
--    map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage selection")
--    map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset selection")
--  end,
--})
