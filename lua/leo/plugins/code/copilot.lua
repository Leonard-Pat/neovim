return {
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		event = "VeryLazy",
		opts = {
			debug = true, -- Enable debugging
			show_help = true, -- Show help actions
			window = {
				layout = "float",
			},
		},
	},
}
