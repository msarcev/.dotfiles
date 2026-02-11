return {
  -- Colorscheme
  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'melange'

      function Colorize(color)
        color = color or 'melange'
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#292522" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#867462", bg = "#292522" })
      end

      Colorize()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'dracula',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = {}, winbar = {} },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = { statusline = 100, tabline = 100, winbar = 100 }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {{
            'filename',
            path = 1,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          }},
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },

  -- Noice - better UI for messages, cmdline, and popups
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#292522",
        },
      },
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").toggle()
          vim.wo.wrap = false
          Colorize()
        end,
        desc = "Toggle Zen Mode"
      },
    },
    config = function()
      require("zen-mode").setup {
        window = {
          width = 121,
          options = {
            number = true,
            relativenumber = true,
          }
        },
      }
    end,
  },
}
