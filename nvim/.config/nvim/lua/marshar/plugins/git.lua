return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiff", "Gblame", "Glog" },
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    },
  },
}
