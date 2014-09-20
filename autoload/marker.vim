"=============================================================================
" File: marker.vim
" Author: mopp
" Created: 2014-09-21
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_marker')
    finish
endif
let g:loaded_marker = 1

let s:save_cpo = &cpo
set cpo&vim



" Global variables
let g:marker_is_reset = get(g:, 'marker_is_reset', 0)

" Script local variables.
let s:marks = 'abcdefghijklmnopqrstuvwxyz'
let s:len = len(s:marks) - 1


function! marker#auto_mark()
    if !exists('b:marker_current_idx')
        let b:marker_current_idx = -1
        if g:marker_is_reset == 0
            for i in range(len(s:marks))
                if line("'" . s:marks[i]) == 0
                    let b:marker_current_idx = i - 1
                    break
                endif
            endfor
        endif
    endif
    let b:marker_current_idx = (b:marker_current_idx < s:len) ? b:marker_current_idx + 1 : 0

    let m = s:marks[b:marker_current_idx]
    execute 'mark' m
    echomsg 'marked ' . m
endfunction


if g:marker_is_reset != 0
    augroup marker
        autocmd!
        autocmd BufReadPost * delmarks!
    augroup END
endif



let &cpo = s:save_cpo
unlet s:save_cpo
