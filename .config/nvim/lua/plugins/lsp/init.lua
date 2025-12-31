local M = {}

local lsp_keymaps = require("keymaps.lsp")
local diagnostic = require("plugins.lsp.diagnostic")

function M.setup()
	local mason_lspconfig = require("mason-lspconfig")

	vim.diagnostic.config(diagnostic)

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	local servers = {
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

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = true,
	})

	local function setup_server(server_name)
		local server_opts = servers[server_name] or {}
		server_opts.capabilities = capabilities
		server_opts.on_attach = function(_, bufnr)
			lsp_keymaps.setup(bufnr)
		end
		vim.lsp.config(server_name, server_opts)
	end

	if mason_lspconfig.setup_handlers then
		mason_lspconfig.setup_handlers({ setup_server })
	else
		for server_name in pairs(servers) do
			setup_server(server_name)
		end
	end
end

return M
