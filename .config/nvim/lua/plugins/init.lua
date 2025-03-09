require('plugins/bootstrap')
require('plugins/packer')

-- local
require('plugins/theme').setup()

vim.cmd([[packadd packer.nvim]])
