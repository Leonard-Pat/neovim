return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- Find files, buffers, string and diagnostics
		keymap.set("n", "<leader>fa", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

		keymap.set(
			"n",
			"<leader>fF",
			"<cmd>lua require'telescope.builtin'.find_files({no_ignore=true})<cr>",
			{ desc = "Fuzzy find files in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fs",
			telescope.extensions.live_grep_args.live_grep_args,
			{ desc = "Find string in cwd" }
		)

		-- Sort through todos
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
