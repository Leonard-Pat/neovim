return {
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

				vim.keymap.set("n", "<leader>hp", gitsign.preview_hunk_inline, { desc = "Preview hunk" })
				vim.keymap.set("n", "<leader>td", gitsign.toggle_deleted, { desc = "Toggle deleted" })
				vim.keymap.set("n", "]h", gitsign.next_hunk, { desc = "Next Hunk" })
				vim.keymap.set("n", "[h", gitsign.prev_hunk, { desc = "Prev Hunk" })

				vim.keymap.set("v", "<leader>hr", function()
					gitsign.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })

				vim.keymap.set("n", "<leader>hR", gitsign.reset_buffer, { desc = "Reset buffer" })

				vim.keymap.set("n", "<leader>hd", gitsign.diffthis, { desc = "Diff entire buffer" })

				-- Text object
				vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
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
