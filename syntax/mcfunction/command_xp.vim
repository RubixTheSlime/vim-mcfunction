syn keyword mcCommand xp experience             contained skipwhite nextgroup=mcDoubleSpace,mcXpKeyword

syn keyword mcXpKeyword add set         contained skipwhite nextgroup=mcDoubleSpace,@mcEntityXpSet
syn keyword mcXpKeyword query           contained skipwhite nextgroup=mcDoubleSpace,@mcEntityXpQuery
syn match   mcXpAmount  /-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn keyword mcXpUnit    points levels   contained
hi def link mcXpAmount  mcValue
hi def link mcXpUnit    mcKeyword
hi def link mcXpKeyword mcKeyword
