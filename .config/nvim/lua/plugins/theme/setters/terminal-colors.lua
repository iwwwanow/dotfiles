local colors = require("plugins/theme/colors").getColors()

local M = {}

function M.setTerminalColors()
	vim.g.terminal_color_0  = colors.base0
	vim.g.terminal_color_1  = colors.base1
	vim.g.terminal_color_2  = colors.base2
	vim.g.terminal_color_3  = colors.base3
	vim.g.terminal_color_4  = colors.base4
	vim.g.terminal_color_5  = colors.base5
	vim.g.terminal_color_6  = colors.base6
	vim.g.terminal_color_7  = colors.base7
	vim.g.terminal_color_8  = colors.base8
	vim.g.terminal_color_9  = colors.base9
	vim.g.terminal_color_10 = colors.base10
	vim.g.terminal_color_11 = colors.base11
	vim.g.terminal_color_12 = colors.base12
	vim.g.terminal_color_13 = colors.base13
	vim.g.terminal_color_14 = colors.base14
	vim.g.terminal_color_15 = colors.base15
end

return M
