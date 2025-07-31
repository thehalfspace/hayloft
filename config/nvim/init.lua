require("options")
require("plugins")
require("nvim-autopairs").setup({
  check_ts = true,  -- treesitter-aware
  enable_check_bracket_line = false,
  map_cr = true, -- enable <CR> auto indent
  disable_filetype = { "TelescopePrompt" },
})

require("lsp")
require("keymaps")
