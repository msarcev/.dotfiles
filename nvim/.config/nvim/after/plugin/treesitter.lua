-- nvim-treesitter 1.0+ config (requires Neovim 0.11+)
-- On first setup: let nvim run for ~1 min to compile parsers

local ok, ts = pcall(require, 'nvim-treesitter')
if not ok then return end

-- Add nvim-treesitter runtime to runtimepath for queries
local ts_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/nvim-treesitter/runtime'
if vim.fn.isdirectory(ts_path) == 1 then
  vim.opt.runtimepath:prepend(ts_path)
end

-- Install parsers async (no-op if already installed)
-- Note: Add 'markdown' back after running :TSInstall markdown manually
ts.install({
  'bash',
  'c',
  'css',
  'html',
  'javascript',
  'json',
  'lua',
  'python',
  'rust',
  'tsx',
  'typescript',
  'vimdoc',
  'yaml',
})

-- Enable treesitter highlighting for buffers with a parser
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ft = args.match
    -- Skip filetypes that don't have parsers
    if ft == '' or ft == 'netrw' or ft == 'help' then return end
    pcall(vim.treesitter.start, args.buf)
  end,
})
