return {
  -- Harpoon for quick file switching
  {
    "theprimeagen/harpoon",
    keys = {
      { "<leader>af", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
      { "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
      { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
    },
  },

  -- Undo history visualization
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    },
  },
}
