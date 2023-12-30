" EFFECTIVNAYARABOTA1 MOSCOW 2024 DARK COLORSCHEME

hi clear
if exists('syntax_on')
   syntax reset
endif

set background=dark
let g:colors_name = 'rabota1_dark'

let white = '#FFFFFF'
let black = '#000000'
let gray_l = '#E0E0E0'
let gray_m = '#A4A4A4'
let gray_d = '#535353'
let gray_d1 = '#292929'
let blue = '#009BFF'
let yellow = '#FF9B00'
let red = '#FF0000'
let rose = '#FF00FF'
let green = '#00FF9B'

let italic = 'italic'
let bold = 'bold'
let underline = 'underline'
let none = 'NONE'

function! GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

call GuiFor("Normal", black, gray_m)
call GuiFor("ColorColumn", gray_d1)
call GuiFor("Search", gray_l, black)
call GuiFor("Visual", gray_l, black)
call GuiFor('ErrorMsg', white, red)

call GuiFor('NonText', '', green)
call GuiFor('Whitespace', '', gray_d)

" call GuiFor('FoldColumn', white, red)
" call GuiFor('Folded', white, red)

call GuiFor("Cursor", red, white)
" call GuiFor("CursorLine", gray_d1, gray_l)
call GuiFor("CursorLine", gray_d, '')
call GuiFor("CursorLineNr", gray_d, white, italic)
call GuiFor('LineNr', black, gray_m)

call GuiFor('SpecialKey', blue, black, bold)

call GuiFor('Directory', '', gray_l)

call GuiFor('Pmenu', gray_d, gray_m)
call GuiFor('PmenuSel', gray_d, gray_l)

call GuiFor('Todo', '', yellow, italic)
call GuiFor('SignColumn', black, white)
" TODO

call GuiFor('Statement', '', gray_l, italic)
call GuiFor('PreProc', '', gray_l, bold)
call GuiFor('Conceal', white, black, bold)

call GuiFor('String', '', gray_l)
call GuiFor('Comment', '', gray_m, italic)
call GuiFor('Constant', '', white)
call GuiFor('Type', '', gray_m, italic)
call GuiFor('Function', '', gray_m)
call GuiFor('Identifier', '', gray_m)
call GuiFor('Special', '', white)
call GuiFor('MatchParen', '', red)

call GuiFor('javaScriptFunction', '', gray_l)

" MARKDOWN
call GuiFor('Title', '', white, bold)
call GuiFor('markdownHeadingDelimiter', '', white, bold)
call GuiFor('markdownHeadingRule', '', white, bold)
call GuiFor('markdownLinkText', '', blue, underline)

" DIFFS
call GuiFor('diffFile', gray_m)
call GuiFor('diffNewFile', gray_m)
call GuiFor('diffIndexLine', gray_m)
call GuiFor('diffLine', gray_m)
call GuiFor('diffSubname', gray_m)
call GuiFor('diffAdded', gray_m)
call GuiFor('diffRemoved', gray_m)
