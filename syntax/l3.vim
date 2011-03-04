" Vim syntax file
" Language:	L₃
" Maintainer: 	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

if exists("b:current_syntax")
  finish
endif

syn match l3Error		"[^[:space:]]"

syn keyword l3Todo		TODO contained containedin=l3Comment
syn match l3Comment		";.*" contains=@Spell,l3Todo

syn keyword l3Statement		and		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Statement		begin		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Statement		defrec		contained skipwhite skipempty nextgroup=l3BindingName
syn keyword l3Statement		def		contained skipwhite skipempty nextgroup=l3BindingName
syn keyword l3Statement		fun		contained skipwhite skipempty nextgroup=l3ArgList
syn keyword l3Statement		let*		contained skipwhite skipempty nextgroup=l3BindingList
syn keyword l3Statement		letrec		contained skipwhite skipempty nextgroup=l3BindingList
syn keyword l3Statement		let		contained skipwhite skipempty nextgroup=l3BindingList
syn keyword l3Statement		not		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Statement		or		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Statement		rec		contained skipwhite skipempty nextgroup=l3RecName
syn keyword l3Conditional	cond		contained skipwhite skipempty nextgroup=l3CondList
syn keyword l3Conditional	if		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@function?	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@block?		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@block-tag	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@block-length	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@block-get	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@block-set!	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@int?		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@+		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@-		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@*		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@/		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@%		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@<=		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@<		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@=		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@!=		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@>=		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@>		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@char-read	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@char-print	contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@bool?		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@not		contained skipwhite skipempty nextgroup=l3Body
syn keyword l3Primitive		@unit?		contained skipwhite skipempty nextgroup=l3Body
syn match l3Primitive		"@block-alloc-\%(\d\|\d\d\|1\d\d\|2[0-4]\d\|25[0-5]\)" contained skipwhite skipempty nextgroup=l3Body

syn match l3Identifier		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained
syn match l3Function		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=l3Body
syn match l3BindingName 	"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=@l3Expression
syn match l3RecName 		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=l3BindingList

syn match l3Number		"-\?\d\+"	contained
syn match l3String		!"[^\r"]*"!	contained contains=@Spell
syn match l3Character		"'.'"		contained
syn match l3Boolean		"#[tf]"		contained
syn match l3Unit		"#u"		contained

syn cluster l3Statement		contains=l3Statement,l3Conditional
syn cluster l3Callable		contains=l3Primitive,l3Function
syn cluster l3Literal		contains=l3Number,l3String,l3Character,l3Boolean,l3Unit
syn cluster l3Expression	contains=@l3Literal,l3Identifier,l3Instruction

syn region l3Instruction	matchgroup=Delimiter start="(" end=")" contains=@l3Statement,@l3Callable,l3Comment,l3Error
syn region l3Binding		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body contains=l3BindingName,l3Comment,l3Error
syn region l3Condition		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Condition contains=@l3Expression,l3Comment,l3Error
syn region l3ArgList		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body contains=l3Identifier,l3Comment,l3Error
syn region l3BindingList	matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body contains=l3Binding,l3Comment,l3Error

syn region l3Body		start="." end=")"me=s-1 contained contains=@l3Expression,l3Comment,l3Error
syn region l3CondList		start="." end=")"me=s-1 contained contains=l3Condition,l3Comment,l3Error

hi def link l3Error		Error
hi def link l3Comment		Comment
hi def link l3Todo		Todo

hi def link l3Statement		Statement
hi def link l3Conditional	Conditional
hi def link l3Function		Function
hi def link l3Primitive		Function
hi def link l3BindingName		Identifier
hi def link l3RecName		Identifier
hi def link l3Identifier	Identifier

hi def link l3Number		Number
hi def link l3Character		Character
hi def link l3String		String
hi def link l3Boolean		Boolean
hi def link l3Unit		Constant

let b:current_syntax = "l3"
