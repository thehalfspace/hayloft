require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").pyright.setup{}
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").julials.setup{}
require("lspconfig").clangd.setup{}

-- Autoformat on save with clang-format 🪚
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.cpp', '*.h', '*.cu' },
    callback = function()
        vim.cmd('silent! !clang-format -i %')
    end
})

