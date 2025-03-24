require('plugins/bootstrap')
require('plugins/packer')

-- TODO: local, use command `:highlight`
require('plugins/theme').setup()

vim.cmd([[packadd packer.nvim]])
