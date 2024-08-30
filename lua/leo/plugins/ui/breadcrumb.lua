return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		theme = "onedark",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			-- configurations go here
		},
		conifg = function()
			require("barbecue.ui").toggle()
		end,
	},
}
