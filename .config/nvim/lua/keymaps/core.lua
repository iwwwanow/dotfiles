local im = require('keymaps.utils').im
local m = require('keymaps.utils').m

vim.keymap.set("n", "<CR>", "<Nop>", { desc = "Disable Enter in normal mode" })

im("jj", "<Esc>")
im("jj", "<Esc>")

m("<leader>td", "iTODO ")
im("<leader>td", "TODO ")

m("<leader>fx", "iFIX ")
im("<leader>fx", "FIX ")

m("<leader>in", "iINFO ")
im("<leader>in", "INFO ")

-- vim.api.nvim_set_keymap('n', '<leader>td', 'iTODO <Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fx', 'iFIX <Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>in', 'iINFO <Esc>', { noremap = true, silent = true })

m("<C-y>", "\"ay")
m("<C-p>", "\"ap")

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
