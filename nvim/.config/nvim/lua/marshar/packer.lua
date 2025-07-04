-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- theme
  use "savq/melange-nvim"

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          --- Uncomment these if you want to manage LSP servers from neovim
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- LSP Support
          {'neovim/nvim-lspconfig'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

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
              suggestion = { enabled = true },
              panel = { enabled = true },
              copilot_node_command = vim.fn.expand("$HOME") .. '/.nvm/versions/node/v20.17.0/bin/node',
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

