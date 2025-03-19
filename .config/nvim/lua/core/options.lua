local opt = require('core/utils').opt
local g = require('core/utils').g

g.netrw_banner = 0

opt.termguicolors = true

opt.colorcolumn = "80"    -- Разделитель на 80 символов
opt.cursorline = true     -- Подсветка строки с курсором
opt.number = true         -- Включаем нумерацию строк
opt.relativenumber = true -- Вкл. относительную нумерацию строк
opt.so = 999              -- Курсор всегда в центре экрана
opt.undofile = true       -- Возможность отката назад
opt.splitright = true     -- Вертикальные сплиты становятся справа
opt.splitbelow = true     -- Горизонтальные сплиты становятся снизу

opt.ignorecase = true     -- Игнорировать регистр при поиске
opt.smartcase = true      -- Не игнорировать регистр, если есть символы в верхнем регистре
opt.showmatch = true      -- Подсвечивать найденные текстовые объекты

opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- Подстраивать новые строки под предыдущий отступ

opt.list = true
opt.listchars = { eol = "󰘌", tab = "--.", trail = "⊥", leadmultispace = ". ", extends = "#", precedes = "#" } -- отображение конца строки и тд

opt.clipboard = "unnamedplus" -- Используем системный буфер обмена
opt.completeopt = "menuone,noselect" -- Автодополнение (встроенное в Neovim)

-- spellcheck
-- opt.spell = true
opt.spelllang = "en_us,ru"
