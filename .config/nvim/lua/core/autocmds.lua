local cmd = require('core/utils').cmd

cmd([[autocmd TermOpen * startinsert]])
cmd([[au BufRead,BufNewFile *.eta set filetype=eta]]) -- eta ident
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])     -- Не автокомментировать новые линии
-- cmd([[autocmd BufEnter * syntax spell toplevel]])

cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({async = false})]])

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("LspDiagnosticsFloat", { clear = true }),
  callback = function(args)
    if #vim.lsp.get_clients({ bufnr = args.buf }) == 0 then
      return
    end
    if vim.fn.mode() == "c" then
      return
    end
    local float_opts = {
      focusable = false,
      border = "rounded",
      source = "if_many",
      scope = "cursor",
    }
    local existing = vim.b[args.buf].diag_float_win
    if existing and vim.api.nvim_win_is_valid(existing) then
      return
    end
    vim.b[args.buf].diag_float_win = vim.diagnostic.open_float(nil, float_opts)
  end,
})
