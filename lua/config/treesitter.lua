require("nvim-treesitter.configs").setup({
    -- Install these language parsers
    ensure_installed = {
        "lua",
        "bash",
        "json",
        "yaml",
        "markdown",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "c",
        "cpp"
    },

    sync_install = false, -- Install asynchronously
    auto_install = true,  -- Auto-install missing parsers

    -- Syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    -- Smarter indentation
    indent = {
        enable = true,
    },

    -- Incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>v",   -- Start selection (safe mapping)
            node_incremental = "<leader>v", -- Expand
            node_decremental = "<leader>V", -- Shrink
        },
    },

    -- Text objects (select function, class, etc.)
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Jump to nearest text object
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,             -- so movements are recorded in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer", -- jump to start of next function
            },
            goto_previous_start = {
                ["[f"] = "@function.outer", -- jump to start of previous function
            },
        },
    },
})

