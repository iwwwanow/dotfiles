local M = {}

M = {
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	-- float = true,
	float = {
		focusable = false,
		border = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		-- style = "minimal",
	},
}

return M
