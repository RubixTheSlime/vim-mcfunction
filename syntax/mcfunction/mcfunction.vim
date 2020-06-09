" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry


if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mc"

syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace

syn match   mcNamespace         /\w\+:/ contained contains=mcBuiltinNamespace

syn match   mcUInt              /\d\+/  contained
syn match   mcLineEnd           /\s*$/  contained
hi def link mcUInt              mcValue

syn keyword mcBool              contained true false

"TODO
syn match   mcJSONText          contained /.\+/
hi def link mcJSONText          mcString

" Can't have multiple spaces
syn match mcDoubleSpace / \@<= \+\| \{2,}/ contained containedin=ALLBUT,@mcNBT,mcChatMessage,@mcSelectorFilter
hi def link mcDoubleSpace mcBadWhitespace

" Optional Slash
syn match mcOptionalSlash /^\/\?/ nextgroup=@mcCommand
hi def link mcOptionalSlash mcCommand
syn cluster mcCommand add=mcCommand

" Illegal Whitespace
syn match mcComment /^#.*/
syn match mcBadWhitespace /\t/

" Unimplemented commands
" advancement bossbar clone data* datapack fill forceload locate loot particle playsound recipe replaceitem schedule scoreboard setblock spawnpoint spreadplayers stopsound summon tag team time title trigger weather worldboarder tellraw

syn sync minlines=1
