-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- theme
  use "savq/melange-nvim"

  use {
      'nvim-treesitter/nvim-treesitter',
      branch = 'main',
      run = ':TSUpdate'
  }
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP Support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- move sui syntax highlighting
  use {
      'yanganto/move.vim',
      branch = 'sui-move'
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('sbdchd/neoformat')
  use('windwp/nvim-ts-autotag')
  use {
      'windwp/nvim-autopairs',
      config = function()
          require('nvim-autopairs').setup({})
      end
  }
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- zen mode
  use("folke/zen-mode.nvim")

  -- obsidian
  use {
      "epwalsh/obsidian.nvim",
      requires = {
          -- Required.
          "nvim-lua/plenary.nvim"
      }
  }

  -- which-key for keybinding discovery
  use {
      "folke/which-key.nvim",
      config = function()
          require("which-key").setup({})
      end
  }

  -- copilot
  use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
          require("copilot").setup({
              suggestion = { enabled = false },
              panel = { enabled = true },
              copilot_node_command = vim.fn.expand("$HOME") .. '/.nvm/versions/node/v22.21.0/bin/node',
          })
      end,
  }

  use {
      'zbirenbaum/copilot-cmp',
      after = {'copilot.lua'},
      config = function ()
          require('copilot_cmp').setup()
      end
  }

  -- claude-code.nvim integration
  use {
      'greggh/claude-code.nvim',
      requires = {
          'nvim-lua/plenary.nvim', -- Git operations
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
      end
  }
end)

