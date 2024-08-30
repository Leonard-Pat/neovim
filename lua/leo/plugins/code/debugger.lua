return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"mortepau/codicons.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local utils = require("dap.utils")

		require("codicons").setup()

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			-- NOTE: I think nil here is important so that I don't work with the defaults from mason-nvim-dap, which would make my debugging process harder
			handlers = nil,
			automatic_installation = true,
		})

		if not dap.adapters["pwa-node"] then
			require("dap").adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
						"${port}",
					},
				},
			}
		end
		if not dap.adapters["node"] then
			dap.adapters["node"] = function(cb, config)
				if config.type == "node" then
					config.type = "pwa-node"
				end
				local nativeAdapter = dap.adapters["pwa-node"]
				if type(nativeAdapter) == "function" then
					nativeAdapter(cb, config)
				else
					cb(nativeAdapter)
				end
			end
		end

		local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

		for _, language in ipairs(js_filetypes) do
			if not dap.configurations[language] then
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end
		end

		-- require("dap-vscode-js").setup({
		-- 	debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
		-- 	debugger_cmd = { "js-debug-adapter" },
		-- 	adapters = { "pwa-node", "pwa-chrome" },
		-- })
		--
		-- -- setup debugging for javascript/typescript
		--
		-- dap.adapters = {
		-- 	["pwa-node"] = {
		-- 		type = "server",
		-- 		host = "::1",
		-- 		port = "${port}",
		-- 		executable = {
		-- 			command = "js-debug-adapter",
		-- 			args = {
		-- 				"${port}",
		-- 			},
		-- 		},
		-- 	},
		-- }
		--
		-- for _, language in ipairs({ "typescript", "javascript" }) do
		-- 	dap.configurations[language] = {
		-- 		{
		-- 			type = "pwa-node",
		-- 			request = "launch",
		-- 			name = "Launch file",
		-- 			program = "${file}",
		-- 			cwd = "${workspaceFolder}",
		-- 		},
		-- 		{
		-- 			type = "pwa-node",
		-- 			request = "attach",
		-- 			name = "Attach to process ID",
		-- 			processId = utils.pick_process,
		-- 			cwd = "${workspaceFolder}",
		-- 		},
		-- 	}
		-- end

		-- makes sure dap ui loads when debugging starts
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

		-- keybinds
		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "Continue debugging" })

		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, { desc = "Step over" })

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step into" })

		vim.keymap.set("n", "<leader>dO", function()
			dap.step_out()
		end, { desc = "Step out" })

		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })
	end,
}
