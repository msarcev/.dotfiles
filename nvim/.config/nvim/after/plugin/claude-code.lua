local claude = require('claude-code')

-- Toggle Claude Code terminal
vim.keymap.set('n', '<C-,>', claude.toggle, { desc = 'Toggle Claude Code terminal' })

-- Claude Code specific commands
vim.keymap.set('n', '<leader>cc', ':ClaudeCode<CR>', { desc = 'Open Claude Code' })
vim.keymap.set('n', '<leader>cC', ':ClaudeCodeContinue<CR>', { desc = 'Continue Claude conversation' })
vim.keymap.set('n', '<leader>cr', ':ClaudeCodeResume<CR>', { desc = 'Resume Claude conversation' })
vim.keymap.set('n', '<leader>cv', ':ClaudeCodeVerbose<CR>', { desc = 'Claude verbose mode' })

-- Additional helpful keymaps
vim.keymap.set('n', '<leader>ca', function()
    -- Send current file to Claude
    vim.cmd('ClaudeCode ' .. vim.fn.expand('%'))
end, { desc = 'Send current file to Claude' })

vim.keymap.set('v', '<leader>cs', function()
    -- Get visual selection and send to Claude
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
    
    -- Save selection to temp file and send to Claude
    local temp_file = vim.fn.tempname()
    vim.fn.writefile(lines, temp_file)
    vim.cmd('ClaudeCode ' .. temp_file)
end, { desc = 'Send selection to Claude' })