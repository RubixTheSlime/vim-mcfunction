syn keyword mcCommand advancement               contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementKeyword

syn match   mcAdvancementName                   /\(\w\|[/:]\)\+/        contained
syn match   mcAdvancementNameFilter             /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcFilterEqAdvance
syn match   mcAdvancementNameCriteria           /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementCriterionName
hi def link mcAdvancementNameFilter     mcAdvancementName
hi def link mcAdvancementNameCriteria   mcAdvancementName

syn match   mcAdvancementCriterionName          /\(\w\|[.+-]\)\+/       contained
syn match   mcAdvancementCriterionNameFilter    /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcFilterEqAdvance
hi def link mcAdvancementCriterionNameFilter    mcAdvanecmentCriterionName

syn keyword mcAdvancementKeyword        grant revoke    contained skipwhite nextgroup=mcDoubleSpace,@mcEntityAdvancement
syn keyword mcAdvancementWhich          everything
syn keyword mcAdvancementWhich          only            contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementNameCriteria
syn keyword mcAdvancementWhich          from through until      contained skipwhite nextgroup=mcDoulbleSpace,mcAdvancementName
hi def link mcAdvancementWhich          mcAdvancementKeyword
hi def link mcAdvancementKeyword        mcKeyword

"hi mcAdvancementNameFilter              ctermfg=1 cterm=bold
"hi mcAdvancementCriterionNameFilter     ctermfg=1
