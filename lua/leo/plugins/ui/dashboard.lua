return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⢾⢿⢟⢝⠻⢓⠲⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣆⢛⡇⡡⠑⠠⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⢆⣿⣟⣫⣞⡝⢵⡈⡄⠀⠀⠀⠀⡙⣻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣾⣿⣿⣿⣿⣿⣿⣻⣝⣇⠥⠡⠠⠐⡀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⢿⢿⣿⣿⣿⣿⣿⣿⣿⡷⠓⢩⡭⠄⠢⠘⣷⡀⠀⠀⠀⠀⠀⣠⡴⠟⣻⡿⡿⣿⣦⡀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣯⣳⣝⡿⣿⣿⣿⡿⣿⡿⡉⢐⠙⠳⢓⠀⢂⠨⡿⣦⠀⠀⠀⢰⠋⣄⡤⠖⠲⢍⠑⡻⣿⡄⠀⠀⠀⠀⠀",
			"⠀⠀⠀⣀⡤⠖⠒⡒⡒⡢⣤⡀⠀⠈⠻⢿⣿⣽⣿⣿⣿⣿⢆⣼⣮⣄⠸⡅⠄⢠⢸⣽⠇⠀⠀⠀⢸⠀⣼⡀⠀⠀⠀⢱⠩⣿⣼⠀⠀⠀⠀⠀",
			"⠀⢠⡾⠋⣤⠞⠛⠉⠉⠛⠳⣌⣢⡀⠀⠀⠉⠙⠛⠛⢿⣿⣾⣿⣾⣿⣷⢧⠅⢨⡀⡏⠀⣠⡄⠀⠈⢧⡳⣻⡄⠀⠀⢸⢐⣺⣿⠁⠀⠀⠀⠀",
			"⢠⣿⠡⣽⠃⠀⠀⠀⠀⠀⠀⠈⣧⢷⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⠭⠿⣗⢡⣁⠀⢮⣧⠀⣿⡁⠀⠀⠀⠹⡜⣿⡀⠀⢸⢐⣺⣿⠀⠀⠀⠀⠀",
			"⣼⡇⡊⣿⠀⠀⠀⠀⠀⠀⠀⠀⣼⣼⠀⣠⡴⣿⣿⣾⣾⢏⢿⡷⣒⢙⣓⣓⡪⠀⢺⡾⣦⢻⣟⣦⣤⣤⢴⣷⡿⠁⣰⢃⣢⣿⠏⠀⠀⠀⠀⠀",
			"⣿⡇⠂⠸⡄⠀⠀⠀⠀⠠⣤⣾⠿⢃⣞⣷⢿⢫⣿⡿⠣⢒⠽⣊⠅⠀⢲⣶⡍⠓⠀⢯⡪⢳⢭⣛⣛⣛⣛⣋⡵⠚⠁⢴⣮⢏⣴⠶⠶⣦⣄⠀",
			"⢻⠿⡐⠄⠹⣄⡀⠀⠀⠀⠀⢀⣠⠾⣫⢞⣾⡾⠋⢤⢊⣷⣿⡆⠀⣫⣵⣶⣶⣌⣅⢸⣷⣷⡢⡈⣉⠉⠉⡀⡠⢐⣨⠟⠁⠘⢧⡶⠀⠈⢻⣣",
			"⠈⢿⣿⣬⡢⡀⠙⠓⠶⠶⠚⡉⣠⣸⣯⡿⠋⢀⠢⣡⣿⣿⣿⠃⡮⣿⣿⡿⣿⣿⡨⡋⢿⣿⣿⡿⠾⠶⠷⠷⠛⠉⠀⠀⣀⣀⣀⣀⡀⠀⣸⢿",
			"⠀⠀⠑⠯⣾⣷⣷⣴⣦⠴⠼⠷⠛⠋⡁⡰⢐⣥⣾⣿⣿⣿⠃⣴⣪⣿⡯⠔⣹⣟⣇⢮⡈⢿⣷⣿⣦⡀⠀⠀⠀⢀⡠⠊⣡⣶⠤⠬⠭⠽⠽⠃",
			"⠀⠀⠀⠀⡬⠛⡩⡡⠄⢄⣴⣀⣖⣚⣬⣶⣿⣿⣿⡵⠋⣁⣔⣿⣿⡿⣙⢡⢿⣿⣿⡔⠦⡈⢿⣷⣷⣹⣓⢒⢒⢋⣴⣗⠟⠁⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⡞⠀⣺⣷⠿⠯⣽⣿⡿⠿⠿⠟⣿⣿⠟⢉⣤⢜⣽⣿⣿⡿⠥⢳⣾⡿⠋⢿⣿⡆⠪⢆⠙⠻⢿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⢰⣇⢐⣾⠁⣰⣫⠟⠓⢮⣳⡀⢠⠟⢠⣶⣵⣷⣟⣿⣿⠟⣡⣴⣿⠟⠁⠀⠈⠻⣿⣧⣤⡑⠓⣄⢤⢉⢙⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⣿⣦⡹⣄⢻⣳⣈⣿⠈⡇⡇⡏⠰⣻⡿⡭⢛⣽⠏⣤⣾⠿⠏⠁⢠⣔⣦⣴⡲⣄⠙⠿⣯⣿⣲⣖⣶⢥⣕⢌⠻⣄⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠘⢿⣷⣟⡺⢭⣿⣥⢾⣵⣿⣇⡋⣿⣾⠁⣾⢓⣽⡟⠋⠀⠀⠀⣧⠋⠁⠈⠙⣮⢣⠀⠀⢈⡩⢍⡉⠙⢿⣷⠤⢹⡄⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠙⠻⠿⠷⠷⠿⠛⣽⡟⣇⠅⣿⣧⠀⣿⡅⡏⠀⠀⡤⣖⣲⣷⡷⠶⠆⠀⢸⣺⡆⣴⢫⠏⠉⠉⠀⠀⣿⠨⢸⡇⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⣿⠿⡬⡹⡼⣄⢿⣦⠱⣄⣞⣼⠏⠉⢻⣷⠀⠀⢀⣾⣾⠙⣿⢨⠀⠀⠀⠀⣰⠏⣢⡿⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠁⢠⣿⡿⠀⠹⢮⣙⡻⠽⢿⣷⣌⠻⢿⣀⣰⠟⣃⣀⢤⣪⣿⠇⠀⠻⣪⣗⡦⠤⢞⣫⣶⡟⠁⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⣶⣫⠟⠁⠀⠀⠀⠙⠛⠛⠛⠛⠻⣿⣾⣼⣭⡭⣿⣷⠻⠟⠁⠀⠀⠀⠈⠛⠻⠿⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		}
		alpha.setup(dashboard.opts)
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("c", "   Nvim Config", "<cmd>:cd ~/.config/nvim | :edit init.lua <CR>"),
			dashboard.button("g", "   Ghostty Config", "<cmd>:cd ~/.config/ghostty | :edit config <CR>"),
			dashboard.button("t", "   Tmux Config", "<cmd>:cd ~/.config/tmux | :edit tmux.conf <CR>"),
			dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
			dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
		}

		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				-- Get the current date and time

				-- Get the current hour
				local current_hour = tonumber(os.date("%H"))

				-- Define the greeting variable
				local greeting

				if current_hour < 5 then
					greeting = "    Good night!"
				elseif current_hour < 12 then
					greeting = "  󰼰 Good morning!"
				elseif current_hour < 17 then
					greeting = "    Good afternoon!"
				elseif current_hour < 20 then
					greeting = "  󰖝  Good evening!"
				else
					greeting = "  󰖔  Good night!"
				end

				dashboard.section.footer.val = greeting

				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
