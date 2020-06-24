hi def link mcError             Error
hi def link mcChatMessage       String
hi def link mcComment           Comment

hi mcCommand            ctermfg=white ctermbg=Darkgrey        cterm=bold
hi mcOp                 ctermfg=grey
hi mcSelector           ctermfg=lightgreen           cterm=bold

hi mcCoordinate         ctermfg=green
hi mcCoordinate2        ctermfg=green             cterm=bold
hi mcCoordinate3        ctermfg=green

hi mcKeyword                                    cterm=bold
hi mcValue              ctermfg=lightblue
hi mcKeyId              ctermfg=yellow      cterm=bold
hi mcId                 ctermfg=yellow

hi mcNBTBracket         ctermfg=grey            cterm=underline guisp=green
hi mcNBTPath            ctermfg=white           cterm=underline guisp=green
hi mcNBTPathDot         ctermfg=grey            cterm=underline guisp=green
hi mcNBTValue           ctermfg=lightblue       cterm=underline guisp=green
hi mcNBTSpace                                   cterm=underline guisp=green

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
"hi mcEntity

"Entities in vanilla MC eg 'wither', 'zombified_piglin'
"hi mcBuiltinEntity      ctermfg=

"Boolean values
"hi mcBool

" Top level execute keywords
"execute as @a positioned as @s store entity @s Health byte 1 run kill @s
"        ^^    ^^^^^^^^^^       ^^^^^                         ^^^
hi mcExecuteKeyword ctermfg=white cterm=bold,italic


" @e[type=zombie]   grass_block[snowy=true]
"    ^^^^                       ^^^^^
"hi mcFilterKeyword

"Tags
"hi mcTag


" @e[type=zombie]   grass_block[snowy=true]
"         ^^^^^^                      ^^^^
"hi mcFilterValue
