return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	opts = {
		replace_engine = {
			["sed"] = {
				cmd = "sed",
				args = {
					"-i",
					"",
					"-E",
				},
			},
		},
	},
}
