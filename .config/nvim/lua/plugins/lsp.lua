local M = {}

local function lsp_keymaps(bufnr)
	local set = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, remap = false })
	end

	-- set("n", "D", vim.lsp.buf.hover, "Hover documentation")
	set("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
	set("n", "<leader>gr", vim.lsp.buf.references, "Go to references")
	set("n", "<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
	set("n", "<leader>gy", vim.lsp.buf.type_definition, "Go to type definition")
	set("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code action")
	set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
	set("n", "[g", vim.diagnostic.goto_prev, "Previous diagnostic")
	set("n", "]g", vim.diagnostic.goto_next, "Next diagnostic")
	set("n", "<leader>D", vim.lsp.buf.hover, "Hover documentation")
	set("n", "<leader>cl", vim.lsp.codelens.run, "Code lens action")
end

local function setup_lsp_highlights()
	-- Подсветка текста при ссылках LSP
	vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#3a3a3a", underline = true })
	vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#2d2d4a" })
	vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#4a2d2d" })
	vim.api.nvim_set_hl(0, "LspReferenceTarget", { bg = "#2d4a2d" })

	-- Другие LSP подсветки
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f38ba8" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fab387" })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#89b4fa" })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#a6e3a1" })

	-- Подсветка текущего символа при hover
	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#45475a", bold = true })
end

function M.setup()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	-- vim.diagnostic.config({
	-- float = false,
	-- virtual_text = {
	-- 	prefix = "●",
	-- 	severity = {
	-- 		min = vim.diagnostic.severity.HINT,
	-- 	},
	-- },
	-- float = { border = "single" },
	-- severity_sort = true,
	-- underline = true,
	-- update_in_insert = false,
	-- })

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "single"
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
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
		end
		-- lspconfig[server_name].setup(server_opts)
		vim.lsp.config(server_name, server_opts)
	end

	if mason_lspconfig.setup_handlers then
		mason_lspconfig.setup_handlers({ setup_server })
	else
		for server_name in pairs(servers) do
			setup_server(server_name)
		end
	end

	-- Настройка вида hover-окна
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "shadow", -- или "single", "double", "shadow", "none"
	-- 	max_width = 40, -- максимальная ширина
	-- 	max_height = 30, -- максимальная высота
	-- 	focusable = false, -- окно не получает фокус
	-- 	silent = true, -- не создает шума
	-- })

	-- Настройка окна подписи (signature help)
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- 	max_width = 40,
	-- 	focusable = false,
	-- })
	setup_lsp_highlights()
end

return M
