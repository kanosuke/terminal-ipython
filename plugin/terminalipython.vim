scriptencoding utf-8

if exists('g:loaded_terminalipython')
    finish
endif
let g:loaded_terminalipython = 1
let s:save_cpo = &cpo
set cpo&vim

command! StartIpython call terminalipython#start_ipython()
nnoremap <Space>p :StartIpython<CR>

command! SendLine call terminalipython#send_lines(line("."), line("."))
command! SendBlock call terminalipython#send_lines(terminalipython#get_block_first_line(), terminalipython#get_block_last_line())

nnoremap <F2> :SendLine<CR>j
nnoremap <F5> :SendBlock<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

