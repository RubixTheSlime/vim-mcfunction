" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry


if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mc"

syntax include ftplugin/entities.vim
syntax include ftplugin/coordinate.vim
syntax include ftplugin/nbt.vim
syntax include ftplugin/filter.vim
syntax include ftplugin/execute.vim
syntax include ftplugin/scoreboard.vim
syntax include ftplugin/bossbar.vim
syntax include ftplugin/advancement.vim
syntax include ftplugin/data_values.vim
syntax include ftplugin/builtins.vim
syntax include ftplugin/keywords.vim
syntax include ftplugin/commands.vim
syntax include ftplugin/misc.vim
syntax include ftplugin/highlight.vim

" Unimplemented commands
" advancement bossbar clone data* datapack fill forceload locate loot particle playsound recipe replaceitem schedule scoreboard setblock spawnpoint spreadplayers stopsound summon tag team time title trigger weather worldboarder tellraw

syn sync minlines=1

