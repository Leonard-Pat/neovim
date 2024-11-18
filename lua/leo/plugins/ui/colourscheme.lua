return {
	{
		"ccxnu/rosebones",
		config = function()
			require("rosebones").setup({
				on_highlights = function(h, c)
					h.Function = { fg = c.rose }
				end,
			})
		end,
	},
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					Function = { fg = "rose" },
					fill = {
						fg = "rose",
						bg = "rose",
					},
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
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
			-- vim.cmd.colorscheme("everblush")
		end,
	},
}
