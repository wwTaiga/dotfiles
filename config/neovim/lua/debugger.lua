require("dapui").setup({
	mappings = {
		expand = { "<tab>" },
	},
	sidebar = {
		position = "right",
	},
})

-- Dap config
local dap = require("dap")

-- Lua dap
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: "))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}
dap.adapters.nlua = function(callback, config)
	callback({
		type = "server",
		host = config.host,
		port = config.port,
	})
end

-- Csharp dap
dap.configurations.cs = {
	{
		type = "netcoredbg",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}
dap.adapters.netcoredbg = {
	type = "executable",
	command = "netcoredbg",
	args = { "--interpreter=vscode" },
}
