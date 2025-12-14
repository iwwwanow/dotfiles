local M = {}

local function lsp_keymaps(bufnr)
	local set = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
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

function M.setup()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	lsp_config.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Разрешить переопределение definition handler
    vim.lsp.handlers["textDocument/definition"] = function(_, result, _, _)
      if not result or vim.tbl_isempty(result) then
        print("No definition found")
        return
      end
      
      if #result > 1 then
        -- Используйте telescope для выбора из нескольких определений
        require('telescope.builtin').lsp_definitions({})
      else
        vim.lsp.util.jump_to_location(result[1], 'utf-8')
      end
    end
  end
})

	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			severity = {
				min = vim.diagnostic.severity.HINT,
			},
		},
		float = { border = "single" },
		severity_sort = true,
		underline = true,
		update_in_insert = false,
	})

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
		lspconfig[server_name].setup(server_opts)
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
