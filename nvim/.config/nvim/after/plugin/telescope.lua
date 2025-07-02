local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Visual mode: search for selected text
vim.keymap.set('v', '<leader>rg', '"zy:Telescope grep_string search=<C-r>z<CR>', {})

-- Telescope search word under cursor
vim.keymap.set("n", "<leader>rw", function()
    local word = vim.fn.expand("<cword>")
    if word == "" then
        print("No word under cursor")
        return
    end
    require('telescope.builtin').grep_string({ search = word })
end, { desc = "Telescope search word under cursor" })


