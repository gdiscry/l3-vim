" Vim syntax file
" Language:	L₃
" Maintainer: 	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

if exists("b:current_syntax")
  finish
endif

syn match l3Error ")"

syn match l3Comment ";.*" contains=@Spell

syn region l3List matchgroup=Delimiter start="(" end=")" contains=ALL

syn match l3Identifier	"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*"

syn keyword l3Syntax		and
syn keyword l3Syntax		begin
syn keyword l3Syntax		defrec
syn keyword l3Syntax		def
syn keyword l3Syntax		fun
syn keyword l3Syntax		let*
syn keyword l3Syntax		letrec
syn keyword l3Syntax		let
syn keyword l3Syntax		not
syn keyword l3Syntax		or
syn keyword l3Syntax		rec
syn keyword l3CondSyntax	cond
syn keyword l3CondSyntax	if
syn keyword l3Primitive		@function?
syn keyword l3Primitive		@block?
syn keyword l3Primitive		@block-tag
syn keyword l3Primitive		@block-length
syn keyword l3Primitive		@block-get
syn keyword l3Primitive		@block-set!
syn keyword l3Primitive		@int?
syn keyword l3Primitive		@+
syn keyword l3Primitive		@-
syn keyword l3Primitive		@*
syn keyword l3Primitive		@/
syn keyword l3Primitive		@%
syn keyword l3Primitive		@<=
syn keyword l3Primitive		@<
syn keyword l3Primitive		@=
syn keyword l3Primitive		@!=
syn keyword l3Primitive		@>=
syn keyword l3Primitive		@>
syn keyword l3Primitive		@char-read
syn keyword l3Primitive		@char-print
syn keyword l3Primitive		@bool?
syn keyword l3Primitive		@not
syn keyword l3Primitive		@unit?
syn match l3Primitive		"@block-alloc-\%(\d\|\d\d\|1\d\d\|2[0-4]\d\|25[0-5]\)"

syn match l3Number	"-\?\d\+"
syn match l3String	!"[^\r"]*"! contains=@Spell
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
