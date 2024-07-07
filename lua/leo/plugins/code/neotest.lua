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
					command = "/Users/leopat/.asdf/shims/scarb run test-ts --full-trace",
					env = { CI = true },
					command_args = function(context)
						return {}
					end,
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})
		local keymap = vim.keymap
		keymap.set(
			"n",
			"<leader>nr",
			'<cmd>:lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
			{ desc = "Run test" }
		)
		keymap.set("n", "<leader>no", "<cmd>Neotest output<CR>", { desc = "Test Output" })
		keymap.set("n", "<leader>ni", "<cmd>Neotest attach<CR>", { desc = "Attach to test" })
		keymap.set("n", "<leader>ns", "<cmd>Neotest summary<CR>", { desc = "Test summary panel" })
		keymap.set("n", "<leader>nk", "<cmd>Neotest stop<CR>", { desc = "Stop test" })
	end,
}
