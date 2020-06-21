# vim-mcfunction
Vim syntax definitions for mcfunction. More than just highlights keywords, anything that isn't colored will cause an error.

## Installation

To install using [vim-plug](https://github.com/junegunn/vim-plug), add
```
call plug#begin()

Plug rubixninja314/vim-mcfunction

call plug#end()
```
to your .vimrc

Whenever something new is added to the game, it should hopefully not be very long before this gets updated.
However, if you want to have access to parts of the newer version as soon as they're implemented in this plugin, you can switch branches by navigating to the plugin's directory (typically `~/.vim/plugged/vim-mcfunction` or `~/.config/nvim/plugged/vim-mcfuntion`, not sure where on Windows), and run `git checkout early_access`.

## Changing Minecraft versions

This plugin has the amazing ability to change to a different Minecraft version on-the-fly.
Simply run (while in vim) `:let g:mcversion=[version]`, where `[version]` is the version you want, then reload with `:w|e`.
The options for the version are:
- `latest`: the latest snapshot that has been released, no matter what kind, including experimental snapshots.
- The name of a specific snapshot, examples include: `18w43a`, `1.14.3p3`, `1.14.3Pre3`, `1.15.2`, `1.16`, `combat4`
- Any combination of `release`, `prerelease`, `snapshot`, and `experimental`.
    - Specifying `snapshot` means any snapshot that is of the form `YYwWWn` (eg `18w43b`)
    - `snapshot` and `prerelease` only mean themselves, and do *not* imply any other type.
    - The latest snapshot that is one of the specified types will be chosen.
    - Example: `release prerelease snapshot` will go with the latest main-track snapshot

Nothing is case-sensitive, and keywords follow vim's "only need the first part" standard.
For example, `p`, `Pre`, and `pReReLeAsE` all mean the same thing.

## Final Notes

As of right now, sounds (used by `/playsound` and `/stopsound`) and recipes (used by `/recipe`) are not fully implemented.
Specifically, some sounds that were not available in older snapshots may still hightlight as a false-positive, and only the recipes that happen to share a name with an item are present.

If there's any commands missed, or you notice any other discrepancies, please feel free to submit an issue. Also, I do hope to someday add Carpetmod (with Scarpet) and WorldEdit commands. I am not certain if any other mods will be implemented (at least by myself).
