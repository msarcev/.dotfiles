vim.g.mapleader = " "

vim.keymap.set("n", "<C-f>", vim.cmd.Vex)

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

-- copy clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+yg_")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>yy", "\"+yy")

-- paste clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+P")

-- Moving text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")

vim.keymap.set("n", "<leader>m", ":Neoformat<CR>")
vim.keymap.set("v", "<leader>m", ":Neoformat<CR>")

vim.keymap.set("i", "<C-q>", "<esc>")

-- sub word
vim.keymap.set("n", "<Leader>vs", [[:%s/<C-r><C-w>//g<Left><Left>]])

-- exit
vim.keymap.set("n", "<leader>q", ":qa<CR>")
