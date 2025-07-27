require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").pyright.setup{}
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").julials.setup{}

