return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		opts = {
			"default",
			oldfiles = {
				include_current_session = true,
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100, -- 100KB
				},
			},
			grep = {
				rg_glob = true,
				glob_flag = "--iglob",
				glob_separator = "%s%-%-",
			},
			files = {
				cwd_prompt = false, -- specific to files
			},
			fzf_opts = {
				["--info"] = "default",
				["--layout"] = "default",
			},
			winopts = {
				preview = {
					vertical = "up:45%",
				},
			},
		},
		config = function(_, opts)
			vim.g.lazyvim_picker = "fzf"
			require("fzf-lua").setup(opts)
		end,
		keys = {
			{ "<leader>fa", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Find diagnostics" },
			{ "<leader>fo", "<cmd>FzfLua buffers<cr>", desc = "Fuzzy find buffers" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Fuzzy find recent files" },
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fuzzy find files in cwd" },
			{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Find string in cwd" },
			{ "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Find todos" },
		},
	},
}
