local M = {}

function M.setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end
	return capabilities
end

return M
