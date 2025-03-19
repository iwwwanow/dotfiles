local cmd = require('core/utils').cmd

cmd([[autocmd TermOpen * startinsert]])
cmd([[au BufRead,BufNewFile *.eta set filetype=eta]]) -- eta ident
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])     -- Не автокомментировать новые линии
-- cmd([[autocmd BufEnter * syntax spell toplevel]])
