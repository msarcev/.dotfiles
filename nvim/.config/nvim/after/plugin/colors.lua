vim.opt.termguicolors = true
vim.cmd.colorscheme 'melange'

function Colorize(color)
	color = color or 'melange'

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorize()

