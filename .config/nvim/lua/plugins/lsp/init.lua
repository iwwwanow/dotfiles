local M = {}

local mason_lspconfig = require("plugins.lsp.mason-lspconfig")
local capabilities = require("plugins.lsp.capabilities")
local servers = require("plugins.lsp.servers")
local diagnostic = require("plugins.lsp.diagnostic")
local util = require("plugins.lsp.util")

local lsp_keymaps = require("keymaps.lsp")

function M.setup()
	vim.diagnostic.config(diagnostic)
	capabilities.setup()
	mason_lspconfig.setup(servers, util, capabilities, lsp_keymaps)
end

return M
