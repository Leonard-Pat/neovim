return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver", "rust_analyzer", "lua_ls", "cairo_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.cairo_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			local keymap = vim.keymap -- for conciseness

			-- set keybinds
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references

			keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration

			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP implementations" }) -- show lsp definitions

			vim.keymap.set("n", "<leader>fd", function()
				require("telescope.builtin").lsp_document_symbols({
					ignore_symbols = { "boolean", "string", "array", "object" },
				})
			end, { desc = "Search functions in current file" })

			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementation" }) -- show lsp implementations

			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "See LSP type definitions" }) -- show lsp type definitions

			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Show buffer diagnostics" }) -- smart rename

			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor

			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Resart LSP" }) -- mapping to restart lsp if necessary
		end,
	},
}
