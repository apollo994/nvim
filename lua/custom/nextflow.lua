-- Hot patch nvim-lspconfig to add Nextflow language server
require('lspconfig.configs').nextflow_ls = {
  default_config = {
    cmd = { 'java', '-jar', vim.fn.stdpath('config') .. '/bin/language-server-all.jar' },
    filetypes = { 'nextflow' },
    root_dir = function(fname)
      local util = require 'lspconfig.util'
      return util.root_pattern('nextflow.config')(fname) or util.find_git_ancestor(fname)
    end,
    settings = {
      nextflow = {
        files = {
          exclude = { '.git', '.nf-test', 'work' },
        },
      },
    },
  },
}

require('lspconfig').nextflow_ls.setup {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

vim.treesitter.language.register('groovy', 'nextflow')
