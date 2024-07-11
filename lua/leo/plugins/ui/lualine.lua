return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local C = require("nordic.colors")

		lualine.setup({
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				theme = "nordic",
				section_separators = { left = " ", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = { "" },
						separator = { right = " ", left = "" },
					},
				},
				lualine_b = { "filename" },
				lualine_c = {
					{
						"branch",
						icon = { " " },
						separator = "",
						padding = 0,
					},
					{
						"diff",
						colored = true, -- Displays a colored diff status if set to true
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						source = nil,
					},
				},
				lualine_d = { "harpoon2" },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󱤅 ",
							other = "󰠠 ",
						},
						colored = true,
						padding = 2,
					},
					"fileformat",
					"filetype",
				},
				lualine_y = {},
				lualine_z = {
					{
						"location",
						icon = { "", align = "left" },
					},
					{
						"progress",
						icon = { "", align = "left" },
						separator = { right = "", left = "" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "mason", "lazy", "telescope", "nvim-tree" },
		})
	end,
}
