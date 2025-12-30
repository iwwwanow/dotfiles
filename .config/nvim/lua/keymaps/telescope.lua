local builtin_telescope = require("telescope.builtin")

vim.keymap.set("n", "<Space>ff", builtin_telescope.find_files, {})
vim.keymap.set("n", "<Space>fF", function()
	builtin_telescope.find_files({
		find_command = { "rg", "--ignore", "--files", "--hidden" },
		prompt_title = "Find hidden files",
	})
end, { desc = "Live grep in hidden files" })

vim.keymap.set("n", "<Space>fg", builtin_telescope.live_grep, {})
vim.keymap.set("n", "<Space>fG", function()
	builtin_telescope.live_grep({
		additional_args = { "--hidden" },
		prompt_title = "Grep hidden files",
	})
end, { desc = "Live grep in hidden files" })
