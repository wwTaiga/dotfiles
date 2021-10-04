require("toggleterm").setup({})

local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit
local lazygit = Terminal:new({
	cmd = "lazygit",
	hide_number = true,
	direction = "float",
	hidden = true,
})
function _Lazygit_toggle()
	lazygit:toggle()
end
