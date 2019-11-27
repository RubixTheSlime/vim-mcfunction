" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry
" Latest Revision: 12 August 2019

if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mc"

syntax include syntax/mcfunction/entities.vim
syntax include syntax/mcfunction/coordinate.vim
syntax include syntax/mcfunction/nbt.vim
syntax include syntax/mcfunction/filter.vim
syntax include syntax/mcfunction/execute.vim
syntax include syntax/mcfunction/scoreboard.vim
syntax include syntax/mcfunction/bossbar.vim
syntax include syntax/mcfunction/advancement.vim
syntax include syntax/mcfunction/data_values.vim
syntax include syntax/mcfunction/builtins.vim
syntax include syntax/mcfunction/keywords.vim
syntax include syntax/mcfunction/commands.vim
syntax include syntax/mcfunction/misc.vim
syntax include syntax/mcfunction/highlight.vim

" Unimplemented commands
" advancement bossbar clone data* datapack fill forceload locate loot particle playsound recipe replaceitem schedule scoreboard setblock spawnpoint spreadplayers stopsound summon tag team time title trigger weather worldboarder tellraw

syn sync minlines=1

