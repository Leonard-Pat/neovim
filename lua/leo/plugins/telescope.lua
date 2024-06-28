return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
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
		require("telescope").load_extension("undo")
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fa", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

		keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Find undo history" })
		-- lsp

		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP implementations" })

		vim.keymap.set("n", "<leader>fM", function()
			require("telescope.builtin").lsp_workspace_symbols({
				ignore_symbols = { "boolean", "string", "array", "object" },
			})
		end, { desc = "Search functions in workspace" })

		vim.keymap.set("n", "<leader>fm", function()
			require("telescope.builtin").lsp_document_symbols({
				ignore_symbols = { "boolean", "string", "array", "object" },
			})
		end, { desc = "Search functions in current file" })

		keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementation" }) -- show lsp implementations

		keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "See LSP type definitions" }) -- show lsp type definitions
	end,
}
