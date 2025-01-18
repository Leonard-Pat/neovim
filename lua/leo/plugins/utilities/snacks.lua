return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		bigfile = { enabled = true },
		indent = { enabled = true, char = "┊", scope = {
			char = "┊",
		} },
		picker = {},
		zen = {
			toggles = {
				dim = false,
				win = {
					style = {
						enter = true,
						fixbuf = false,
						minimal = false,
						width = 500,
						height = 0,
						backdrop = { transparent = false },
						keys = { q = false },
						zindex = 40,
						wo = {
							winhighlight = "NormalFloat:Normal",
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>gc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
