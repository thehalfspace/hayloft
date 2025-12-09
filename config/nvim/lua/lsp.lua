-- hayloft LSP setup 🐑

-- 1. Mason plugin setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "rust_analyzer", "julials", "clangd" },
  automatic_installation = true,
})

-- 2. General LSP capabilities
vim.lsp.config("pyright", {})
vim.lsp.enable({ "pyright" })

vim.lsp.config("rust_analyzer", {})
vim.lsp.enable({ "rust_analyzer" })

vim.lsp.config("julials", {})
vim.lsp.enable({ "julials" })

vim.lsp.config("clangd", {})
vim.lsp.enable({ "clangd" })

-- 4. Autoformat on save with clang-format 🪚
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.h", "*.cu" },
  callback = function()
    vim.cmd("silent! !clang-format -i %")
  end,
})

