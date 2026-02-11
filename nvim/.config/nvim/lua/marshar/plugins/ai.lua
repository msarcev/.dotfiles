return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = true },
        copilot_node_command = vim.fn.expand("$HOME") .. '/.nvm/versions/node/v22.22.0/bin/node',
      })
    end,
  },

  -- Copilot completion source
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require('copilot_cmp').setup()
    end,
  },

  -- Claude Code
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "ClaudeCode", "ClaudeCodeContinue", "ClaudeCodeResume", "ClaudeCodeVerbose" },
    keys = {
      { "<C-,>", function() require('claude-code').toggle() end, desc = "Toggle Claude Code terminal" },
      { "<leader>cc", ":ClaudeCode<CR>", desc = "Open Claude Code" },
      { "<leader>cC", ":ClaudeCodeContinue<CR>", desc = "Continue Claude conversation" },
      { "<leader>cr", ":ClaudeCodeResume<CR>", desc = "Resume Claude conversation" },
      { "<leader>cv", ":ClaudeCodeVerbose<CR>", desc = "Claude verbose mode" },
      { "<leader>ca", function() vim.cmd('ClaudeCode ' .. vim.fn.expand('%')) end, desc = "Send current file to Claude" },
      { "<leader>cl", ":ClaudeCode<CR>", desc = "Open Claude Code" },
    },
    config = function()
      require('claude-code').setup({
        window = {
          split_ratio = 0.3,
          position = "botright",
          enter_insert = true
        },
        command = "claude",
        command_variants = {
          continue = "--continue",
          resume = "--resume",
          verbose = "--verbose"
        }
      })

      vim.keymap.set('v', '<leader>cs', function()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")
        local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
        local temp_file = vim.fn.tempname()
        vim.fn.writefile(lines, temp_file)
        vim.cmd('ClaudeCode ' .. temp_file)
      end, { desc = 'Send selection to Claude' })
    end,
  },
}
