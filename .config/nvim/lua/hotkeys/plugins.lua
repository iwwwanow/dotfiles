local builtin_telescope = require("telescope.builtin")
vim.keymap.set("n", "<Space>ff", builtin_telescope.find_files, {})
vim.keymap.set("n", "<Space>fg", builtin_telescope.live_grep, {})
vim.keymap.set("n", "<Space>fb", builtin_telescope.buffers, {})
vim.keymap.set("n", "<Space>fh", builtin_telescope.help_tags, {})

local builtin = require("nnn").builtin
mappings = {
	{ "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
	{ "<C-s>", builtin.open_in_split }, -- open file(s) in split
	{ "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
	{ "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
	{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
	{ "<C-w>", builtin.cd_to_path }, -- cd to file directory
	{ "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
}

vim.keymap.set("n", "<Space>ee", "<cmd>:NnnExplorer<cr>", {})
vim.keymap.set("n", "<Space>ep", "<cmd>:NnnPicker %:p:h<cr>", {})
