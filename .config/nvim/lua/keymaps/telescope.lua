local builtin_telescope = require("telescope.builtin")

vim.keymap.set("n", "<Space>ff", builtin_telescope.find_files, {})
-- vim.keymap.set(
-- 	"n",
-- 	"<Space>fF",
-- 	"<cmd>:Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=>\\ <CR>",
-- 	{}
-- )

vim.keymap.set("n", "<Space>fF", function()
	builtin_telescope.find_files({
		additional_args = { "--ignore", "--hidden", "--files" },
		prompt_title = "Find hidden files",
	})
end, { desc = "Live grep in hidden files" })

vim.keymap.set("n", "<Space>fj", builtin_telescope.live_grep, {})
vim.keymap.set("n", "<Space>fJ", function()
	builtin_telescope.live_grep({
		additional_args = { "--hidden" },
		prompt_title = "Grep hidden files",
	})
end, { desc = "Live grep in hidden files" })

-- TODO: for what?
-- vim.keymap.set("n", "<Space>fb", builtin_telescope.buffers, {})
-- vim.keymap.set("n", "<Space>fh", builtin_telescope.help_tags, {})
