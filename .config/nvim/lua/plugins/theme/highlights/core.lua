local colors = require("plugins/theme/colors").getColors()

local M = {
	Normal = { fg = colors.fg, bg = colors.bg },
	Terminal = { fg = colors.fg, bg = colors.bg },
	Visual = { fg = colors.fg, bg = colors.bg3 },
	VisualNOS = { fg = colors.fg, bg = colors.bg3 },

	-- This is a comment
	SpecialComment = { fg = colors.fg3, style = "bold,italic" },
	-- TODO: this is a todo comment
	Todo = { fg = colors.fg2, style = "bold" },
	-- TODO: this is a comment


	Cursor = { fg = colors.bg, bg = colors.fg },
	lCursor = { fg = colors.bg, bg = colors.fg },
	CursorIM = { fg = colors.bg, bg = colors.fg },
	CursorColumn = { bg = colors.bg_alt },

	CursorLine = { bg = colors.bg_alt },
	CursorLineNr = { fg = colors.fg, bg = colors.bg_alt },
	LineNr = { fg = colors.fg6 },

	ColorColumn = { bg = colors.bg_alt },
	Conceal = { fg = colors.fg5 },

	IncSearch = { fg = colors.bg, bg = colors.fg4, style = "bold" },
	Search = { fg = colors.bg, bg = colors.fg5 },

	-- TODO
	Pmenu = { fg = colors.fg, bg = colors.bg_alt },
	PmenuSel = { fg = colors.fg, bg = colors.bg3 },
	PmenuSbar = { bg = colors.bg4 },
	PmenuThumb = { bg = colors.bg5 },

	SpellBad = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellCap = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellLocal = { fg = colors.fg, style = "undercurl", sp = colors.red },
	SpellRare = { fg = colors.fg, style = "undercurl", sp = colors.red },

	ModeMsg = { fg = colors.fg, bg = colors.bg_alt, style = "bold" },
	StatusLine = { fg = colors.fg, bg = colors.bg_alt },
	StatusLineNC = { fg = colors.fg6, bg = colors.bg },

	MatchParen = { fg = colors.fg, bg = colors.bg4, style = "bold" },

	VertSplit = { fg = colors.bg },

	-- TODO: use color from theme
	NonText = { fg = colors.fg5 },
	Special = { fg = colors.fg3 },
	Directory = {},
	Whitespace = { fg = colors.fg5 },
	EndOfBuffer = { fg = colors.fg6 },
	PreProc = {},
	Statement = { link = "Function" },
	SignColumn = {},
	WinBar = { fg = colors.fg3, bg = colors.bg },
	WinBarNC = { fg = colors.fg5, bg = colors.bg },
}

return M
