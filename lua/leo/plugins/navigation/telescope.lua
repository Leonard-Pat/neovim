return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>fa", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
		{ "<leader>fo", "<cmd>Telescope buffers<cr>", desc = "Fuzzy find buffers" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ no_ignore = true })
			end,
			desc = "Fuzzy find files in cwd (including ignored)",
		},
		{
			"<leader>fs",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			desc = "Find string in cwd",
		},
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
			},
			treesitter = {
				show_line = false,
				previewer = true,
			},
			colorscheme = {
				enable_preview = true,
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
	end,
}
