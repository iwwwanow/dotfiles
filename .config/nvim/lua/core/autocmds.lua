local cmd = require("core/utils").cmd

cmd([[autocmd TermOpen * startinsert]])
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])
