" Vim filetype file
" Language:	L₃
" Maintainer:	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

" Only do this when not done yet for this buffer
if exists("b:did_indent")
  finish
endif

runtime! ftplugin/lisp.vim

setl iskeyword+=124,38,.,~
setl lispwords=and,begin,defrec,def,fun,let*,letrec,let,not,or,rec,cond,if
