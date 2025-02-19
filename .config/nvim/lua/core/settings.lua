local cmd = vim.cmd -- execute Vim commands
local opt = vim.opt
local g = vim.g

opt.termguicolors = true
g.netrw_banner = 0

opt.colorcolumn = "80" -- Разделитель на 80 символов
opt.cursorline = true -- Подсветка строки с курсором
opt.spelllang = { "en_us", "ru" } -- Словари рус eng
opt.number = true -- Включаем нумерацию строк
opt.relativenumber = true -- Вкл. относительную нумерацию строк
opt.so = 999 -- Курсор всегда в центре экрана
opt.undofile = true -- Возможность отката назад
opt.splitright = true -- Вертикальные сплиты становятся справа
opt.splitbelow = true -- Горизонтальные сплиты становятся снизу

opt.ignorecase = true -- Игнорировать регистр при поиске
opt.smartcase = true -- Не игнорировать регистр, если есть символы в верхнем регистре
opt.showmatch = true -- Подсвечивать найденные текстовые объекты

opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Подстраивать новые строки под предыдущий отступ
--
opt.list = true
opt.listchars = { eol = "󰘌", tab = "--.", trail="T", leadmultispace=". ", extends="#", precedes="#" }

vim.cmd([[au BufRead,BufNewFile *.eta set filetype=eta]]) -- eta ident

opt.clipboard = "unnamedplus" -- Используем системный буфер обмена
opt.completeopt = "menuone,noselect" -- Автодополнение (встроенное в Neovim)
vim.cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]]) -- Не автокомментировать новые линии при переходе на новую строку
vim.cmd([[autocmd TermOpen * startinsert]])
