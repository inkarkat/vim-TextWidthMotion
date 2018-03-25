" TextWidthMotion.vim: Motions to lines shorter or longer than a certain width.
"
" DEPENDENCIES:
"   - CountJump/Motion.vim autoload script
"   - TextWidthMotion.vim autoload script
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_TextWidthMotion') || (v:version < 700)
    finish
endif
let g:loaded_TextWidthMotion = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:TextWidthMotion_LongerMapping')
    let g:TextWidthMotion_LongerMapping = '>'
endif
if ! exists('g:TextWidthMotion_ShorterMapping')
    let g:TextWidthMotion_ShorterMapping = '<'
endif
if ! exists('g:TextWidthMotion_CountThreshold')
    let g:TextWidthMotion_CountThreshold = 10
endif


"- mappings --------------------------------------------------------------------

call CountJump#Motion#MakeBracketMotionWithJumpFunctions('', g:TextWidthMotion_LongerMapping, '',
\   function('TextWidthMotion#LongerForward'),
\   function('TextWidthMotion#LongerBackward'),
\   '', '', 0)
call CountJump#Motion#MakeBracketMotionWithJumpFunctions('', g:TextWidthMotion_ShorterMapping, '',
\   function('TextWidthMotion#ShorterForward'),
\   function('TextWidthMotion#ShorterBackward'),
\   '', '', 0)

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
