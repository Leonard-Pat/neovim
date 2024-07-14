return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		presets = "helix",
		win = {
			border = "single", -- none, single, double, shadow
		},
		layout = {
			align = "center",
			spacing = 2,
		},
	},
}
