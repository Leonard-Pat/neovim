return {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"mortepau/codicons.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mxsdev/nvim-dap-vscode-js",
		"mfussenegger/nvim-dap",
	},
	lazy = "VeryLazy",
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
		require("dap-vscode-js").setup({
			debugger_path = vim.fn.exepath("js-debug-adapter"),
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
		})

		for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Jest Tests",
					-- trace = true, -- include debugger info
					runtimeExecutable = "node",
					runtimeArgs = {
						"./node_modules/jest/bin/jest.js",
						"--runInBand",
					},
					rootPath = "${workspaceFolder}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
				},
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
