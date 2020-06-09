syn keyword mcCommand clear                     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityClear

syn match   mcItemClear                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        skipwhite nextgroup=mcDoubleSpace,mcUInt
hi def link mcItemClear                         mcItem
