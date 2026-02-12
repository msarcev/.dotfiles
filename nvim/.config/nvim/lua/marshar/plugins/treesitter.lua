return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			local ensure_installed = {
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			}

			-- Setup treesitter
			ts.setup({
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- Install missing parsers
			local installed = ts.get_installed and ts.get_installed() or {}
			local to_install = vim.tbl_filter(function(lang)
				return not vim.tbl_contains(installed, lang)
			end, ensure_installed)

			if #to_install > 0 then
				ts.install(to_install)
			end

			-- Enable highlighting for filetypes with parsers
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
				end,
			})
		end,
	},
}
