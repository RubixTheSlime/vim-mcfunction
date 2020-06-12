" From other files to reorganize
syn match   mcAdvancementNameFilter             contained skipwhite nextgroup=mcFilterEqAdvance                         /\(\w\|[/:]\)\+/        
syn match   mcAdvancementCriterionNameFilter    contained skipwhite nextgroup=mcFilterEqAdvance                         /\(\w\|[.+-]\)\+/       
hi def link mcAdvancementNameFilter     mcAdvancementName
hi def link mcAdvancementCriterionNameFilter    mcAdvanecmentCriterionName

syn match   mcFilterComma       contained /,/
" Keywords
syn keyword mcFilterKeyword     contained x y z dx dy dz        skipwhite nextgroup=mcFilterEqF
syn keyword mcFilterKeyword     contained x_rotation            skipwhite nextgroup=mcFilterEqXR
syn keyword mcFilterKeyword     contained y_rotation            skipwhite nextgroup=mcFilterEqYR
syn keyword mcFilterKeyword     contained distance              skipwhite nextgroup=mcFilterEqUFR
syn keyword mcFilterKeyword     contained limit                 skipwhite nextgroup=mcFilterEqUI
syn keyword mcFilterKeyword     contained level                 skipwhite nextgroup=mcFilterEqUIR
syn keyword mcFilterKeyword     contained nbt                   skipwhite nextgroup=mcFilterEqNBT
syn keyword mcFilterKeyword     contained sort                  skipwhite nextgroup=mcFilterEqSort
syn keyword mcFilterKeyword     contained gamemode              skipwhite nextgroup=mcFilterEqGamemode
syn keyword mcFilterKeyword     contained team                  skipwhite nextgroup=mcFilterEqTeam
syn keyword mcFilterKeyword     contained name                  skipwhite nextgroup=mcFilterEqName
syn keyword mcFilterKeyword     contained tag                   skipwhite nextgroup=mcFilterEqTag
syn keyword mcFilterKeyword     contained type                  skipwhite nextgroup=mcFilterEqType
syn keyword mcFilterKeyword     contained scores                skipwhite nextgroup=mcFilterEqScores
syn keyword mcFilterKeyword     contained advancements          skipwhite nextgroup=mcFilterEqAdvances

" ... = ...
syn match   mcFilterEqGamemode  contained /=/    skipwhite nextgroup=mcGamemode
syn match   mcFilterEqNBT       contained /=/    skipwhite nextgroup=mcNBTTag
syn match   mcFilterEqTag       contained /=/    skipwhite nextgroup=mcFilterTag
syn match   mcFilterEqSort      contained /=/    skipwhite nextgroup=mcFilterSort
syn match   mcFilterEqScores    contained /=/    skipwhite nextgroup=mcFilterScores
syn match   mcFilterEqAdvances  contained /=/    skipwhite nextgroup=mcFilterAdvancements
syn match   mcFilterEqScore     contained /=/    skipwhite nextgroup=mcFilterIR1,mcFilterIR2
syn match   mcFilterEqAdvance   contained /=/    skipwhite nextgroup=mcFilterAdvancementCriterion,mcBool
syn match   mcFilterEqName      contained /=!\?/ skipwhite nextgroup=mcPlayerName
syn match   mcFilterEqTeam      contained /=!\?/ skipwhite nextgroup=mcTeamName
syn match   mcFilterEqType      contained /=!\?/ skipwhite nextgroup=mcEntityType
syn match   mcFilterEqTag       contained /=!\?/ skipwhite nextgroup=mcTagName
syn match   mcFilterEqF         contained /=/    skipwhite nextgroup=mcFilterF
syn match   mcFilterEqUI        contained /=/    skipwhite nextgroup=mcFilterUI
syn match   mcFilterEqUFR       contained /=/    skipwhite nextgroup=mcFilterUFR1,mcFilterUFR2
syn match   mcFilterEqXR        contained /=/    skipwhite nextgroup=mcFilterXR1,mcFilterXR2
syn match   mcFilterEqYR        contained /=/    skipwhite nextgroup=mcFilterYR1,mcFilterYR2

" Key Values
syn keyword mcFilterSort        contained nearest furthest random arbitrary

" Values
syn match   mcFilterUI          contained /\d\+/
syn match   mcFilterF           contained /-\?\d*\.\?\d\+/

" Ranges
syn match   mcFilterIR1         contained /-\?\d\+/                                                                        nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterIR2
syn match   mcFilterUIR1        contained /\d\+/                                                                           nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterUIR2
syn match   mcFilterUFR1        contained /-\?\d*\.\?\d\+/                                                                 nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterUFR2
syn match   mcFilterXR1         contained /-\?90\(\.0\+\)\?\|-\?[0-8]\?\d\(\.\d\+\)\?\|-\?\.\d\+/                          nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterXR2
syn match   mcFilterYR1         contained /-\?180\(\.0\+\)\?\|-\?1[0-7]\d\(\.\d\+\)\?\|-\?\d\?\d\(\.\d\+\)\?\|-\?\.\d\+/   nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterYR2
syn match   mcFilterIR2         contained /\.\.-\?\d\+/
syn match   mcFilterUIR2        contained /\.\.\d\+/
syn match   mcFilterUFR2        contained /\.\.-\?\d*\.\?\d\+/
syn match   mcFilterXR2         contained /\.\.\(90\(\.0\+\)\?\|-\?[0-8]\?\d\(\.\d\+\)\?\|-\?\.\d\+\)/
syn match   mcFilterYR2         contained /\.\.\(-\?180\(\.0\+\)\?\|-\?1[0-7]\d\(\.\d\+\)\?\|-\?\d\?\d\(\.\d\+\)\?\|-\?\.\d\+\)/
syn match   mcFilterRangeInf    contained /\.\.\s*\_[,\]]\@=/

" Lists
syn region  mcFilterScores                      matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcObjectiveNameFilter
syn region  mcFilterAdvancements                matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementNameFilter
syn region  mcFilterAdvancementCriterion        matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementCriterionNameFilter


" Links
hi def link mcFilterComma               mcFilterEq
hi def link mcFilterSort                mcKeyValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterEq                  mcSelector
hi def link mcFilterRange               mcFilterValue
hi def link mcFilterValue               mcValue

hi def link mcFilterEqGamemode          mcFilterEq
hi def link mcFilterEqNBT               mcFilterEq
hi def link mcFilterEqTag               mcFilterEq
hi def link mcFilterEqSort              mcFilterEq
hi def link mcFilterEqScores            mcFilterEq
hi def link mcFilterEqAdvances          mcFilterEq
hi def link mcFilterEqScore             mcFilterEq
hi def link mcFilterEqAdvance           mcFilterEq
hi def link mcFilterEqName              mcFilterEq
hi def link mcFilterEqTeam              mcFilterEq
hi def link mcFilterEqType              mcFilterEq
hi def link mcFilterEqTag               mcFilterEq
hi def link mcFilterEqF                 mcFilterEq
hi def link mcFilterEqUI                mcFilterEq
hi def link mcFilterEqUFR               mcFilterEq
hi def link mcFilterEqXR                mcFilterEq
hi def link mcFilterEqYR                mcFilterEq

hi def link mcFilterUI                  mcFilterValue
hi def link mcFilterF                   mcFilterValue

hi def link mcFilterIR1                 mcFilterRange
hi def link mcFilterUIR1                mcFilterRange
hi def link mcFilterUFR1                mcFilterRange
hi def link mcFilterXR1                 mcFilterRange
hi def link mcFilterYR1                 mcFilterRange
hi def link mcFilterIR2                 mcFilterRange
hi def link mcFilterUIR2                mcFilterRange
hi def link mcFilterUFR2                mcFilterRange
hi def link mcFilterXR2                 mcFilterRange
hi def link mcFilterYR2                 mcFilterRange
hi def link mcFilterRangeInf            mcFilterRange

