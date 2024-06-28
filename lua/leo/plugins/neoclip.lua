return {
	"AckslD/nvim-neoclip.lua",
	config = function()
		local neoclip = require("neoclip")
		neoclip.setup()

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Toggle neoclip" })
	end,
}
