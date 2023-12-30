require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"typescript",
		"javascript",
		"tsx",
		"html",
		"css",
		"svelte",
		"sql",
		"embedded_template",
		"gitignore",
		"jsdoc",
		"json",
		"markdown",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = false,
		additional_vim_regex_highlighting = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
	install_info = {
		url = "https://github.com/luckasRanarison/tree-sitter-hypr",
		files = { "src/parser.c" },
		branch = "master",
	},
	filetype = "hypr",
}
