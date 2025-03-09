local clear = require("plugins/theme/clear")
local highlights = require("plugins/theme/highlights")

local M = {}

function M.setup()
	clear.clear()
	highlights.setup()
end

-- TODO to functions
vim.api.nvim_create_user_command("ShowHlGroup", function()
	local line = vim.fn.line('.')
	local col = vim.fn.col('.')
	local syn_id = vim.fn.synID(line, col, 1)
	local hl_group = vim.fn.synIDattr(syn_id, 'name')
	print("Highlight группа под курсором: " .. hl_group)
end, {})

return M
