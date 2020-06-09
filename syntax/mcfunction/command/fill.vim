syn keyword mcCommand fill                      contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillFrom

syn match   mcFillPad           / \@=/                          contained skipwhite nextgroup=mcDoubleSpace,mcFillMode
syn keyword mcFillMode          destroy hollow keep outline     contained
syn keyword mcFillMode          replace                         contained skipwhite nextgroup=mcDoubleSpace,mcBlockNameFillReplace
hi def link mcFillMode          mcKeyword

syn match   mcBlockNameFill                     /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFill,mcNBTTagFill,mcFillPad
syn match   mcBlockNameFillReplace              /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFillReplace,mcNBTTagFillReplace
syn region  mcBlockStateFill            matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFill,mcFillPad
syn region  mcBlockStateFillReplace     matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFillReplace,mcFillReplacePad
hi def link mcBlockNameFill                     mcBlockName
hi def link mcBlockNameFillReplace              mcBlockName
