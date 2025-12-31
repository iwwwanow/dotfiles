local M = {}

function M.setup()
	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = true,
	})

	if mason_lspconfig.setup_handlers then
		mason_lspconfig.setup_handlers({ util.setup_server })
	else
		for server_name in pairs(servers) do
			util.setup_server(servers, capabilities, lsp_keymaps, server_name)
		end
	end
end

return M
