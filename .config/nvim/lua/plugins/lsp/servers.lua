local M = {}

M = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
			},
		},
	},
	ts_ls = {},
	svelte = {},
	html = {},
	cssls = {},
	jsonls = {},
	gopls = {},
	bashls = {},
	clangd = {},
	marksman = {},
}

return M
