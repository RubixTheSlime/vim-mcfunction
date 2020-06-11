hi def link mcBadWhitespace     Error
hi def link mcChatMessage       String
hi def link mcComment           Comment

hi mcCommand            ctermfg=4 cterm=bold
hi mcCoordinate         ctermfg=14
hi mcCoordinate2        ctermfg=11
hi mcCoordinate3        ctermfg=10
hi mcJSONText           ctermfg=3
hi mcKeyValue           ctermfg=11 cterm=bold
hi mcKeyword            cterm=italic
hi mcNBTBracket         ctermfg=2
hi mcNBTPath            ctermfg=6
hi mcNBTPathDot         ctermfg=4
hi mcNBTValue           ctermfg=4
hi mcValue              ctermfg=11

hi def link mcBlockStateBracket         mcSelector
hi def link mcBlockStateEq              mcFilterEq
hi def link mcBlockStateKeyword         mcFilterKeyword
hi def link mcBlockStateValue           mcFilterValue

hi def link mcFilterKeyValue            mcFilterValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterValue               mcValue

hi def link mcNBTIndex                  mcNBTPathDot
hi def link mcNBTPath                   mcKeyValue
hi def link mcNBTPathDot                mcNBTBracket
hi def link mcNBTQuote                  mcNBTPath
hi def link mcNBTString                 mcNBTValue

hi def link mcBuiltin                   mcKeyValue
hi def link mcBuiltinNamespace          mcBuiltin
hi def link mcBuiltinBlock              mcBuiltin
hi def link mcBuiltinDimension          mcBuiltin
hi def link mcBuiltinEffect             mcBuiltin
hi def link mcBuiltinEnchantment        mcBuiltin
hi def link mcBuiltinEntity             mcBuiltin
hi def link mcBuiltinItem               mcBuiltin
