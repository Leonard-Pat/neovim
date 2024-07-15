return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- extend the filetypes for which snippets are enabled
		-- emmet snippets for react
		require("luasnip").filetype_extend("typescript", { "typescriptreact" })
		require("luasnip").filetype_extend("typescript", { "html" })

		-- Make snippets less intrusive
		local types = require("cmp.types")
		deprioritize_snippet = function(entry1, entry2)
			if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
				return false
			end
			if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
				return true
			end
		end

		cmp.setup({
			enabled = function()
				buftype = vim.api.nvim_buf_get_option(0, "buftype")
				if buftype == "prompt" then
					return false
				end
				-- disable completion in comments
				local context = require("cmp.config.context")
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end
			end,
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			filetypes = {
				markdown = {
					sources = {},
				},
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- file system paths
				{ name = "buffer" }, -- text within current buffer
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			sorting = {
				priority_weight = 2,
				comparators = {
					deprioritize_snippet,
					-- the rest of the comparators are pretty much the defaults
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.scopes,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		local s = luasnip.snippet
		local t = luasnip.text_node
		local i = luasnip.insert_node
		local f = luasnip.function_node

		-- describe block for tests
		luasnip.add_snippets("typescript", {
			s("dblock ", {
				t('describe("'),
				f(function()
					local filename = vim.fn.expand("%:t")
					local name = filename:gsub("%.test%.ts$", "")
					name = name:gsub("_", " ")
					name = name:gsub("^%l", string.upper)
					return name .. " Tests"
				end, {}),
				t('", function () {'),
				t({ "", '  it("' }),
				i(1),
				t('", async function () {'),
				t({ "", "    " }),
				i(2),
				t({ "", "  });", "});" }),
			}),
		})

		-- it block for tests
		luasnip.add_snippets("typescript", {
			s("itblock", {
				t('it("'),
				i(1),
				t('", async function () {'),
				t({ "", "  " }),
				i(2),
				t({ "", "});" }),
			}),
		})
	end,
}
