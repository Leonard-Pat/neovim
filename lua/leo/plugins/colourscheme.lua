return {
	{ "catppuccin/nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- Apply the colorscheme
			vim.cmd([[colorscheme tokyonight-night]])

			-- Create an autocmd to set the highlight after ColorScheme changes
			vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bold = true })
				end,
			}) -- Create an autocmd to set the highlight after ColorScheme changes

			-- Trigger the autocmd immediately
			vim.cmd([[doautocmd ColorScheme]])
		end,
	},
}
--
