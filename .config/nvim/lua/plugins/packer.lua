vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- UI
	use({
		"nvim-lualine/lualine.nvim",
		-- requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})

	-- COLORSCHEME
	use({ "typicode/bg.nvim" })
	use({
		"effektivnayarabota1/nvim__colorscheme",
		config = function()
			-- vim.g.monochrome_style = "coolgray"
			vim.g.monochrome_style = "amplified"
			vim.cmd("colorscheme monochrome")
		end,
	})

	-- EDITOR
	use("tpope/vim-surround")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup()
			vim.g.skip_ts_context_commentstring_module = true
		end,
	})
	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				hook = function()
					if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
						require("ts_context_commentstring.internal").update_commentstring()
					end
				end,
			})
		end,
	})

	-- EXPLORER
	use("mcchrish/nnn.vim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- SYSTEM
	use({
		"neoclide/coc.nvim",
		branch = "release",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "luckasRanarison/tree-sitter-hypr" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
