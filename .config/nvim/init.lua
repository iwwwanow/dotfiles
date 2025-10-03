local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("core.options")
-- require("core.autocmds")
-- require("keymaps")

local plugins = require("plugins")

-- require("lazy").setup(plugins,   
-- { rocks = {
--     		enabled = false
--   }
--   })

-- require("lazy").setup(plugins, {})
require("lazy").setup(plugins)
