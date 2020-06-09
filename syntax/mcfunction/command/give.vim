syn keyword mcCommand give                      contained skipwhite nextgroup=mcDoubleSpace,@mcEntityGive

syn match   mcItemGive                          /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        nextgroup=mcAnySpace,mcNBTTagGive
hi def link mcItemGive                          mcItem
