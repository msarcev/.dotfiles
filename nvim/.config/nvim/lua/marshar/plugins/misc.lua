return {
	-- Move/Sui syntax highlighting
	{
		"yanganto/move.vim",
		branch = "sui-move",
		ft = "move",
	},

	-- Obsidian integration
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Which-key for keybinding discovery
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({})
		end,
	},
}
