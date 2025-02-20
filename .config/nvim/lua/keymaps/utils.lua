local M={}

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = false }
local keyset = vim.keymap.set

M.m = function (key, command)
	map("", key, command, default_opts)
end

M.nm = function (key, command)
	map("n", key, command, default_opts)
end

M.im = function (key, command)
	map("i", key, command, default_opts)
end

M.vm = function (key, command)
	map("v", key, command, { noremap = true })
end

M.tm = function (key, command)
	map("t", key, command, { noremap = true })
end

return M
