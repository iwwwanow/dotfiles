local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		file_ignore_patterns = { "node_modules" },
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				-- ["<C-h>"] = "which_key",

				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└", "_" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│", "_" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└", "_" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└", "_" },
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			borderchars = {
				{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
		},
	},
	extensions = {},
})
