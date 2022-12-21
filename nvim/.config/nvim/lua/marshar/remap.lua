vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Leader>+", ":vertical resize +5<CR>")
vim.keymap.set("n", "<Leader>-", ":vertical resize -5<CR>")
vim.keymap.set("n", "<Leader>rp", ":resize 100<CR>")

-- better pasta
vim.keymap.set("x", "<leader>p", "_dP<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Moving text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")

vim.keymap.set("n", "<leader>m", ":Neoformat<CR>")
vim.keymap.set("v", "<leader>m", ":Neoformat<CR>")

vim.keymap.set("i", "<C-q>", "<esc>")

