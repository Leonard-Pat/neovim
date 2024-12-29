return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		bigfile = { enabled = true },
		indent = { enabled = true, char = "┊", scope = {
			char = "┊",
		} },
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
