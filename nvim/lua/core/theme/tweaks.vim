" Vim color file
" github

" Define reusable colorvariables.
let s:bg="#1b1c1d"
let s:fg="#b1b1b1"
let s:fg2="#a3a3a3"
let s:fg3="#959595"
let s:fg4="#878787"
let s:bg2="#2d2e2f"
let s:bg3="#3f4041"
let s:bg4="#525253"
let s:keyword="#f47067"
let s:builtin="#b083f0"
let s:const= "#f69d50"
let s:comment="#768390"
let s:func="#dcbdfb"
let s:str="#adbac7"
let s:type="#6cb6ff"
let s:var="#8ddb8c"
let s:warning="#ff938a"
let s:warning2="#f69d50"

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi NormalNC guifg='s:fg' guibg='s:bg
exe 'hi NormalSB guifg='s:fg' guibg='s:bg
exe 'hi NormalFloat guifg='s:fg' guibg='s:bg
exe 'hi Pmenu guifg='s:fg' guibg='s:bg
exe 'hi PmenuSbar guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:str' guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg2
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi LineNr guifg='s:fg2' guibg='s:bg2
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg3
exe 'hi MatchParen guifg='s:warning2'  gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg3' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi IncSearch guifg='s:bg' guibg='s:keyword
exe 'hi Search   gui=underline'
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi WildMenu guifg='s:str' guibg='s:bg
exe 'hi TelescopeNormal guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeNormal guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeNormalNC guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeWinSeparator guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeFolderName guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeOpenedFolderName guifg='s:fg' guibg='s:bg
exe 'hi NvimTreeOpenedFile guifg='s:fg' guibg='s:bg

" " Markdown Highlighting
" exe 'hi mkdCode guifg='s:builtin
exe 'hi MatchParen guifg='s:fg' guibg=#6F464E'
" exe 'hi Search guifg='s:fg' guibg=#455362'
" exe 'hi IndentBlanklineContextChar guifg='s:builtin' gui=nocombine'

