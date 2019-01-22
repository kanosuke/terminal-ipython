scriptencoding utf-8

if !exists('g:loaded_terminalipython')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! s:get_lineno_for_search(pattern, flags)
    let lineno = searchpos(a:pattern, a:flags)[0]
	return lineno
endfunction

function! s:get_lineno_for_blockstart()
    let lineno = s:get_lineno_for_search("# %%", "bWnc")
	return lineno
endfunction

function! s:get_lineno_for_blockend()
    let lineno = s:get_lineno_for_search("# %%", "Wnc")
	return lineno
endfunction

function! s:get_lines(fline, lline)
    let lines = join(getline(a:fline, a:lline), "\n") . "\n"
	return lines
endfunction

function! s:term_sendlines(buf, lines)
    call term_sendkeys(a:buf, a:lines)
	sleep 20m
endfunction

function! s:ipython_sendcpastesentence(lines)
	call s:term_sendlines("!ipython", "%cpaste -q\n")
	call s:term_sendlines("!ipython", a:lines)
	call s:term_sendlines("!ipython", "--\n")
endfunction


function! terminalipython#ipython_sendline()
	let lineno = line(".")
    let lines = s:get_lines(lineno, lineno)
	call s:ipython_sendcpastesentence(lines)
endfunction

function! terminalipython#ipython_sendblock()
	let fline = s:get_lineno_for_blockstart()
	let lline = s:get_lineno_for_blockend()
    let lines = s:get_lines(fline, lline)
	call s:ipython_sendcpastesentence(lines)
endfunction

function! terminalipython#ipython_sendselection() range
    let lines = s:get_lines(a:firstline, a:lastline)
	call s:ipython_sendcpastesentence(lines)
endfunction

function! terminalipython#start_ipython()
    vert term ipython
    wincmd l
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

