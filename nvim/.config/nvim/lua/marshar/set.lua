vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "141"

-- obsidian vim fix (?)
vim.opt.conceallevel = 2

-- Configure Neoformat for Rust
local neoformat_rust_rustfmt = {
	exe = "rustfmt",
	args = { "--emit=stdout", "--edition", "2021" },
	stdin = 1,
}
-- Enable Neoformat for Rust files
vim.g.neoformat_enabled_rust = { "rustfmt" }
-- Set the Neoformat configuration for Rust
vim.g.neoformat_rust_rustfmt = neoformat_rust_rustfmt
-- Enable Neoformat debug logging
vim.g.neoformat_verbose = 0
