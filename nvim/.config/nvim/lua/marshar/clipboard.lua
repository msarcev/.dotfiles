-- Disable automatic clipboard integration to prevent wl-clipboard spam
vim.opt.clipboard = ""

-- Manual clipboard commands if you need them
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
