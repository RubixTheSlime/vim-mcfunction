syn keyword mcCommand effect                    contained skipwhite nextgroup=mcDoubleSpace,mcEffectKeyword

syn match   mcEffectGive                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect      skipwhite nextgroup=mcDoubleSpace,mcEffectSeconds
hi def link mcEffectGive                        mcEffect
syn keyword mcEffectKeyword give        contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEffectGive
syn keyword mcEffectKeyword clear       contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEffectClear
syn match   mcEffectSeconds /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectAmp
syn match   mcEffectAmp     /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcBool
hi def link mcEffectSeconds mcValue
hi def link mcEffectAmp     mcValue
hi def link mcEffectKeyword mcKeyword
