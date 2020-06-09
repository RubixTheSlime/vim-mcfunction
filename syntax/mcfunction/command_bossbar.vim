syn keyword mcCommand bossbar                   contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword

syn match   mcBossbarId                 /\(\w\|[:./-]\)\+/      contained contains=mcNamespace
syn match   mcBossbarIdExecuteStore     /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarFeildExecuteStore
syn match   mcBossbarIdAdd              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn match   mcBossbarIdGet              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarGetKeyword
syn match   mcBossbarIdSet              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarSetKeyword
hi def link mcBossbarIdExecuteStore     mcBossbarId
hi def link mcBossbarIdAdd              mcBossbarId
hi def link mcBossbarIdSet              mcBossbarId

syn keyword mcBossbarKeyword    add             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdAdd
syn keyword mcBossbarKeyword    get             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdGet
syn keyword mcBossbarKeyword    list            contained
syn keyword mcBossbarKeyword    remove          contained skipwhite nextgroup=mcDoubleSpace,mcBossbarId
syn keyword mcBossbarKeyword    set             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdSet
syn keyword mcBossbarSetKeyword color           contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetColor  
syn keyword mcBossbarSetKeyword max value       contained skipwhite nextgroup=mcDoubleSpace,mcUInt
syn keyword mcBossbarSetKeyword name            contained skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn keyword mcBossbarSetKeyword players         contained skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcBossbarSetKeyword style           contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetStyle  
syn keyword mcBossbarSetKeyword visible         contained skipwhite nextgroup=mcDoubleSpace,mcBool
syn keyword mcBossbarSetColor   contained blue green pink purple red white yellow
syn keyword mcBossbarSetStyle   contained progress notched_6 notched_10 notched_12 notched_20
syn keyword mcBossbarGetKeyword contained max players value visible
hi def link mcBossbarGetKeyword mcBossbarKeyword
hi def link mcBossbarSetKeyword mcBossbarKeyword
hi def link mcBossbarSetColor   mcKeyValue
hi def link mcBossbarSetStyle   mcKeyValue
hi def link mcBossbarKeyword    mcKeyword

syn keyword mcBossbarFeildExecuteStore  max value                       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcBossbarFeildExecuteStore  mcBossbarFeild
