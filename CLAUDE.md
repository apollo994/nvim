# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using **lazy.nvim** as the plugin manager. The config targets scientific workflow development (Nextflow, Snakemake), Python, C/C++, Lua, and Bash.

## Architecture

### Load Order (init.lua)
1. Leader key set to `<Space>`
2. `lua/settings.lua` — editor options (indentation, search, clipboard, UI)
3. `lua/plugins.lua` — lazy.nvim bootstrap + all plugin specs with inline `config` calls pointing to `lua/config/`
4. `lua/keymaps/init.lua` — basic key mappings
5. `lua/custom/filetypes.lua` — custom filetype detection (`.smk`, `.nf`, etc.)
6. `lua/custom/nextflow.lua` — Nextflow language server setup (Java JAR in `bin/`)

### Plugin Configuration Pattern
Each plugin's config lives in `lua/config/<plugin-name>.lua` and is loaded via the `config` field in its plugin spec in `plugins.lua`. To add a new plugin: add a spec to `plugins.lua` and create the corresponding config file.

### LSP Setup
- Mason manages LSP server installation
- Supported servers: `pyright`, `clangd`, `lua_ls`, `bashls`, plus a custom Nextflow server
- Default LSP keymaps defined in `lua/config/lsp.lua`: `gd` (definition), `K` (hover), `gr` (references), `<leader>rn` (rename), `<leader>ca` (code action), `<Space>F` (format)

### Custom Language Support
- `lua/custom/filetypes.lua`: registers `.smk`/`Snakefile` as `snakemake` and `.nf`/`nextflow.config` as `nextflow`
- `lua/custom/nextflow.lua`: starts `bin/language-server-all.jar` (Java) as the Nextflow LSP, rooted at `nextflow.config` or `.git`

### Formatting & Linting
Python formatting is handled by `none-ls` (`lua/config/none-ls.lua`): black + isort for formatting, ruff for linting (line-length 88). Triggered via `<Space>F`.

### Clipboard
Uses OSC 52 protocol (`vim.g.clipboard`) for clipboard support over SSH/remote sessions.

### Indentation
Tabs (not spaces), width = 4. Set in `lua/settings.lua`.

### AI Integrations
- `folke/sidekick.nvim` (`lua/config/sidekick.lua`): Claude/Codex/etc. CLI sidebar (`<leader>aa`). NES is disabled — sidekick is used for chat only.
- `github/copilot.vim` (`lua/config/copilot.lua`): inline ghost-text suggestions. `<Tab>` is reserved for cmp/snippets, so suggestions are accepted with `<C-l>` (insert mode). `copilot_no_tab_map` is set to prevent the default `<Tab>` hijack.
- Per-system one-time setup: `:Copilot setup` (sign in via device code) and `claude` CLI on `$PATH`.

## Key Mappings Reference

| Action | Keymap |
|--------|--------|
| **Files & Buffers** | |
| Toggle file explorer | `<leader>e` |
| Find files (Telescope) | `<leader>ff` |
| Live grep (Telescope) | `<leader>fg` |
| List buffers (Telescope) | `<leader><space>` |
| Next buffer | `<leader><Tab>` |
| Prev buffer | `<leader><S-Tab>` |
| Jump to buffer 1/2/3 | `<leader>1` / `<leader>2` / `<leader>3` |
| Close buffer | `<leader>bc` |
| **Windows** | |
| Split vertical | `<leader>sv` |
| Split horizontal | `<leader>sh` |
| Close window | `<leader>wc` |
| Navigate splits | `<C-h/j/k/l>` |
| **File operations** | |
| Save | `<leader>w` |
| Quit | `<leader>q` |
| Close tab | `<leader>tc` |
| **LSP** | |
| Go to definition | `gd` |
| Hover docs | `K` |
| References | `gr` |
| Rename symbol | `<leader>rn` |
| Code action | `<leader>ca` |
| Format | `<Space>F` |
| **Completion** | |
| Trigger completion | `<C-Space>` |
| Confirm completion | `<CR>` |
| Navigate completion | `<Tab>` / `<S-Tab>` |
| **Terminal** | |
| Toggle terminal | `<C-\>` |
| **Treesitter** | |
| Expand selection | `<leader>v` |
| Shrink selection | `<leader>V` |
| Next function | `]f` |
| Previous function | `[f` |
| Function text object | `af` / `if` |
| Class text object | `ac` / `ic` |
| **Comments** | |
| Toggle line comment | `gcc` |
| Toggle visual comment | `gc` |
| Toggle block comment | `gbc` / `gb` |
| **AI** | |
| Toggle Claude sidebar | `<leader>aa` |
| Toggle Claude (named) | `<leader>ac` |
| Send buffer context to CLI | `<leader>as` |
| Send visual selection to CLI | `<leader>av` |
| Prompt picker | `<leader>ap` |
| Select CLI tool | `<leader>at` |
| Focus CLI window | `<leader>af` |
| Accept Copilot suggestion (insert) | `<C-l>` |
