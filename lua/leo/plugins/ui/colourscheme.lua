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
					LineNrAbove = { fg = nordic_colors.gray3, bold = false },
					LineNrBelow = { fg = nordic_colors.gray3, bold = false },
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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				highlight_overrides = {
					all = function(colors)
						local overrides = {
							Headline = { style = { "bold" } },
						}
						for _, hl in ipairs({ "Headline", "rainbow" }) do
							for i, c in ipairs({ "blue", "mauve", "teal", "green", "peach", "flamingo" }) do
								overrides[hl .. i] = { fg = colors[c], style = { "bold" } }
							end
						end
						return overrides
					end,
					macchiato = function(colors)
						local overrides = {
							CurSearch = { bg = colors.peach },
							CursorLineNr = { fg = colors.blue, style = { "bold" } },
							FloatTitle = { fg = colors.mauve },
							Headline = { style = { "bold" } },
							IncSearch = { bg = colors.peach },
							MsgArea = { fg = colors.overlay1 },
							Search = { bg = colors.mauve, fg = colors.base },
							TreesitterContextBottom = { sp = colors.overlay1, style = { "undercurl" } },
							WinSeparator = { fg = colors.surface1, style = { "bold" } },
							Underlined = { style = { "undercurl" } },

							LineNr = { fg = colors.peach, bold = true },
							LineNrAbove = { fg = colors.overlay1, bold = false },
							LineNrBelow = { fg = colors.overlay1, bold = false },
						}
						for _, hl in ipairs({ "Headline", "rainbow" }) do
							for i, c in ipairs({ "blue", "pink", "lavender", "green", "peach", "flamingo" }) do
								overrides[hl .. i] = { fg = colors[c], style = { "bold" } }
							end
						end
						return overrides
					end,
				},
				color_overrides = {
					macchiato = {
						rosewater = "#F5B8AB",
						flamingo = "#F29D9D",
						pink = "#AD6FF7",
						mauve = "#FF8F40",
						red = "#E66767",
						maroon = "#EB788B",
						peach = "#FAB770",
						yellow = "#FACA64",
						green = "#70CF67",
						teal = "#4CD4BD",
						sky = "#61BDFF",
						sapphire = "#4BA8FA",
						blue = "#00BFFF",
						lavender = "#00BBCC",
						text = "#C1C9E6",
						subtext1 = "#A3AAC2",
						subtext0 = "#8E94AB",
						overlay2 = "#7D8296",
						overlay1 = "#676B80",
						overlay0 = "#464957",
						surface2 = "#3A3D4A",
						surface1 = "#2F313D",
						surface0 = "#1D1E29",
						base = "#0b0b12",
						mantle = "#11111a",
						crust = "#191926",
					},
				},
			})
			-- vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
