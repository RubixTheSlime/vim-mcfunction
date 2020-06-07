" TODO store if unless
" Keywords
syn keyword mcExecuteKeyword                    align           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAlignValue
syn keyword mcExecuteKeyword                    anchored        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn keyword mcExecuteAsKeyword                  as              contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecute
syn keyword mcExecuteKeyword                    at              contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecute
syn keyword mcExecuteFacingKeyword              facing          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate
syn keyword mcExecuteFacingEntityKeyword        entity          contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteFacing
syn keyword mcExecuteKeyword                    in              contained skipwhite nextgroup=mcDoubleSpace,mcDimensionExecute
syn keyword mcExecuteKeyword                    positioned      contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecute,mcExecuteAsKeyword
syn keyword mcExecuteKeyword                    rotated         contained skipwhite nextgroup=mcDoubleSpace,mcRotationExecute,mcExecuteAsKeyword
syn keyword mcExecuteKeyword                    store           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhat
syn keyword mcExecuteKeyword                    if unless       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCond
syn keyword mcExecuteKeyword                    run             contained skipwhite nextgroup=mcDoubleSpace,mcCommand
hi def link mcExecuteAsKeyword                  mcExecuteKeyword
hi def link mcExecuteFacingKeyword              mcExecuteKeyword
hi def link mcExecuteFacingEntityKeyword        mcExecuteKeyword
syn cluster mcExecuteKeyword contains=mcExecuteKeyword,mcExecuteAsKeyword,mcExecuteFacingKeyword

" Values for align, anchored, and in
syn match   mcExecuteAlignValue         contained /\<\(x\([^ x]*x\)\@!\|y\([^ y]*y\)\@!\|z\([^ z]*z\)\@!\)\{1,3\}\>/    skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteAnchoredValue      contained eyes feet                                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteInValueRaw         contained overworld the_nether the_end                                          skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteCondBlocksMask     contained all masked                                                            skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteAlignValue         mcExecuteKeyValue
hi def link mcExecuteAnchoredValue      mcExecuteKeyValue
hi def link mcExecuteInValueRaw         mcExecuteKeyValue
hi def link mcExecuteCondBlocksMask     mcExecuteKeyValue

" Store
syn keyword mcExecuteStoreWhat  result success  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhere
syn keyword mcExecuteStoreWhere block           contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteStoreBlock
syn keyword mcExecuteStoreWhere bossbar         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdExecuteStore
syn keyword mcExecuteStoreWhere entity          contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteStore
syn keyword mcExecuteStoreWhere score           contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteStoreScore
syn keyword mcExecuteStoreType  byte short int long float double        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreScale
syn match   mcExecuteStoreTypePad       / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreType
syn match   mcExecuteStoreScale /-\?\d*\.\?\d\+/                        contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteStoreWhat  mcExecuteKeyword
hi def link mcExecuteStoreWhere mcExecuteKeyword
hi def link mcExecuteStoreType  mcExecuteKeyValue
hi def link mcExecuteStoreScale mcExecuteValue

" Condition
syn keyword mcExecuteCond               block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondBlock
syn keyword mcExecuteCond               blocks                  contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondStart
syn keyword mcExecuteCond               data                    contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCondData
syn keyword mcExecuteCond               entity                  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCond
syn keyword mcExecuteCond               score                   contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondScoreTarget
syn keyword mcExecuteCondData           block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondData
syn keyword mcExecuteCondData           entity                  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondData
syn match   mcExecutePad                / \@=/                  contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteCondScoreOp        /[<>=]\@=[<>]\?=\?/     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondScoreSource
syn keyword mcExecuteCondScoreMatch     matches                 contained skipwhite nextgroup=mcDoubleSpace,mcExecuteIR1,mcExecuteIR2
syn match   mcExecuteIR1                /-\?\d\+/               contained skipwhite nextgroup=mcDoubleSpace,mcExecuteRangeInf,mcExecuteIR2,@mcExecuteKeyword
syn match   mcExecuteIR2                / \@!\.\.-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteRangeInf           /\.\.\_[ ]/             contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteIR1                mcExecuteValue
hi def link mcExecuteIR2                mcExecuteValue
hi def link mcExecuteRangeInf           mcExecuteValue
hi def link mcExecuteCond               mcExecuteKeyword
hi def link mcExecuteCondData           mcExecuteKeyword
hi def link mcExecuteCondScoreOp        mcExecuteKeyword
hi def link mcExecuteCondScoreMatch     mcExecuteKeyword

syn match mcExecuteInValuePrefix /minecraft:/ contained skipwhite nextgroup=mcAnySpace,mcExecuteInValueRaw
hi def link mcExecuteInValuePrefix mcExecuteInValueRaw
syn cluster mcExecuteInValue contains=mcExecuteInValueRaw,mcExecuteInValuePrefix

syn keyword mcExecuteCommand execute contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn cluster mcCommand add=mcExecuteCommand
