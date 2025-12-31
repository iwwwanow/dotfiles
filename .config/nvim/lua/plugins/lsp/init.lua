local M = {}

local mason_lspconfig = require("plugins.lsp.mason-lspconfig")
local capabilities = require("plugins.lsp.capabilities")
local lsp_keymaps = require("keymaps.lsp")
local servers = require("plugins.lsp.servers")
local diagnostic = require("plugins.lsp.diagnostic")
local util = require("plugins.lsp.util")

function M.setup()
	vim.diagnostic.config(diagnostic)

	mason_lspconfig.setup(servers, util, capabilities, lsp_keymaps)
end

return M
