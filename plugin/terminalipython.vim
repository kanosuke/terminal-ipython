scriptencoding utf-8

if exists('g:loaded_terminalipython')
    finish
endif
let g:loaded_terminalipython = 1
let s:save_cpo = &cpo
set cpo&vim

command! StartIpython call terminalipython#start_ipython()
nnoremap <Space>p :StartIpython

"command! SendLine call SendLines(line("."), line("."))

let &cpo = s:save_cpo
unlet s:save_cpo

