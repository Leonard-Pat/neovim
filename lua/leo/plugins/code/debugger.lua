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

		require("codicons").setup()
		require("mason-nvim-dap").setup()

		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			debugger_cmd = { "js-debug-adapter" },
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		-- setup debugging for javascript/typescript

		-- Configurations
		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch server",
					runtimeExecutable = "bun",
					runtimeArgs = { "run" },
					skipFiles = { "node_modules/**" },
					console = "integratedTerminal",
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
