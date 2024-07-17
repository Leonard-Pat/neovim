return {
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR 'ibhagwan/fzf-lua',
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup({
				suppress_missing_scope = {
					projects_v2 = true,
				},
			})
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function()
				local gitsign = package.loaded.gitsigns

				vim.keymap.set("n", "<leader>gp", gitsign.preview_hunk_inline, { desc = "Preview hunk" })
				vim.keymap.set("n", "<leader>gt", gitsign.toggle_deleted, { desc = "Toggle deleted" })
				vim.keymap.set("n", "]h", gitsign.next_hunk, { desc = "Next Hunk" })
				vim.keymap.set("n", "[h", gitsign.prev_hunk, { desc = "Prev Hunk" })

				vim.keymap.set("v", "<leader>gr", function()
					gitsign.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })

				vim.keymap.set("n", "<leader>gR", gitsign.reset_buffer, { desc = "Reset buffer" })

				vim.keymap.set("n", "<leader>gd", gitsign.diffthis, { desc = "Diff entire buffer" })
			end,
		},
	},
	{

		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
	},
}
