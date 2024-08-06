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

			require("lspconfig").typos_lsp.setup({
				-- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
				cmd_env = { RUST_LOG = "error" },
				init_options = {
					-- Custom config. Used together with a config file found in the workspace or its parents,
					-- taking precedence for settings declared in both.
					-- Equivalent to the typos `--config` cli argument.
					config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
					-- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
					-- Defaults to error.
					diagnosticSeverity = "Error",
				},
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

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

			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary

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

			keymap.set(
				"n",
				"<leader>fi",
				"<cmd>Telescope lsp_implementations<CR>",
				{ desc = "Show LSP implementation" }
			) -- show lsp implementations
		end,
	},
}
