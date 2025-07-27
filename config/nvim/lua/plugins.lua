-- hayloft plugin setup via lazy.nvim 🌾

require("lazy").setup({
  -- Visuals & UI
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim" },  -- Modern airline
  { "nvim-tree/nvim-tree.lua" },    -- NERDTree alternative

  -- Core functionality
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "windwp/nvim-autopairs" }, -- Lua version of auto-pairs

  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Git integration
  { "tpope/vim-fugitive" },

  -- Multicursor
  { "mg979/vim-visual-multi" },

  -- Colorscheme fallback (feel free to switch later)
  { "ellisonleao/gruvbox.nvim" },
})

