syn keyword mcCommand data                      contained skipwhite nextgroup=mcDoubleSpace,mcDataKeyword

syn keyword mcDataKeyword       get     contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordGet
syn keyword mcDataKeyword       merge   contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordMerge
syn keyword mcDataKeyword       modify  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordModify
syn keyword mcDataKeyword       remove  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
syn keyword mcDataKeywordGet    block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataGet
syn keyword mcDataKeywordMerge  block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataMerge
syn keyword mcDataKeywordModify block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataModify
syn keyword mcDataKeywordRemove block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataRemove
syn keyword mcDataKeywordGet    entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataGet
syn keyword mcDataKeywordMerge  entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataMerge
syn keyword mcDataKeywordModify entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataModify
syn keyword mcDataKeywordRemove entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataRemove
syn match   mcDataGetPad        / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcDataGetScale
syn match   mcDataGetScale      /-\?\d*\.\?\d\+/                contained
hi def link mcDataKeywordGet    mcDataKeyword
hi def link mcDataKeywordModify mcDataKeyword
hi def link mcDataKeywordRemove mcDataKeyword
hi def link mcDataKeywordMerge  mcDataKeyword
hi def link mcDataGetScale      mcValue

" Data modify
syn match   mcDataModifyPad     / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyHow
syn keyword mcDataModifyHow     append merge prepend set        contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource
syn keyword mcDataModifyHow     insert                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyIndex
syn match   mcDataModifyIndex   /\d\+/                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource
syn keyword mcDataModifySource  value                           contained skipwhite nextgroup=mcDoubleSpace,@mcNBTValue
" it just so happens that data modify from ends the same way as data remove!
syn keyword mcDataModifySource  from                            contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
hi def link mcDataModifyHow     mcDataKeyword
hi def link mcDataModifyIndex   mcValue
hi def link mcDataModifySource  mcDataKeyword
