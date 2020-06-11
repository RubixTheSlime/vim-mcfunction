syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace


syn match   mcUInt              /\d\+/  contained
syn match   mcLineEnd           /\s*$/  contained
hi def link mcUInt              mcValue

syn keyword mcBool              contained true false

"TODO
syn match   mcJSONText          contained /.\+/
hi def link mcJSONText          mcString

" Can't have multiple spaces
syn match mcDoubleSpace / \@<= \+\| \{2,}/ contained containedin=ALLBUT,@mcNBT,mcChatMessage,@mcSelectorFilter,mcBlockState
hi def link mcDoubleSpace mcBadWhitespace

" Optional Slash
syn match mcOptionalSlash /^\/\?/ nextgroup=@mcCommand
hi def link mcOptionalSlash mcCommand
syn cluster mcCommand add=mcCommand

" Illegal Whitespace
syn match mcComment /^#.*/
syn match mcBadWhitespace /\t/

syn sync minlines=1
