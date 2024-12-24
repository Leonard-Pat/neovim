return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		opts = {
			oldfiles = {
				include_current_session = true,
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100, -- 100KB
				},
			},
			grep = {
				rg_glob = true, -- enable glob parsing
				glob_flag = "--iglob", -- case insensitive globs
				glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
			},
			files = {
				cwd_prompt = false,
			},
			fzf_opts = {
				["--info"] = "default",
				["--layout"] = "default",
			},
		},
		config = function()
			vim.g.lazyvim_picker = "fzf"
			-- set keymaps
			local keymap = vim.keymap
			require("fzf-lua").setup({ winopts = {
				preview = {
					vertical = "up:45%",
				},
			} })
			-- Find files, buffers, string and diagnostics
			keymap.set("n", "<leader>fa", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Find diagnostics" })
			keymap.set("n", "<leader>fo", "<cmd>FzfLua buffers<cr>", { desc = "Fuzzy find buffers" })
			keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", { desc = "Find string in cwd" })

			-- Todo search using TodoFzfLua command
			keymap.set("n", "<leader>ft", "<cmd>TodoFzfLua<cr>", { desc = "Find todos" })
		end,
	},
}
