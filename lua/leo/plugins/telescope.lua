return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
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

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fa", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

		-- lsp

		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>", { desc = "Show all diagnostics" })
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP implementations" })

		vim.keymap.set("n", "<leader>fD", function()
			require("telescope.builtin").lsp_workspace_symbols({
				ignore_symbols = { "boolean", "string", "array", "object" },
			})
		end, { desc = "Search functions in workspace" })

		vim.keymap.set("n", "<leader>fd", function()
			require("telescope.builtin").lsp_document_symbols({
				ignore_symbols = { "boolean", "string", "array", "object" },
			})
		end, { desc = "Search functions in current file" })

		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementation" }) -- show lsp implementations

		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "See LSP type definitions" }) -- show lsp type definitions
	end,
}
