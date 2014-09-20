"=============================================================================
" File: marker.vim
" Author: mopp
" Created: 2014-09-21
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_marker')
    finish
endif
let g:loaded_marker = 1

let s:save_cpo = &cpo
set cpo&vim


nnoremap <silent> <Plug>(Marker-auto_mark) :<C-U>call marker#auto_mark()<CR>

command! -nargs=0 MarkerAutoMark call marker#auto_mark()


let &cpo = s:save_cpo
unlet s:save_cpo
