syn keyword mcCommand help                      contained skipwhite nextgroup=mcDoubleSpace,mcUInt,mcHelpCommand

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say schedule scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
hi def link mcHelpCommand       mcKeyValue
