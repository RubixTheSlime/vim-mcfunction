# mcfunction-vim-syntax
Vim syntax definitions for mcfunction. Still a work in progress, currently being developed for Minecraft 1.14. Once it is finished, other versions will be released as well. More than just highlights keywords, anything that isn't colored will cause an error.

## Installation

To install using [vim-plug](https://github.com/junegunn/vim-plug), add
```
call plug#begin()

Plug rubixninja314/vim-mcfunction

call plug#end()
```
to the list

## Current Progress
### Commands implemented:
- advancement
- bossbar
- clear
- clone
- data
- datapack
- defaultgamemode
- difficulty
- effect
- enchant
- experience
- fill
- forceload
- function
- gamemode
- give
- help
- kill
- list
- locate
- me
- msg
- reload
- say
- seed
- setblock
- setworldspawn
- teammsg
- teleport
- tell
- tp
- w
- xp

### Commands partially implemented:
- execute
- gamerule
- loot

### Commands not yet implemented:
- particle
- playsound
- recipe
- replaceitem
- schedule
- scoreboard
- spawnpoint
- spreadplayers
- stopsound
- summon
- tag
- team
- tellraw
- time
- title
- trigger
- weather
- worldborder


## Final notes
If there's any commands missed, it's likely because I was planning on making it only for single player commands first. Otherwise, please submit an issue if there's any discrepancies. Also, there are plans to add Carpetmod (with Scarpet) and WorldEdit commands after each Minecraft version has a release. I am not certain if any other mods will be implemented (at least by myself).

Don't try to load test.mcfunction as a datapack, I have no idea what chaos will ensue (assuming it even runs, there's intentional errors). If Mojang fixed the bug with commands not handling two spaces in a row this would probably be about half as big.
