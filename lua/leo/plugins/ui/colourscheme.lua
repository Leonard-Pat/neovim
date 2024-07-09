return {
	{ "catppuccin/nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "tiagovla/tokyodark.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,

		opts = {},
		config = function()
			require("tokyonight").setup({
				-- your other options here
				on_highlights = function(hl, c)
					hl.LineNr = { fg = c.white, bold = true }
				end,
			})
			-- Apply the colorscheme
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
--
