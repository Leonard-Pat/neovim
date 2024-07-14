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
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "dmmulroy/ts-error-translator.nvim" },
		lazy = false,
		config = function()
			-- better ts error messages
			require("ts-error-translator").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cairo_ls.setup({
				capabilities = capabilities,
				cmd = { "scarb", "cairo-language-server", "--stdio" },
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

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local keymap = vim.keymap -- for conciseness

			-- set keybinds

			keymap.set("n", "<space>q", vim.diagnostic.open_float, { desc = "open floating diagnostics" })

			keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration

			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor

			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Resart LSP" }) -- mapping to restart lsp if necessary
		end,
	},
}
