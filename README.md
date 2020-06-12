# vim-mcfunction
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
All commands have been implemented as of 1.14. Still missing the (massive) lists of items, blocks, etc. After that, it will need to be updated to 1.16 and it will be ready for release

## Final notes
If there's any commands missed, it's likely because I was planning on making it only for single player commands first. Otherwise, please submit an issue if there's any discrepancies. Also, there are plans to add Carpetmod (with Scarpet) and WorldEdit commands after each Minecraft version has a release. I am not certain if any other mods will be implemented (at least by myself).

Don't try to load test.mcfunction as a datapack, I have no idea what chaos will ensue (assuming it even runs, there's intentional errors). If Mojang fixed the bug with commands not handling two spaces in a row this would probably be about half as big.
