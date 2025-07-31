require("options")
require("plugins")
require("nvim-autopairs").setup({
  check_ts = true,  -- treesitter-aware
  enable_check_bracket_line = false,
  map_cr = true, -- enable <CR> auto indent
  disable_filetype = { "TelescopePrompt" },
})
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

-- Add space between brackets: ( | )
--npairs.add_rules({
--  Rule(" ", " ")
--    :with_pair(function(opts)
--      local pair = opts.line:sub(opts.col - 1, opts.col)
--      return vim.tbl_contains({ "()", "[]", "{}" }, pair)
--    end),
--  Rule("( ", " )"):with_pair(function() return false end),
--  Rule("{ ", " }"):with_pair(function() return false end),
--  Rule("[ ", " ]"):with_pair(function() return false end),
--})

require("lsp")
require("keymaps")
