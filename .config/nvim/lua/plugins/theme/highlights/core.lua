local colors = require("plugins/theme/colors").getColors()

local M = {
	Normal = { fg = colors.fg, bg = colors.bg },
	Terminal = { fg = colors.fg, bg = colors.bg },
	Visual = { fg = colors.bg, bg = colors.fg },
	VisualNOS = { fg = colors.bg, bg = colors.fg },

	-- This is a comment
	SpecialComment = { fg = colors.fg4, style = "bold,italic" },
	-- TODO: this is a todo comment
	Todo = { fg = colors.fg4, style = "bold" },
	-- TODO: this is a comment

	LineNr = { fg = colors.fg6 },
	CursorLineNr = { fg = colors.fg, bg = colors.bg2 },

	Cursor = { fg = colors.bg, bg = colors.fg },
	lCursor = { fg = colors.bg, bg = colors.fg },
	CursorIM = { fg = colors.bg, bg = colors.fg },
	CursorColumn = { fg = colors.fg, bg = colors.fg },

	CursorLine = { bg = colors.bg2, },

	ColorColumn = { bg = colors.bg2 },
	Conceal = { fg = colors.fg5 },

	IncSearch = { fg = colors.bg, bg = colors.bright_blue, style = "bold" },
	Search = { fg = colors.fg8, bg = colors.bg4 },

	-- TODO
	PmenuSel = { fg = colors.fg, bg = colors.bg2 },
	PmenuSbar = { fg = colors.fg, bg = colors.bg4 },
	PmenuThumb = { fg = colors.bg, bg = colors.bg6 },

	-- TODO можно ли сделать волнистую линию?
	SpellBad = { fg = colors.base9, style = "underline" },
	SpellCap = { fg = colors.base9, style = "underline" },
	SpellLocal = { fg = colors.base9, style = "underline" },
	SpellRare = { fg = colors.base9, style = "underline" },

	ModeMsg = { fg = colors.bg, bg = colors.fg },
	StatusLine = { fg = colors.fg2, bg = colors.bg2 },
	StatusLineNC = { bg = colors.bg2 },

	MatchParen = { fg = colors.fg, bg = colors.bg4, style = "bold" },

	VertSplit = {},

	Special = { fg = colors.fg2 },
	Directory = {},
	NonText = { fg = colors.base9, },
	Whitespace = { fg = colors.fg6 },
	EndOfBuffer = { fg = colors.fg6 },
	PreProc = {},
	Statement = {},
	SignColumn = {},
}

return M
