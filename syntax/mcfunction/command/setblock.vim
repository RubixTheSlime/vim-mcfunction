syn keyword mcCommand setblock                  contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateSetblock

syn match   mcSetblockPad       / \@=/ contained skipwhite nextgroup=mcDoubleSpace,mcSetBlockMode
syn keyword mcSetblockMode      contained destroy keep replace
syn match   mcBlockNameSetblock                 /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateSetblock,mcNBTTagSetblock,mcSetblockPad
syn region  mcBlockStateSetblock        matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagSetblock,mcSetblockPad
hi def link mcBlockNameSetblock                 mcBlockName
hi def link mcSetblockMode      mcKeyword
