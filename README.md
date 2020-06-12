# mcfunction-vim-syntax
Vim syntax definitions for mcfunction. Still a work in progress, currently being developed for Minecraft 1.14. Once it is finished, other versions will be released as well. More than just highlights keywords, anything that isn't colored will cause an error.

## Installation

To install using [vim-plug](https://github.com/junegunn/vim-plug), add
```
call plug#begin()

Plug rubixninja314/vim-mcfunction

call plug#end()
```
to your .vimrc

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
- execute
- experience
- fill
- forceload
- function
- gamemode
- gamerule
- give
- help
- kill
- list
- locate
- loot
- me
- msg
- particle
- playsound
- reload
- replaceitem
- say
- scoreboard
- seed
- setblock
- setworldspawn
- spawnpoint
- stopsound
- summon
- teammsg
- teleport
- tell
- tellraw
- title
- tp
- w
- weather
- xp

### Commands partially implemented:

### Commands not yet implemented:
- recipe
- schedule
- spreadplayers
- tag
- team
- time
- trigger
- worldborder


## Final notes
If there's any commands missed, it's likely because I was planning on making it only for single player commands first. Otherwise, please submit an issue if there's any discrepancies. Also, there are plans to add Carpetmod (with Scarpet) and WorldEdit commands after each Minecraft version has a release. I am not certain if any other mods will be implemented (at least by myself).

Don't try to load test.mcfunction as a datapack, I have no idea what chaos will ensue (assuming it even runs, there's intentional errors). If Mojang fixed the bug with commands not handling two spaces in a row this would probably be about half as big.
