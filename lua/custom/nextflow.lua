vim.lsp.config("nextflow_ls", {
    cmd = { "java", "-jar", vim.fn.stdpath("config") .. "/bin/language-server-all.jar" },
    filetypes = { "nextflow" },
    root_markers = { "nextflow.config", ".git" },
    settings = {
        nextflow = {
            files = {
                exclude = { ".git", ".nf-test", "work" },
            },
        },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable("nextflow_ls")

vim.treesitter.language.register("groovy", "nextflow")
