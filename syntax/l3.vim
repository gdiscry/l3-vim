" Vim syntax file
" Language:	L₃
" Maintainer: 	Georges Discry <georges.discry@epfl.ch>
" Last Change:	4 March 2011

if exists("b:current_syntax")
  finish
endif

syn match	l3WordError		"[^[:space:]()]\+"
syn region	l3ParenError		matchgroup=Error start="(" end=")" contained contains=l3ParenError,l3WordError
syn cluster	l3Error			contains=l3WordError,l3ParenError

syn keyword	l3DefError		defrec contained
syn keyword	l3DefError		def contained

syn keyword	l3Todo			TODO contained containedin=l3Comment
syn match	l3Comment		";.*" contains=@Spell,l3Todo

syn keyword	l3Statement		and		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Statement		begin		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Definition		defrec		contained skipwhite skipempty nextgroup=l3FunBindingName,@l3Error
syn keyword	l3Definition		def		contained skipwhite skipempty nextgroup=l3BindingName,@l3Error
syn keyword	l3AnonFun		fun		contained skipwhite skipempty nextgroup=l3ArgList,@l3Error
syn keyword	l3Statement		let*		contained skipwhite skipempty nextgroup=l3BindingList,@l3Error
syn keyword	l3Statement		letrec		contained skipwhite skipempty nextgroup=l3FunBindingList,@l3Error
syn keyword	l3Statement		let		contained skipwhite skipempty nextgroup=l3BindingList,@l3Error
syn keyword	l3Statement		not		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Statement		or		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Statement		rec		contained skipwhite skipempty nextgroup=l3RecName,@l3Error
syn keyword	l3Conditional		cond		contained skipwhite skipempty nextgroup=l3CondList,@l3Error
syn keyword	l3Conditional		if		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@function?	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@block?		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@block-tag	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@block-length	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@block-get	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@block-set!	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@int?		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@+		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@-		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@*		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@/		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@%		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@<=		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@<		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@=		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@!=		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@>=		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@>		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@char-read	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@char-print	contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@bool?		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@not		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn keyword	l3Primitive		@unit?		contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn match	l3Primitive		"@block-alloc-\%(1\d\d\|2[0-4]\d\|25[0-5]\|\d\d\|\d\)\d\@!" contained skipwhite skipempty nextgroup=l3Body,@l3Error

syn match	l3Identifier		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" 
syn match	l3Function		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=l3Body,@l3Error
syn match	l3BindingName 		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=@l3Expression,@l3Error
syn match	l3FunBindingName 	"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=l3FunInstr,@l3Error
syn match	l3RecName 		"[-|!%&*+./:<=>?^_~[:alpha:]][-|!%&*+./:<=>?^_~[:alnum:]]*" contained skipwhite skipempty nextgroup=l3BindingList,@l3Error

syn match	l3Number		"-\?\d\+"	
syn match	l3String		!"[^\r"]*"!	contains=@Spell
syn match	l3Character		"'.'"		
syn match	l3Boolean		"#[tf]"		
syn match	l3Unit			"#u"		

syn cluster	l3Statements		contains=l3Statement,l3Conditional,l3AnonFun
syn cluster	l3Callable		contains=l3Primitive,l3Function
syn cluster	l3Literal		contains=l3Number,l3String,l3Character,l3Boolean,l3Unit
syn cluster	l3Expression		contains=@l3Literal,l3Identifier,l3Instruction

syn region	l3TopInstruction	matchgroup=Delimiter start="(" end=")" contains=@l3Statements,l3Definition,@l3Callable,l3Comment,@l3Error
syn region	l3Instruction		matchgroup=Delimiter start="(" end=")" contained contains=@l3Statements,l3DefError,@l3Callable,l3Comment,@l3Error
syn region	l3FunInstr		matchgroup=Delimiter start="(" end=")" contained contains=l3AnonFun,l3Comment,@l3Error
syn region	l3Binding		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Binding,@l3Error contains=l3BindingName,l3Comment,@l3Error
syn region	l3FunBinding		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3FunBinding,@l3Error contains=l3FunBindingName,l3Comment,@l3Error
syn region	l3Condition		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Condition,@l3Error contains=@l3Expression,l3Comment,@l3Error
syn region	l3ArgList		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body,@l3Error contains=l3Identifier,l3Comment,@l3Error
syn region	l3BindingList		matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body,@l3Error contains=l3Binding,l3Comment,@l3Error
syn region	l3FunBindingList	matchgroup=Delimiter start="(" end=")" contained skipwhite skipempty nextgroup=l3Body,@l3Error contains=l3FunBinding,l3Comment,@l3Error

syn region	l3Body			start="." end=")"me=s-1 contained contains=@l3Expression,l3Comment,@l3Error
syn region	l3CondList		start="." end=")"me=s-1 contained contains=l3Condition,l3Comment,@l3Error

hi link		l3WordError		Error
hi link		l3ParenError		Error
hi link		l3DefError		Error
hi link		l3Comment		Comment
hi link		l3Todo			Todo
        	
hi link		l3Statement		Statement
hi link		l3Definition		Statement
hi link		l3AnonFun		Statement
hi link		l3Conditional		Conditional
hi link		l3Function		Function
hi link		l3Primitive		Function
hi link		l3BindingName		Identifier
hi link		l3FunBindingName	Identifier
hi link		l3RecName		Identifier
hi link		l3Identifier		Identifier
        	
hi link		l3Number		Number
hi link		l3Character		Character
hi link		l3String		String
hi link		l3Boolean		Boolean
hi link		l3Unit			Constant

let b:current_syntax = "l3"
