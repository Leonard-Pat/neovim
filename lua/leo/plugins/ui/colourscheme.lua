return {
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 2000,
		config = function()
			local nordic_colors = require("nordic.colors")
			local util = require("nordic.utils")

			local main_highlight = nordic_colors.orange.base
			require("nordic").setup({
				on_palette = function(palette)
					palette.gray0 = palette.black2
					return palette
				end,
				telescope = {
					style = "classic",
				},
				override = {
					bg = { bg = "#FFFFFF", fg = "#000000" },
					bg_dark = { bg = "#000000", fg = "#FFFFFF" },
					-- Line Numbers
					LineNr = { fg = main_highlight, bold = true },
					LineNrAbove = { fg = nordic_colors.gray2, bold = false },
					LineNrBelow = { fg = nordic_colors.gray2, bold = false },
					-- UI
					NormalFloat = { fg = nordic_colors.white0 },

					FloatTitle = { link = "TelescopeTitle" },
					FloatBorder = { fg = nordic_colors.orange.base, bg = nordic_colors.gray0 },
					-- StatusLine
					StatusLine = { fg = nordic_colors.gray2, bg = nordic_colors.black0 },
					StatusLineHighlight = { fg = nordic_colors.gray2, bg = main_highlight },
					StatusLineSep = { fg = main_highlight, bg = nordic_colors.black0 },

					BufferLineFill = { bg = nordic_colors.black0 },
					Visual = { bg = util.blend(nordic_colors.gray2, nordic_colors.white0, 0.7) },
				},
			})

			require("nordic").load()
		end,
	},
}
