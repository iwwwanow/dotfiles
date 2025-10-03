local M = {}

-- TODO move outter
local function highlight(group, color)
	if color.link then
		vim.api.nvim_command("highlight! link " .. group .. " " .. color.link)
	else
		local style = color.style and "gui=" .. color.style or color.preserve and "" or " gui=NONE cterm=NONE"
		local fg = color.fg and "guifg=" .. color.fg or color.preserve and "" or "guifg=NONE ctermfg=NONE"
		local bg = color.bg and "guibg=" .. color.bg or color.preserve and "" or "guibg=NONE ctermbg=NONE"
		local sp = color.sp and "guisp=" .. color.sp or color.preserve and "" or "guisp=NONE"
		vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
	end
end

function M.setHighlights(tbl)
	vim.api.nvim_command("hi clear")

	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.o.termguicolors = true
	-- TODO colors name
	vim.g.colors_name = "monochrome"

	for group, tables in pairs(tbl) do
		highlight(group, tables)
	end


	-- TODO split highlight into core and plugin
	-- local plugin_syntax = M.load_plugin_syntax()
	-- for group, tables in pairs(plugin_syntax) do
	-- 	M.highlight(group, tables)
	-- end
end

return M
