vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("<CR>")', {
    expr = true,
    replace_keycodes = false
})

vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.g.copilot_no_enter_map = true

