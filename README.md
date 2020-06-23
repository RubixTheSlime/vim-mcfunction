# vim-mcfunction
Vim syntax definitions for mcfunction. More than just highlights keywords, anything that isn't colored will cause an error.

## Installation

To install using [vim-plug](https://github.com/junegunn/vim-plug), add
```
call plug#begin(~/.vim/plugged)

Plug rubixninja314/vim-mcfunction

call plug#end()
```
to your .vimrc

Whenever something new is added to the game, it should hopefully not be very long before this gets updated.
However, if you want to have access to parts of the newer version as soon as they're implemented in this plugin, you can switch branches by navigating to the plugin's directory (typically `~/.vim/plugged/vim-mcfunction` or `~/.config/nvim/plugged/vim-mcfuntion`, not sure where on Windows), and run `git checkout early_access`.
But most importantly, **BE SURE TO UPDATE THE PLUGIN WITH** `:PlugUpdate` **BEFORE YOU TRY OUT THE LATEST SNAPSHOT.**

## Options
### Changing Minecraft versions
This plugin has the amazing ability to change to a different Minecraft version on-the-fly.
Simply run (while in vim) `:let g:mcversion='[version]'`, where `[version]` is the version you want, then reload with `:e` or `:sy on`.
Alternatively, put `let g:mcversion='[version]'` in your .vimrc to set it to that every time.
The options for the version are:
- `latest`: the latest snapshot that has been released, no matter what kind, including experimental snapshots.
- The name of a specific snapshot. Examples include: `18w43a`, `1.14.3p3`, `1.14.3Pre3`, `1.15.2`, `1.16`, `combat4`, `1.16rc1`.
- Any combination of `release`, `candidate` (as in release candidate), `prerelease`, `snapshot`, and `experimental`.
    - Specifying `snapshot` means any snapshot that is of the form `YYwWWn` (eg `18w43b`).
    - `snapshot` and `prerelease` only mean themselves, and do *not* imply any other type.
    - The latest snapshot that is one of the specified types will be chosen.
    - Example: `release candidate prerelease snapshot` will go with the latest main-track snapshot (so will `r c p s`).

By default, the version is `release`.
Versions are not case-sensitive, and keywords follow vim's "only need the first part" standard.
For example, `p`, `Pre`, and `pReReLeAsE` all mean the same thing.


### Colors
Vim has a system to set the highlighting for most languages at once. For example, you can set the highlighting for comments and it will apply to any language whether it's C, Python, Assembly, or (with this plugin) mcfunction.
However, beyond errors, comments, and messages for chat (messages highlight as strings), mcfunction is far too different from other languages to use this feature.
So if you would like to change the color scheme, you will need to navigate to the plugin's directory and edit `./syntax/mcfunctoin/highlight.vim`.
After you do so, make sure to run `git commit -a` so that your changes will be saved upon update (which happens fairly often, in fact weekly during snapshot season).
If you would like to return to the plugin's default highlighting, run `git reset --hard origin/master` (while in the plugin's directory).

### Optimizations
This plugin makes vim take noticeably longer to start up (thankfully only when loading a .mcfunction file), so some parts may be skipped to speed things up. It's recommended you leave these on unless your computer is really slow.
- `g:mcEnableBuiltinIDs` - Minecraft has thousands of builtins including blocks, items, entities, sounds, gamerules, advancements, and *many* more. As such, it can take a moment to load a file as the plugin must read thousands of lines (~1330 as of 1.16, more than half of the entire plugin's syntax definitions) to know what builtins to highlight. Default 1 (Highlight builtins).
- `g:mcEnableBuiltinJSON` - Use the JSON syntax highlighting that comes with vim. If you get some error about json, or you just want it to load like 2% faster, try putting `let g:mcEnableBuiltinJSON=0` in your .vimrc. Default 1 (Use the json highlighting that comes with vim).

### Other options
- `g:mcEnableMP` - Enable multiplayer commands. Don't count on these being perfectly reliable as I have not had any way of testing them. Default 0 (Don't highlight multiplayer commands). You also need to be using 1.14.4-pre4 or higher, and set the [function-permission-level](https://minecraft.gamepedia.com/Server.properties#function-permission-level) to 3 or 4.
- `g:IllegalNames` - Relax the restrictions on player names to allow for [illegal names](https://minecraft.gamepedia.com/Player#Username). Default `none` (Only allow legal names). Can be `none`, `all`, or any combination of:
    - `short` - allow names shorter than 3 characters (recommended if your datapack uses CarpetMod)
    - `long` - allow names longer than 16 characters
    - `symbol` - allow illegal symbols
- `g:mcDebugging` - Enable certain commands for debugging porpoises. Default 0 (Don't debug dolphins).

## Final Notes / Warnings

As of right now, sounds (used by `/playsound` and `/stopsound`) and recipes (used by `/recipe`) are not fully implemented.
Specifically, some sounds that were not available in older snapshots may still highlight as a false-positive, and only the recipes that happen to share a name with an item will highlight.
As stated earlier, the multiplayer commands may or may not work. To my knowledge they highlight correctly, but I am not sure if they'll actually run.

If you notice any discrepancies, first make sure you're set to the correct Minecraft version, and after that please feel free to submit an issue.
Also, I do hope to someday add Carpetmod (with Scarpet) and WorldEdit commands.
I am not certain if any other mods will be implemented (at least by myself).
