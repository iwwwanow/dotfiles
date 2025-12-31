local M = {}

local diagnostics_enabled = false

local function toggle_diagnostics_on_hover()
	if diagnostics_enabled then
		diagnostics_enabled = false
		vim.notify("Diagnostics on hover: OFF", vim.log.levels.INFO)
	else
		diagnostics_enabled = true
		vim.notify("Diagnostics on hover: ON", vim.log.levels.INFO)
	end
end

local function lsp_autocmd(bufnr)
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		buffer = bufnr,
		callback = function()
			if diagnostics_enabled then
				vim.diagnostic.open_float()
			end
		end,
	})
end

local function lsp_keymaps(bufnr)
	local set = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, remap = false })
	end

	set("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
	set("n", "<leader>gr", vim.lsp.buf.references, "Go to references")
	set("n", "<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
	set("n", "<leader>gy", vim.lsp.buf.type_definition, "Go to type definition")
	set("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

	set("n", "[g", vim.diagnostic.goto_prev, "Previous diagnostic")
	set("n", "]g", vim.diagnostic.goto_next, "Next diagnostic")

	-- set("n", "<leader>D", vim.diagnostic.open_float, "Hover diagnostic")
	set("n", "<leader>D", toggle_diagnostics_on_hover, "Hover diagnostic")
	set("n", "<leader>K", vim.lsp.buf.hover, "Hover documentation")

	set("n", "<leader>cl", vim.lsp.codelens.run, "Code lens action")
	set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code action")
	set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
end

function M.setup(bufnr)
	lsp_autocmd(bufnr)
	lsp_keymaps(bufnr)
end

return M
