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

function! terminalipython#get_block_first_line()
    let firstline = searchpos("# %%", "bWnc")[0]
    return firstline
endfunction

function! terminalipython#get_block_last_line()
    let lastline = searchpos("# %%", "Wnc")[0]
    return lastline
endfunction

function! terminalipython#send_lines(line1, line2)
    let expr = join(getline(a:line1, a:line2), "\n") . "\n"
    call term_sendkeys("!ipython", "%cpaste\n")
    call term_wait("!iptyhon")
    call term_sendkeys("!ipython", expr)
    call term_wait("!iptyhon")
    call term_sendkeys("!ipython", "--\n")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

