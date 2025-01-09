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
				ensure_installed = { "ts_ls", "rust_analyzer", "lua_ls", "cairo_ls" },
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
		opts = {
			excluded_lsp_clients = {
				"copilot",
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "dmmulroy/ts-error-translator.nvim" },
		lazy = false,
		config = function()
			-- better ts error messages
			require("ts-error-translator").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			lspconfig.cairo_ls.setup({
				capabilities = capabilities,
				init_options = { hostInfo = "neovim" },
				cmd = { "scarb", "cairo-language-server", "/C", "--node-ipc" },
				filetypes = { "cairo" },
				root_dir = util.root_pattern("Scarb.toml", "cairo_project.toml", ".git"),
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = { "std", "e2e" },
						},
					},
				},
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.solidity_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
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

			-- set keybinds
			local keymap = vim.keymap

			-- fzf keybinds
			keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", { desc = "Show LSP references" })
			keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Show LSP implementations" })
			keymap.set("n", "<leader>fM", function()
				require("fzf-lua").lsp_workspace_symbols({
					regex_filter = function(entry, _)
						local symbols_to_filter = { "boolean", "string", "array", "object", "constant", "variable" }
						-- Return false for symbols we want to filter out
						return not vim.tbl_contains(symbols_to_filter, entry.kind:lower())
					end,
				})
			end, { desc = "Search functions in workspace" })
			keymap.set("n", "<leader>fm", function()
				require("fzf-lua").lsp_document_symbols({
					regex_filter = function(entry, _)
						local symbols_to_filter = { "boolean", "string", "array", "object", "constant", "variable" }
						-- Return false for symbols we want to filter out
						return not vim.tbl_contains(symbols_to_filter, entry.kind:lower())
					end,
				})
			end, { desc = "Search functions in current file" })
			keymap.set("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Show LSP implementation" })

			-- general lsp keybinds
			keymap.set("n", "<space>q", vim.diagnostic.open_float, { desc = "open floating diagnostics" })
			keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

			-- custom command to toggle diagnostics
			vim.api.nvim_create_user_command("DiagnosticToggle", function()
				local config = vim.diagnostic.config
				local vt = config().virtual_text
				config({
					virtual_text = not vt,
					underline = not vt,
					signs = not vt,
				})
			end, { desc = "toggle diagnostic" })
			keymap.set("n", "<leader>lx", "<cmd>DiagnosticToggle<CR>", { desc = "Toggle diagnostics" })
		end,
	},
}
