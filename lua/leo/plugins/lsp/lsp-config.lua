return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local lspconfig = require("lspconfig")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})
		lspconfig.cairo_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
	end,
}
