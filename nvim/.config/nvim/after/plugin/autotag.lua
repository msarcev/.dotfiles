-- nvim-ts-autotag config (requires explicit setup for nvim-treesitter 1.0+)
require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
