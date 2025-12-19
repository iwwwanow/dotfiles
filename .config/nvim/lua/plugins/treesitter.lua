local managed_languages = {
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
	"markdown_inline",
	"bash",
}

vim.g.treesitter_managed_languages = managed_languages

require("nvim-treesitter.configs").setup({
	ensure_installed = managed_languages,
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
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
