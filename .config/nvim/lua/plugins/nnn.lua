require("nnn").setup({
	explorer = {
		session = "local",
		tabs = false,
		fullscreen = false,
	},
	-- replace_netrw = "explorer",
	auto_open = {
		-- setup = "explorer",
		-- tabpage = "explorer", -- or "explorer" / "picker", auto open when opening new tabpage
		ft_ignore = { -- dont auto open for these filetypes
			"gitcommit",
		},
	},
	windownav = { -- window movement mappings to navigate out of nnn
		left = "<C-h>",
		right = "<C-l>",
		next = "<C-n>",
		prev = "<C-p>",
	},
})
