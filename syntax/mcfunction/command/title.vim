syn keyword mcCommand title                     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityTitle

syn keyword mcTitleKeyword      contained actionbar subtitle title skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn keyword mcTitleKeyword      contained clear reset
syn keyword mcTitleKeyword      contained times skipwhite nextgroup=mcDoubleSpace,mcTitleTime
hi def link mcTitleKeyword mcKeyWord
syn match mcTitleTime           /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime2
syn match mcTitleTime2          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime3
syn match mcTitleTime3          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace
hi def link mcTitleTime         mcCoordinate
hi def link mcTitleTime2        mcCoordinate2
hi def link mcTitleTime3        mcCoordinate3
