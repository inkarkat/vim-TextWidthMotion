" TextWidthMotion.vim: Motions to lines shorter or longer than a certain width.
"
" DEPENDENCIES:
"   - CountJump.vim autoload script
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

function! s:IsCountAsWidth()
    return (v:count && v:count >= g:TextWidthMotion_CountThreshold)
endfunction
function! s:GetWidth()
    if s:IsCountAsWidth()
	return v:count
    elseif exists('b:TextWidthMotion_Width')
	return b:TextWidthMotion_Width
    elseif exists('g:TextWidthMotion_Width')
	return g:TextWidthMotion_Width
    elseif ! empty(&colorcolumn)
	return s:GetColorColumn()
    elseif &textwidth > 0
	return &textwidth
    else
	return 80
    endif
endfunction
function! s:GetColorColumn()
    let l:cc = split(&colorcolumn, ',')[0]
    return (l:cc =~# '^\d\+$' ? l:cc : eval(&textwidth . l:cc))
endfunction

function! s:LongerExpr( isBackward )
    return printf('\%%%s%dl\%%>%dv.*$', (a:isBackward ? '<' : '>'), line('.'), s:GetWidth())
endfunction
function! s:ShorterExpr( isBackward )
    return printf('\%%%s%dl\%%<%dv$', (a:isBackward ? '<' : '>'), line('.'), s:GetWidth())
endfunction

function! TextWidthMotion#LongerForward( mode )
    return CountJump#CountCountJumpWithWrapMessage((s:IsCountAsWidth() ? 1 : v:count1), a:mode, '', s:LongerExpr(0), 'W')
endfunction
function! TextWidthMotion#LongerBackward( mode )
    return CountJump#CountCountJumpWithWrapMessage((s:IsCountAsWidth() ? 1 : v:count1), a:mode, '', s:LongerExpr(1), 'bW')
endfunction
function! TextWidthMotion#ShorterForward( mode )
    return CountJump#CountCountJumpWithWrapMessage((s:IsCountAsWidth() ? 1 : v:count1), a:mode, '', s:ShorterExpr(0), 'W')
endfunction
function! TextWidthMotion#ShorterBackward( mode )
    return CountJump#CountCountJumpWithWrapMessage((s:IsCountAsWidth() ? 1 : v:count1), a:mode, '', s:ShorterExpr(1), 'bW')
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
