scriptencoding utf-8

if exists('g:loaded_terminalipython')
    finish
endif
let g:loaded_terminalipython = 1
let s:save_cpo = &cpo
set cpo&vim

command! Sendline call terminalipython#ipython_sendline()
command! SendBlock call terminalipython#ipython_sendblock()
command! -range SendSelection <line1>,<line2>call terminalipython#ipython_sendselection()
let mapleader = " "
nnoremap <leader>l :Sendline<CR>j
nnoremap <leader>b :SendBlock<CR>
nnoremap <leader>s :SendSelection<CR>
vnoremap <leader>s :SendSelection<CR>


let &cpo = s:save_cpo
unlet s:save_cpo

