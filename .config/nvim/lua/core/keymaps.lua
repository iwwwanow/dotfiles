local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = false }

function m(key, command)
	map("", key, command, default_opts)
end

function nm(key, command)
	map("n", key, command, default_opts)
end

function im(key, command)
	map("i", key, command, default_opts)
end

function vm(key, command)
	map("v", key, command, { noremap = true })
end

function tm(key, command)
	map("t", key, command, { noremap = true })
end

im("jj", "<Esc>")
im("оо", "<Esc>")

-- COLORSCHEME
-- m("<S-B>l", "<cmd>:set background=light<cr>")
-- m("<S-B>d", "<cmd>:set background=dark<cr>")

-- TABS
m("<S-j>", "gT")
m("<S-k>", "gt")
m("<S-t>", "<cmd>:tabnew | :Oil<cr>")

-- BUFFERS
m("<S-h>", "<C-O>")
m("<S-l>", "<C-I>")

-- TABS MOVE
m("<", "<cmd>:tabm -1<cr>")
m(">", "<cmd>:tabm +1<cr>")

-- TAB SPLIT
m("<C-s>", "<C-W>s")
m("<C-v>", "<C-W>v")

-- TAB CLOSE
m("<C-q>", "<cmd>:q<cr>")

-- WINDOW MOVE
m("<C-S-h>", "<C-W>H")
m("<C-S-j>", "<C-W>J")
m("<C-S-k>", "<C-W>K")
m("<C-S-l>", "<C-W>L")

-- WINDOW FOCUS
m("<C-h>", "<C-W>h")
m("<C-j>", "<C-W>j")
m("<C-k>", "<C-W>k")
m("<C-l>", "<C-W>l")

-- WINDOW RESIZE
m("<A-h>", "<C-W><")
m("<A-j>", "<C-W>-")
m("<A-k>", "<C-W>+")
m("<A-l>", "<C-W>>")
m("<A-Space>", "<C-W>=")
