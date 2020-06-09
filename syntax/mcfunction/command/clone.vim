syn keyword mcCommand clone                     contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneFrom

syn keyword mcCloneMask         masked replace          contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMask         filtered                contained skipwhite nextgroup=mcDoubleSpace,mcBlockNameClone
syn match   mcClonePad          / \@=/                  contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMode         force move normal       contained
hi def link mcCloneMask         mcKeyword
hi def link mcCloneMode         mcKeyword
syn match   mcBlockNameClone                    /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateClone,mcNBTTagClone,mcClonePad
hi def link mcBlockNameClone                    mcBlockName
syn region  mcBlockStateClone           matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagClone,mcClonePad
