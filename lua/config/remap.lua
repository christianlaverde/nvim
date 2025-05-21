vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest keymap ever - via theprimeagen
vim.keymap.set("v", "<leader>p", '\"_dP')

-- vim.keymap.set("n", "J", "mzJ`c")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- QuickFix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>");
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>");


