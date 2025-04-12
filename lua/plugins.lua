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
      build = ":TSUpdate",
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
        },
      },
      config = function()
        require("config.treesitter")
      end,
  },

  -- File explorer
  {
      "nvim-tree/nvim-tree.lua",
      config = function()
            require("config.nvim-tree")
      end,
  },

  -- Addition module to move in object and function
  {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = { "nvim-treesitter" }
  },

  -- Fuzzy finder
  {
      "nvim-telescope/telescope.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim"
      },
      config = function ()
            require("config.telescope")
      end,
  },

  -- LSP + Mason setup
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "clangd", "lua_ls" }, -- adjust as needed
        automatic_installation = true,
      })
    end,
  },
  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.cmp")
    end,
  },
})
