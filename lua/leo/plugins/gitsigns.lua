return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gitsign = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			map("n", "<leader>hp", gitsign.preview_hunk_inline, "Preview hunk")
			map("n", "<leader>td", gitsign.toggle_deleted)
			map("n", "]h", gitsign.next_hunk, "Next Hunk")
			map("n", "[h", gitsign.prev_hunk, "Prev Hunk")

			map("v", "<leader>hr", function()
				gitsign.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>hR", gitsign.reset_buffer, { desc = "Reset buffer" })

			map("n", "<leader>hd", gitsign.diffthis, "Diff this")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
