hi def link mcBadWhitespace     Error
hi def link mcChatMessage       String
hi def link mcComment           Comment

hi mcCommand            ctermfg=DarkBlue        cterm=bold
hi mcOp                 ctermfg=DarkRed
hi mcEntity             ctermfg=Green

hi mcCoordinate         ctermfg=Cyan
hi mcCoordinate2        ctermfg=Yellow
hi mcCoordinate3        ctermfg=Green

hi mcKeyword                                    cterm=italic
hi mcKeyValue           ctermfg=Magenta          cterm=bold
hi mcValue              ctermfg=Magenta

hi mcJSONText           ctermfg=Brown

hi mcNBTBracket         ctermfg=DarkGreen
hi mcNBTPath            ctermfg=DarkCyan
hi mcNBTPathDot         ctermfg=DarkBlue
hi mcNBTValue           ctermfg=DarkBlue

" Other settings you may want to change:
" You cannot set items and block differently as there are many that are
" shared, (eg 'dirt' is both a block and an item). Might come later 
" but not for now.

"Items/Blocks not in vanilla MC eg 'ghead', 'lucky_block'
"hi mcBlock

"Items/Blocks in vanilla MC eg 'apple', 'fire', 'cracked_polished_blackstone_bricks'
"(pls mojang we need infested_cracked_polished_blackstone_brick_slab)
"hi mcBuiltinBlock

"Entities not in vanilla MC eg 'unicorn', 'bullet'
"hi mcEntityType

"Entities in vanilla MC eg 'wither', 'zombified_piglin'
"hi mcBuiltinEntity      ctermfg=

"Boolean values
"hi mcBool

" Top level execute keywords
"execute as @a positioned as @s store entity @s Health byte 1 run kill @s
"        ^^    ^^^^^^^^^^       ^^^^^                         ^^^
"hi mcExecuteKeyword


" @e[type=zombie]   grass_block[snowy=true]
"    ^^^^                       ^^^^^
"hi mcFilterKeyword

"Tags
"hi mcTag


" @e[type=zombie]   grass_block[snowy=true]
"         ^^^^^^                      ^^^^
"hi mcFilterValue
