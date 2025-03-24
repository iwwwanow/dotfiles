local colors = require("plugins/theme/colors").getColors()

local M = {
	Normal = { fg = colors.fg, bg = colors.bg },
	Terminal = { fg = colors.fg, bg = colors.bg },
	Visual = { fg = colors.bg, bg = colors.fg },
	VisualNOS = { fg = colors.bg, bg = colors.fg },

	-- This is a comment
	SpecialComment = { fg = colors.fg3, style = "bold,italic" },
	-- TODO: this is a todo comment
	Todo = { fg = colors.fg2, style = "bold" },
	-- TODO: this is a comment


	Cursor = { fg = colors.bg, bg = colors.fg },
	lCursor = { fg = colors.bg, bg = colors.fg },
	CursorIM = { fg = colors.bg, bg = colors.fg },
	CursorColumn = { fg = colors.fg, bg = colors.fg },

	CursorLine = { bg = colors.bg_alt },
	CursorLineNr = { fg = colors.fg, bg = colors.bg_alt },
	LineNr = { fg = colors.fg6 },

	ColorColumn = { bg = colors.bg2 },
	Conceal = { fg = colors.fg5 },

	IncSearch = { fg = colors.bg, bg = colors.blue, style = "bold" },
	Search = { fg = colors.fg8, bg = colors.neutral_blue },

	-- TODO
	Pmenu = { fg = colors.fg, bg = colors.white },
	PmenuSel = { fg = colors.fg, bg = colors.bg2 },
	PmenuSbar = { fg = colors.fg, bg = colors.bg4 },
	PmenuThumb = { fg = colors.fg, bg = colors.bg6 },

	SpellBad = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellCap = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellLocal = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellRare = { fg = colors.fg, style = "undercurl", sp = colors.red },

	ModeMsg = { fg = colors.bg, bg = colors.fg },
	StatusLine = { fg = colors.fg2, bg = colors.bg2 },
	StatusLineNC = { bg = colors.bg },

	MatchParen = { fg = colors.fg, bg = colors.bg4, style = "bold" },

	VertSplit = { fg = colors.fg8 },

	-- TODO: use color from theme
	NonText = { fg = colors.purple },
	Special = { fg = colors.fg2 },
	Directory = {},
	Whitespace = { fg = colors.fg6 },
	EndOfBuffer = { fg = colors.fg6 },
	PreProc = {},
	Statement = { link = "Function" },
	SignColumn = {},
}

return M
