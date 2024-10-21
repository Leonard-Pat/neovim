return {
	{
		"Everblush/nvim",
		config = function()
			require("everblush").setup({
				override = {
					IndentBlanklineChar = {
						fg = "#a8aecb",
					},
					TelescopeBorder = { fg = "#dadada" },
					LineNr = { fg = "#b3b9b8" },
				},
			})
			vim.cmd.colorscheme("everblush")
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
				highlights = {
					WhichKey = { fg = "#d19a66" },
					WhichKeyDesc = { fg = "#848b98" },
					WhichKeyGroup = { fg = "#61afef" },
					BufferLineFill = { bg = "#202328" },
				},
			})

			-- vim.cmd.colorscheme("onedark")
		end,
	},
}
