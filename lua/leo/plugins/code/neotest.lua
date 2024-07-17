return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"adrigzr/neotest-mocha",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-mocha")({
					command = "/Users/leopat/.local/share/mise/shims/scarb run test-ts --full-trace",
					command_args = function(context)
						return {
							"--grep=" .. context.test_name_pattern,
							context.path,
						}
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
			{ desc = "Run all tests" }
		)
		keymap.set("n", "<leader>nR", '<cmd>:lua require("neotest").run.run()<CR>', { desc = "Run nearest test" })
		keymap.set("n", "<leader>no", "<cmd>Neotest attach<CR>", { desc = "Attach to test" })
		keymap.set("n", "<leader>ns", "<cmd>Neotest summary<CR>", { desc = "Test summary panel" })
		keymap.set("n", "<leader>nk", "<cmd>Neotest stop<CR>", { desc = "Stop test" })
	end,
}
