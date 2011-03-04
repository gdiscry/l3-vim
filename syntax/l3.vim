" Vim syntax file
" Language:	L₃
" Maintainer: 	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

if exists("b:current_syntax")
  finish
endif

syn match l3Error "[^[:space:]]"

syn match l3Comment ";.*" contains=@Spell

syn region l3List matchgroup=Delimiter start="(" end=")" contains=ALL

syn match l3Identifier	"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained

syn keyword l3Syntax		and		contained
syn keyword l3Syntax		begin		contained
syn keyword l3Syntax		defrec		contained
syn keyword l3Syntax		def		contained
syn keyword l3Syntax		fun		contained
syn keyword l3Syntax		let*		contained
syn keyword l3Syntax		letrec		contained
syn keyword l3Syntax		let		contained
syn keyword l3Syntax		not		contained
syn keyword l3Syntax		or		contained
syn keyword l3Syntax		rec		contained
syn keyword l3CondSyntax	cond		contained
syn keyword l3CondSyntax	if		contained
syn keyword l3Primitive		@function?	contained
syn keyword l3Primitive		@block?		contained
syn keyword l3Primitive		@block-tag	contained
syn keyword l3Primitive		@block-length	contained
syn keyword l3Primitive		@block-get	contained
syn keyword l3Primitive		@block-set!	contained
syn keyword l3Primitive		@int?		contained
syn keyword l3Primitive		@+		contained
syn keyword l3Primitive		@-		contained
syn keyword l3Primitive		@*		contained
syn keyword l3Primitive		@/		contained
syn keyword l3Primitive		@%		contained
syn keyword l3Primitive		@<=		contained
syn keyword l3Primitive		@<		contained
syn keyword l3Primitive		@=		contained
syn keyword l3Primitive		@!=		contained
syn keyword l3Primitive		@>=		contained
syn keyword l3Primitive		@>		contained
syn keyword l3Primitive		@char-read	contained
syn keyword l3Primitive		@char-print	contained
syn keyword l3Primitive		@bool?		contained
syn keyword l3Primitive		@not		contained
syn keyword l3Primitive		@unit?		contained
syn match l3Primitive		"@block-alloc-\%(\d\|\d\d\|1\d\d\|2[0-4]\d\|25[0-5]\)" contained

syn match l3Number	"-\?\d\+"	contained
syn match l3String	!"[^\r"]*"!	contained contains=@Spell
syn match l3Character	"'.'"		contained
syn match l3Boolean	"#[tf]"		contained
syn match l3Unit	"#u"		contained

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
