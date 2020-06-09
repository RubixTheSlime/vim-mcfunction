syn keyword mcCommand summon                    contained skipwhite nextgroup=mcDoubleSpace,mcEntityTypeSummon

syn match   mcEntityTypeSummon                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEntity      skipwhite nextgroup=mcDoubleSpace,mcCoordinateSummon
hi def link mcEntityTypeSummon                  mcEntityType
