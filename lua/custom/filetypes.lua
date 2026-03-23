-- Add custom filetypes
vim.filetype.add {
  extension = {
    smk = 'snakemake',
    nf = 'nextflow',
  },
  filename = {
    ['Snakefile'] = 'snakemake',
    ['nextflow.config'] = 'nextflow',
  },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.smk', 'Snakefile' },
  command = 'autocmd FileType snakemake setlocal commentstring=#%s',
})
