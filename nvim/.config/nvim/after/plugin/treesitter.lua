-- nvim-treesitter 1.0+ config (requires Neovim 0.11+)
local ts = require('nvim-treesitter')

-- Install parsers (async, no-op if already installed)
ts.install({ 'javascript', 'typescript', 'c', 'lua', 'rust', 'python', 'vimdoc' })

-- Enable treesitter highlighting for supported filetypes
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
