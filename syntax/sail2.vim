if exists("b:current_syntax")
  finish
endif

syn keyword sail2Keyword let var if then by
syn keyword sail2Keyword else match in return register ref forall operator effect
syn keyword sail2Keyword overload cast sizeof constraint default assert newtype from
syn keyword sail2Keyword pure infixl infixr infix scattered end try catch and to
syn keyword sail2Keyword throw clause as repeat until while do foreach
syn keyword sail2Keyword mapping

syn keyword sail2Keyword type struct union enum bitfield nextgroup=sail2Identifier skipwhite skipempty
syn keyword sail2Keyword val function nextgroup=sail2FuncName skipwhite skipempty

syn keyword sail2Kind Int Type Order inc dec
syn keyword sail2Kind barr depend rreg wreg rmem rmemt wmv wmvt eamem wmem
syn keyword sail2Kind exmem undef unspec nondet escape

syn keyword sail2Type vector int nat atom range unit bit real list bool string bits option
syn keyword sail2Type uint64_t int64_t bv_t mpz_t

syn match   sail2PreProc "^\s*\$\%(define\|include\|ifdef\|ifndef\|else\|endif\)\>"
syn keyword sail2Special _prove create kill convert undefined

syn match sail2Identifier "[a-zA-Z_][a-zA-Z0-9_']*" display contained

syn match sail2FuncCall "[a-zA-Z_][a-zA-Z0-9_]*("he=e-1,me=e-1
syn match sail2FuncName "[a-zA-Z_][a-zA-Z0-9_]*" display contained

syn match sail2DecNumber display "\<[0-9]\+"
syn match sail2HexNumber display "\<0x[0-9a-fA-F_]\+"
syn match sail2BinNumber display "\<0b[01]\+"

syn match  sail2EscapeError        display contained /\\./
syn match  sail2Escape             display contained /\\\([nrtb\\'"]\|x\x\{2}\|\d\{3}\)/
syn match  sail2StringContinuation display contained /\\\n\s*/
syn region sail2String             start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=sail2Escape,sail2EscapeError,sail2StringContinuation

syn keyword sail2Boolean true false bitone bitzero

syn region sail2CommentLine                                                   start="//"                      end="$"   contains=sail2Todo
syn region sail2CommentBlock             matchgroup=sail2CommentBlock         start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=sail2Todo,sail2CommentBlockNest
syn region sail2CommentBlockDoc          matchgroup=sail2CommentBlockDoc      start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=sail2Todo,sail2CommentBlockDocNest
syn region sail2CommentBlockDocError     matchgroup=sail2CommentBlockDocError start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=sail2Todo,sail2CommentBlockDocNestError contained
syn region sail2CommentBlockNest         matchgroup=sail2CommentBlock         start="/\*"                     end="\*/" contains=sail2Todo,sail2CommentBlockNest contained transparent
syn region sail2CommentBlockDocNest      matchgroup=sail2CommentBlockDoc      start="/\*"                     end="\*/" contains=sail2Todo,sail2CommentBlockDocNest contained transparent
syn region sail2CommentBlockDocNestError matchgroup=sail2CommentBlockDocError start="/\*"                     end="\*/" contains=sail2Todo,sail2CommentBlockDocNestError contained transparent

syn keyword sail2Todo contained TODO FIXME XXX NB NOTE

hi def link sail2DecNumber sail2Number
hi def link sail2HexNumber sail2Number
hi def link sail2BinNumber sail2Number

hi def link sail2Keyword              Keyword
hi def link sail2Kind                 Type
hi def link sail2Type                 Type
hi def link sail2PreProc              PreProc
hi def link sail2Special              Special
hi def link sail2Identifier           Identifier
hi def link sail2FuncCall             Function
hi def link sail2FuncName             Function
hi def link sail2Number               Number
hi def link sail2EscapeError          Error
hi def link sail2Escape               Special
hi def link sail2StringContinuation   Special
hi def link sail2String               String
hi def link sail2Boolean              Boolean
hi def link sail2CommentLine          Comment
hi def link sail2CommentBlock         Comment
hi def link sail2CommentBlockDoc      SpecialComment
hi def link sail2CommentBlockDocError Error

let b:current_syntax = "sail2"
