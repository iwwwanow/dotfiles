local colors = require("plugins/theme/colors").getColors()

local M = {
	-- TODO вынести цвета ближе к настройкам плагинов
	-- TODO обозначить стандартные стили и к ним перелинковывать
		CocHighlightRead = { fg = colors.fg, bg = colors.neutral_skyblue },
		CocHighlightWrite = { fg = colors.fg, bg = colors.skyblue },
		CocMenu = { link = "Pmenu" },
		CocMenuSel = { link = "PmenuSel" },
		CocSearch = { fg = colors.blue },
		CocPumSearch = { link = "CocSearch" },
		CocSymbolDefault = { link = "CocSearch" },
		CocInfoFloat = { link = "CocSearch" },
		CocNotificationInfo = { link = "CocSearch" },
		CocNotificationProgress = { link = "CocSearch" },
		CocListSearch = { link = "CocSearch" },
		CocFloatActive = { link = "CocSearch" },
		CocMarkdownLink = { link = "CocSearch" },

		DashboardShortCut = { fg = colors.fg, bg = colors.bg },
		DashboardHeader = { fg = colors.fg, bg = colors.bg },
		DashboardCenter = { fg = colors.fg, bg = colors.bg },
		DashboardFooter = { fg = colors.fg, bg = colors.bg },

		ALEError = { fg = colors.orange },
		ALEWarning = { fg = colors.orange },
		ALEInfo = { fg = colors.orange },
		ALEErrorSign = { fg = colors.orange },
		ALEWarningSign = { fg = colors.orange },
		ALEInfoSign = { fg = colors.orange },

		DiffAdd = { fg = colors.neutral_green },
		DiffChange = { fg = colors.neutral_blue },
		DiffDelete = { fg = colors.neutral_red },
		DiffText = { fg = colors.neutral_blue },

		GitSignsAdd = { fg = colors.faded_green },
		GitSignsDelete = { fg = colors.faded_red },
		GitSignsChange = { fg = colors.faded_blue },
		GitSignsChangeNr = { fg = colors.faded_yellow },
		GitSignsChangeLn = { fg = colors.faded_yellow },
		GitSignsChangeDelete = { fg = colors.faded_orange },

		SignifySignAdd = { fg = colors.neutral_green },
		SignifySignChange = { fg = colors.neutral_yellow },
		SignifySignDelete = { fg = colors.neutral_red },

		GitGutterAdd = { fg = colors.neutral_green },
		GitGutterChange = { fg = colors.neutral_yellow },
		GitGutterChangeDelete = { fg = colors.neutral_orange },
		GitGutterDelete = { fg = colors.neutral_red },

		LspDiagnosticsVirtualTextError = { fg = colors.faded_red },
		LspDiagnosticsSignError = { fg = colors.faded_red },
		LspDiagnosticsFloatingError = { fg = colors.faded_red },
		LspDiagnosticsVirtualTextWarning = { fg = colors.faded_yellow },
		LspDiagnosticsSignWarning = { fg = colors.faded_yellow },
		LspDiagnosticsFloatingWarning = { fg = colors.faded_yellow },
		LspDiagnosticsVirtualTextInformation = { fg = colors.faded_blue },
		LspDiagnosticsSignInformation = { fg = colors.faded_blue },
		LspDiagnosticsFloatingInformation = { fg = colors.faded_blue },
		LspDiagnosticsVirtualTextHint = { fg = colors.fg },
		LspDiagnosticsSignHint = { fg = colors.fg },
		LspDiagnosticsFloatingHint = { fg = colors.fg },
		LspDiagnosticsUnderlineError = { bg = colors.bg, style = "undercurl", sp = colors.faded_red },
		LspDiagnosticsUnderlineWarning = { bg = colors.bg, style = "undercurl", sp = colors.faded_yellow },
		LspDiagnosticsUnderlineInformation = { bg = colors.bg, style = "undercurl", sp = colors.faded_blue },
		LspDiagnosticsUnderlineHint = { bg = colors.bg, style = "undercurl", sp = colors.fg },

		gitCommitBranch = {},
		gitCommitDiscardedFile = {},
		gitCommitDiscardedType = {},
		gitCommitHeader = {},
		gitCommitSelectedFile = {},
		gitCommitSelectedType = {},
		gitCommitUntrackedFile = {},
		gitEmail = {},

		NERDTreeGitStatusDirDirty = {},
		NERDTreeGitStatusModified = {},
		NERDTreeGitStatusRenamed = {},
		NERDTreeGitStatusStaged = {},
		NERDTreeGitStatusUntracked = {},
		NERDTreeClosable = {},
		NERDTreeCWD = {},
		NERDTreeDir = {},
		NERDTreeDirSlash = {},
		NERDTreeExecFile = {},
		NERDTreeFile = {},
		NERDTreeFlags = {},
		NERDTreeHelp = {},
		NERDTreeLinkDir = {},
		NERDTreeLinkFile = {},
		NERDTreeLinkTarget = {},
		NERDTreeOpenable = {},
		NERDTreePart = {},
		NERDTreePartFile = {},
		NERDTreeUp = {},

		markdownBold = { style = "bold" },
		markdownCode = {},
		markdownCodeDelimiter = {},
		markdownError = {},
		markdownH1 = { style = "bold" },
		markdownUrl = { fg = colors.bright_blue },
		markdownFootnote = { link = "TSNote" },
		markdownLinkText = { link = "TSURI" },
		markdownLinkTextDelimiter = { fg = colors.gray4 },
		markdownLinkDelimiter = { fg = colors.gray4 },

		mkdDelimiter = {},
		mkdLineBreak = {},
		mkdListItem = {},
		mkdCodeStart = { fg = colors.fg2 },
		mkdCodeEnd = { fg = colors.fg2 },
		mkdURL = { fg = colors.blue },

		NvimTreeFolderName = { fg = colors.fg2 },
		NvimTreeRootFolder = { fg = colors.fg },
		NvimTreeSpecialFile = {},

		TelescopeBorder = { fg = colors.fg2 },
		TelescopePromptBorder = { fg = colors.fg },
		TelescopeMatching = {},
		TelescopeSelection = { style = "bold" },
		TelescopeSelectionCaret = { fg = colors.fg },
		TelescopeMultiSelection = { style = "italic" },

		BufferCurrent = { fg = colors.fg, bg = colors.bg },
		BufferCurrentMod = { fg = colors.fg, bg = colors.bg, style = "italic" },
		BufferCurrentSign = { fg = colors.fg, bg = colors.bg },
		BufferVisible = { fg = colors.fg2, bg = colors.bg },
		BufferVisibleMod = { fg = colors.fg2, bg = colors.bg, style = "italic" },
		BufferVisibleSign = { fg = colors.fg2, bg = colors.bg },
		BufferInactive = { fg = colors.fg2, bg = colors.bg_alt },
		BufferInactiveMod = { fg = colors.fg2, bg = colors.bg_alt, style = "italic" },
		BufferInactiveSign = { fg = colors.fg2, bg = colors.bg2 },
}

return M
