# vim-mcfunction
Vim syntax definitions for mcfunction. More than just highlights keywords, anything that isn't colored will cause an error.

## Installation

To install using [vim-plug](https://github.com/junegunn/vim-plug), add
```
call plug#begin('~/.vim/plugged')

Plug 'rubixninja314/vim-mcfunction'

call plug#end()
```
to your .vimrc

Whenever something new is added to the game, it should hopefully not be very long before this gets updated.
However, if you want to have access to parts of the newer version as soon as they're implemented in this plugin, use `Plug 'rubixninja314/vim-mcfunction', {'branch': 'early_access'}` instead.
But most importantly, **BE SURE TO UPDATE THE PLUGIN WITH** `:PlugUpdate` **BEFORE YOU TRY OUT THE LATEST SNAPSHOT.**

This plugin has a handful of settings to tweak how it works, including the ability to change the version of Minecraft that it highlights for.
You can check out these setting in the [wiki](https://github.com/rubixninja314/vim-mcfunction/wiki/Configuration).

## A note about the color scheme
The plugin is still in development, and as such the colors etc. are still subject to change.
The plugin has gone much further than I ever thought it would ever be capable of reaching.
When I first started, the idea that it would be capable of highlighting for any version of Minecraft would have seemed absolutely impossible, but now it's a reality.
So as much as it hurts to say it, the default color scheme will still change, as more functionality gets added.
Some of the recent changes have been setting up to eventually implement what I call deep-nesting highlighting, which would allow commands, NBT, and JSON (and maybe even Scarpet) to highlight much more clearly when nested within each other.
An example of this would be `setblock ~ ~ ~ minecraft:oak_sign{Text1:'{"text":"git gud","clickEvent":{"action":"run_command","value":"give @s netherite_pickaxe{display:{Name:\'\\"Destroyer\\"\'}}"}}'}`, which has JSON inside NBT inside a command inside JSON inside NBT inside a command, all just to place a sign that gives players who click on it a named pickaxe.
As of right now the majority of the command would highlight as NBT, which is honestly not very useful.
Deeply-nesting highlighting would make what this command does much more clear.

## Final Notes / Warnings

As of right now, sounds (used by `/playsound` and `/stopsound`) and recipes (used by `/recipe`) are not fully implemented.
Specifically, some sounds that were not available in older snapshots may still highlight as a false-positive, and only the recipes that happen to share a name with an item will highlight.
As stated earlier, the multiplayer commands may or may not work. To my knowledge they highlight correctly, but I am not sure if they'll actually run.

If you notice any discrepancies, first make sure you're set to the correct Minecraft version, and after that please feel free to submit an issue.
Also, I do hope to someday add Carpetmod (with Scarpet) and WorldEdit commands.
I am not certain if any other mods will be implemented (at least by myself).
