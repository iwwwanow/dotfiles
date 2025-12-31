local M = {}

local mason_lspconfig = require("plugins.lsp.mason-lspconfig")
local lsp_keymaps = require("keymaps.lsp")
local servers = require("plugins.lsp.servers")
local diagnostic = require("plugins.lsp.diagnostic")
local util = require("plugins.lsp.util")

function M.setup()
	vim.diagnostic.config(diagnostic)

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	mason_lspconfig.setup(servers, util, capabilities, lsp_keymaps)
end

return M
