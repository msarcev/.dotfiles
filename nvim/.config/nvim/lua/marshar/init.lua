require("marshar.packer")
require("marshar.remap")
require("marshar.set")
require("marshar.netrw")

local augroup = vim.api.nvim_create_augroup
local MarsharGroup = augroup('Marshar', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = MarsharGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

