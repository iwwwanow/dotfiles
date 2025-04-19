local builtin_telescope = require("telescope.builtin")
vim.keymap.set("n", "<Space>ff", builtin_telescope.find_files, {})
vim.keymap.set(
	"n",
	"<Space>fh",
	"<cmd>:Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>",
	{}
)
vim.keymap.set("n", "<Space>fg", builtin_telescope.live_grep, {})
vim.keymap.set("n", "<Space>fG", function()
	builtin_telescope.live_grep({
		additional_args = { "--hidden" },
		prompt_title = "🔍 Grep in Hidden Files"
	})
end, { desc = "Live grep in hidden files" })
vim.keymap.set("n", "<Space>fb", builtin_telescope.buffers, {})
-- vim.keymap.set("n", "<Space>fh", builtin_telescope.help_tags, {})
