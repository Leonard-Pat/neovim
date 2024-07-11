return {
	{
		"AlexvZyl/nordic.nvim",
		config = function()
			local palette = require("nordic.colors")
			local main_highlight = palette.orange.base
			require("nordic").setup({
				telescope = {
					style = "classic",
				},
				override = {
					-- Line Numbers
					LineNr = { fg = main_highlight, bold = true },
					LineNrAbove = { fg = palette.gray2, bold = false },
					LineNrBelow = { fg = palette.gray2, bold = false },
					-- UI
					NormalFloat = { link = "TelescopeNormal" },
					FloatTitle = { link = "TelescopeTitle" },
					FloatBorder = { link = "TelescopePreviewBorder" },
					-- StatusLine
					StatusLine = { fg = palette.gray2, bg = palette.black0 },
					StatusLineHighlight = { fg = palette.gray2, bg = main_highlight },
					StatusLineSep = { fg = main_highlight, bg = palette.black0 },
				},
			})

			require("nordic").load()
		end,
	},
	{ "catppuccin/nvim" },
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
			-- vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
--
