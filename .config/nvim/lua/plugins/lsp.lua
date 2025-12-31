local M = {}

-- TODO: refactor
local function lsp_keymaps(bufnr)
	local set = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, remap = false })
	end

	set("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
	set("n", "<leader>gr", vim.lsp.buf.references, "Go to references")
	set("n", "<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
	set("n", "<leader>gy", vim.lsp.buf.type_definition, "Go to type definition")
	set("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code action")
	set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
	set("n", "[g", vim.diagnostic.goto_prev, "Previous diagnostic")
	set("n", "]g", vim.diagnostic.goto_next, "Next diagnostic")
	set("n", "<leader>D", vim.diagnostic.open_float, "Hover diagnostic")
	set("n", "<leader>K", vim.lsp.buf.hover, "Hover documentation")
	set("n", "<leader>cl", vim.lsp.codelens.run, "Code lens action")
end

function M.toggle_diagnostics_on_hover(bufnr)
	if diagnostics_enabled then
		-- Выключаем
		diagnostics_enabled = false
		vim.notify("Diagnostics on hover: OFF", vim.log.levels.INFO)
	else
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			callback = function()
				vim.diagnostic.open_float()
			end,
		})

		diagnostics_enabled = true
		vim.notify("Diagnostics on hover: ON", vim.log.levels.INFO)
	end
end

function M.setup()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	vim.diagnostic.config({
		virtual_text = false,
		virtual_lines = false,
		signs = true,
		float = true,
	})

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
			lsp_keymaps(bufnr)

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				callback = function()
					vim.diagnostic.open_float()
				end,
			})

			-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			-- 	buffer = bufnr,
			-- 	callback = function()
			-- 		vim.diagnostic.hide()
			-- 	end,
			-- })
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
