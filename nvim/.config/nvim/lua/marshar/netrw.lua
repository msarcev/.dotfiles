vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0
vim.g.netrw_winsize = 25

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ProjectDrawer = augroup('ProjectDrawer', {})

autocmd({"VimEnter"}, {
    group = ProjectDrawer,
    pattern = "*",
    command = ":Vexplore",
})

