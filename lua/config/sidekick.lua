require("sidekick").setup({
  nes = { enabled = false },
  cli = {
    mux = {
      backend = "tmux",
      enabled = false,
    },
  },
})

local map = vim.keymap.set

map({ "n", "v" }, "<leader>aa", function() require("sidekick.cli").toggle() end,
  { desc = "Sidekick: Toggle CLI" })
map({ "n", "v" }, "<leader>as", function() require("sidekick.cli").send({ msg = "{this}" }) end,
  { desc = "Sidekick: Send context" })
map("v", "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end,
  { desc = "Sidekick: Send visual selection" })
map("n", "<leader>ap", function() require("sidekick.cli").prompt() end,
  { desc = "Sidekick: Prompt picker" })
map("n", "<leader>at", function() require("sidekick.cli").select_tool() end,
  { desc = "Sidekick: Select tool" })
map("n", "<leader>af", function() require("sidekick.cli").focus() end,
  { desc = "Sidekick: Focus CLI" })
map("n", "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
  { desc = "Sidekick: Toggle Claude" })
