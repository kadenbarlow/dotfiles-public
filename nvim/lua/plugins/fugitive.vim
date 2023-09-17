autocmd!
autocmd FileType fugitive nmap <buffer> <Tab> =
autocmd FileType fugitive nmap <buffer> gp :Git<SPACE>push<CR>
autocmd FileType fugitive nmap <buffer> pu :Git<SPACE>push<CR>
autocmd FileType fugitive nmap <buffer> gl :Git<SPACE>pull<CR>
autocmd FileType fugitive nmap <buffer> Fu :Git<SPACE>pull<CR>
autocmd FileType fugitive nmap <buffer> gc :Git<SPACE>commit<CR>
autocmd FileType fugitive nmap <buffer> gf :Git<SPACE>fetch<CR>
autocmd FileType fugitive nmap <buffer> fu :Git<SPACE>fetch<CR>
autocmd FileType fugitive nmap <buffer> mm<ENTER> :Git<SPACE>merge<SPACE>-<ENTER>
autocmd FileType fugitive nmap <buffer> mm<SPACE> :Git<SPACE>merge<SPACE>
autocmd FileType fugitive nmap <buffer> bb<SPACE> :Git<SPACE>checkout<SPACE>
autocmd FileType fugitive nmap <buffer> bb<ENTER> :Git<SPACE>checkout<SPACE>-<ENTER>
autocmd FileType fugitive nmap <buffer> bl<SPACE> :Git<SPACE>checkout<SPACE>-b<SPACE>

