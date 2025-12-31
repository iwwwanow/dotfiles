local M = {}

function M.setup_server(servers, capabilities, lsp_keymaps, server_name)
	local server_opts = servers[server_name] or {}
	server_opts.capabilities = capabilities
	server_opts.on_attach = function(_, bufnr)
		lsp_keymaps.setup(bufnr)
	end
	vim.lsp.config(server_name, server_opts)
end

return M
