-- hayloft LSP setup 🐑

-- 1. Mason plugin setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "rust_analyzer", "julials", "clangd" },
  automatic_installation = true,
})

-- 2. General LSP capabilities
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- 3. Setup each language server explicitly
local servers = { "pyright", "rust_analyzer", "julials", "clangd" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

-- 4. Autoformat on save with clang-format 🪚
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.h", "*.cu" },
  callback = function()
    vim.cmd("silent! !clang-format -i %")
  end,
})

