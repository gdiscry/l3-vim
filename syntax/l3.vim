" Vim syntax file
" Language:	L₃
" Maintainer: 	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

if exists("b:current_syntax")
  finish
endif

syn match l3Error ")"

syn match l3Comment ";.*"

syn region l3List matchgroup=Delimiter start="(" end=")" contains=ALL

syn match l3Identifier	"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*"
syn keyword l3Syntax and begin defrec def fun let* letrec let not or rec
syn keyword l3CondSyntax cond if
syn match l3Primitive "@\%(function?\|block?\|block-tag\|block-length\|block-get\|block-set!\|int?\|+\|-\|*\|/\|%\|<=\|<\|=\|!=\|>=\|>\|char-read\|char-print\|bool?\|not\|unit?\)"
syn match l3Primitive "@block-alloc-\%(\d\|\d\d\|1\d\d\|2[0-4]\d\|25[0-5]\)"


syn match l3Number	"-\?\d\+"
syn match l3String	!"[^\r"]*"!
syn match l3Character	"'.'"
syn match l3Boolean	"#[tf]"
syn match l3Unit	"#u"

hi def link l3Error		Error
hi def link l3Comment		Comment

hi def link l3Syntax		Statement
hi def link l3CondSyntax	Conditional
hi def link l3Primitive		Function
hi def link l3Function		Function
hi def link l3Identifier	Identifier

hi def link l3Number		Number
hi def link l3Character		Character
hi def link l3String		String
hi def link l3Boolean		Boolean
hi def link l3Unit		Constant

let b:current_syntax = "l3"
