-- lazy.nvim setup
require("lazy").setup({

  -- Colorscheme
  { 
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
          vim.cmd.colorscheme("catppuccin")
      end,
  },

  -- Statusline
  {
      "nvim-lualine/lualine.nvim"
  },

  -- Syntax highlighting
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
  },

  -- File explorer
  {
      "nvim-tree/nvim-tree.lua",
      config = function()
          require("config.nvim-tree")
      end,
  },

  -- Fuzzy finder
  { 
      "nvim-telescope/telescope.nvim",
      dependencies = { 
          "nvim-lua/plenary.nvim"
      }
  },

})
