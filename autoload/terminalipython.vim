scriptencoding utf-8

if !exists('g:loaded_terminalipython')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! terminalipython#start_ipython()
    vert term ipython
    wincmd l
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

