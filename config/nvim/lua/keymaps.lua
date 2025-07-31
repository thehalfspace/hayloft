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

-- nvimtree
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- vim slime
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1
-- Send selection or current line to terminal
vim.keymap.set("n", "<leader>st", "<Plug>SlimeParagraphSend", { desc = "Send paragraph to terminal" })
vim.keymap.set("v", "<leader>st", "<Plug>SlimeRegionSend", { desc = "Send selection to terminal" })
vim.keymap.set("n", "<leader>sl", "<Plug>SlimeLineSend", { desc = "Send current line to terminal" })
vim.keymap.set("n", "<leader>sc", "<Plug>SlimeConfig", { desc = "Slime config prompt" })

