-- macOS: enable clipboard integration (works fine)
-- Linux: disable to prevent wl-clipboard spam
if vim.fn.has("mac") == 1 then
	vim.opt.clipboard = "unnamedplus"
else
	vim.opt.clipboard = ""
end

-- Manual clipboard commands if you need them
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
