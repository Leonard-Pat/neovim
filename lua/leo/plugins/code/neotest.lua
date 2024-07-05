return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"adrigzr/neotest-mocha",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-mocha")({
					command = "/Users/leopat/.asdf/shims/scarb run test-ts",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
