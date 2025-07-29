-- hayloft keymaps 🐓

-- Set leader
vim.g.mapleader = ","

-- Navigation
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Plugin mappings
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

