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

### Clipboard
Uses OSC 52 protocol (`vim.g.clipboard`) for clipboard support over SSH/remote sessions.

## Key Mappings Reference

| Action | Keymap |
|--------|--------|
| Completion trigger | `<C-Space>` |
| Confirm completion | `<CR>` |
| Toggle terminal | `<C-\>` |
| Treesitter expand selection | `<leader>v` |
| Treesitter shrink selection | `<leader>V` |
| Next function | `]f` |
| Previous function | `[f` |
| Function text object | `af` / `if` |
| Class text object | `ac` / `ic` |
