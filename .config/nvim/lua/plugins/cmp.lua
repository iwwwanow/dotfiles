local M = {}

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	luasnip.config.setup({})

	local ok_loader, vscode_loader = pcall(require, "luasnip.loaders.from_vscode")
	if ok_loader then
		vscode_loader.lazy_load()
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		if col == 0 then
			return false
		end
		local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
		return current_line:sub(col, col):match("%s") == nil
	end

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
		formatting = {
			format = function(entry, vim_item)
				local menu_icon = {
					nvim_lsp = "[LSP]",
					buffer = "[BUF]",
					path = "[PATH]",
					luasnip = "[SNIP]",
				}
				vim_item.menu = menu_icon[entry.source.name]
				return vim_item
			end,
		},
		experimental = {
			ghost_text = false,
		},
	})

	local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	if ok then
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
end

return M
