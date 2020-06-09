
syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace

syn match   mcNamespace         /\w\+:/ contained contains=mcBuiltinNamespace

syn match   mcChatMessage       /.*/    contained
syn match   mcFunction          /#?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained
syn match   mcWeatherDuration   /\d\{0,6\}/ contained
syn match   mcUInt              /\d\+/  contained
syn match   mcLineEnd           /\s*$/  contained
hi def link mcUInt              mcValue

syn keyword mcGamemode          contained survival creative adventure spectator
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcDifficulty        contained peaceful easy normal hard
syn keyword mcListUUIDs         contained uuids
syn keyword mcBool              contained true false
syn keyword mcWeather           contained clear rain thunder skipwhite nextgroup=mcDoubleSpace,mcWeatherDuration
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue
hi def link mcDifficulty        mcKeyValue
hi def link mcListUUIDs         mcKeyword

"TODO
syn match   mcJSONText          contained /.\+/
hi def link mcJSONText          mcString

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
" (same with /seed but that one was easy so i don't really care)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say schedule scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
hi def link mcHelpCommand       mcKeyValue

" Title
syn keyword mcTitleKeyword      contained actionbar subtitle title skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn keyword mcTitleKeyword      contained clear reset
syn keyword mcTitleKeyword      contained times skipwhite nextgroup=mcDoubleSpace,mcTitleTime
hi def link mcTitleKeyword mcKeyWord
syn match mcTitleTime           /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime2
syn match mcTitleTime2          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime3
syn match mcTitleTime3          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace
hi def link mcTitleTime         mcCoordinate
hi def link mcTitleTime2        mcCoordinate2
hi def link mcTitleTime3        mcCoordinate3


" Enchantment level
syn match   mcEnchantmentLevel  /[0-5]/ contained
" Xp
syn keyword mcXpKeyword add set         contained skipwhite nextgroup=mcDoubleSpace,@mcEntityXpSet
syn keyword mcXpKeyword query           contained skipwhite nextgroup=mcDoubleSpace,@mcEntityXpQuery
syn match   mcXpAmount  /-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn keyword mcXpUnit    points levels   contained
hi def link mcXpAmount  mcValue
hi def link mcXpUnit    mcKeyword
hi def link mcXpKeyword mcKeyword

" Loot
syn keyword mcLootTargetKeyword         spawn insert    contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLoot
syn keyword mcLootTargetKeyword         replace         contained skipwhite nextgroup=mcDoubleSpace,mcLootReplaceKeyword
syn keyword mcLootReplaceKeyword        entity          contained skipwhite nextgroup=mcDoubleSpace,@mcEntityLootReplace
syn keyword mcLootReplaceKeyword        block           contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLootReplace
syn keyword mcLootTargetKeyword         give            contained skipwhite nextgroup=mcDoubleSpace,@mcEntityLoot
syn keyword mcLootSourceKeyword         fish            contained skipwhite nextgroup=mcDoubleSpace,mcLootTableFish
syn keyword mcLootSourceKeyword         loot            contained skipwhite nextgroup=mcDoubleSpace,mcLootTable
syn keyword mcLootSourceKeyword         kill            contained skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcLootSourceKeyword         mine            contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLootMine
hi def link mcLootTargetKeyword         mcKeyword
hi def link mcLootReplaceKeyword        mcKeyword
hi def link mcLootSourceKeyword         mcKeyword
syn match   mcLootCount                 /0*\(6[0-4]\|[1-5]\?\d\|[1-9]\)/        contained skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn keyword mcLootHand                  mainhand offhand                        contained
"TODO x3
syn match   mcLootTable                 /\(\w\|:\)\+/   contained contains=mcNamespace
syn match   mcLootTableFish             /\(\w\|:\)\+/   contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcLootFishingLocation
syn match   mcLootFishingLocation       /\w\+/          contained skipwhite nextgroup=mcDoubleSpace,mcItem,mcLootHand
hi def link mcLootCount                 mcUInt
hi def link mcLootHand                  mcKeyValue
hi def link mcLootTableFish             mcLootTable
hi def link mcLootTable                 mcValue
hi def link mcLootFishingLocation       mcValue

" Item Slot
syn keyword mcItemSlotLoot      slot    contained skipwhite nextgroup=mcDoubleSpace,mcLootCount,mcLootSourceKeyword

" Datapack
syn keyword mcDatapackKeyword           disable                 contained skipwhite nextgroup=mcDoubleSpace,mcDatapackName
syn keyword mcDatapackKeyword           enable                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnable
syn keyword mcDatapackKeyword           list                    contained skipwhite nextgroup=mcDoubleSpace,mcDatapackListKeyword
syn match   mcDatapackName              /\w\+/                  contained
syn match   mcDatapackNameEnable        /\w\+/                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackEnableKeyword
syn match   mcDatapackNameEnableRel     /\w\+/                  contained
syn keyword mcDatapackEnableKeyword     first last              contained
syn keyword mcDatapackEnableKeyword     before after            contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnableRel
syn keyword mcDatapackListKeyword       enabled available       contained
hi def link mcDatapackNameEnable        mcDatapackName
hi def link mcDatapackNameEnableRel     mcDatapackName
hi def link mcDatapackEnableKeyword     mcDatapackKeyword
hi def link mcDatapackListKeyword       mcDatapackKeyword
hi def link mcDatapackKeyword           mcKeyword

" Forceload
syn keyword mcForceloadKeyword          add     contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart
syn keyword mcForceloadKeyword          remove  contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart,mcForceloadRemKeyword
syn keyword mcForceloadKeyword          query   contained skipwhite nextgroup=mcDoubleSpace,mcColumn
syn keyword mcForceloadRemKeyword       all contained
hi def link mcForceloadRemKeyword       mcForceloadKeyword
hi def link mcForceloadKeyword          mcKeyword

" Locate
syn keyword mcLocatable contained Buried_Treasure EndCity Fortress Mansion Mineshaft Monument Ocean_Ruin Shipwreck Stronghold Desert_Pyramid Igloo Jungle_Pyramid Swamp_Hut Village Pillager_Outpost


" Data
syn keyword mcDataKeyword       get     contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordGet
syn keyword mcDataKeyword       merge   contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordMerge
syn keyword mcDataKeyword       modify  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordModify
syn keyword mcDataKeyword       remove  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
syn keyword mcDataKeywordGet    block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataGet
syn keyword mcDataKeywordMerge  block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataMerge
syn keyword mcDataKeywordModify block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataModify
syn keyword mcDataKeywordRemove block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataRemove
syn keyword mcDataKeywordGet    entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataGet
syn keyword mcDataKeywordMerge  entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataMerge
syn keyword mcDataKeywordModify entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataModify
syn keyword mcDataKeywordRemove entity  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityDataRemove
syn match   mcDataGetPad        / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcDataGetScale
syn match   mcDataGetScale      /-\?\d*\.\?\d\+/                contained
hi def link mcDataKeywordGet    mcDataKeyword
hi def link mcDataKeywordModify mcDataKeyword
hi def link mcDataKeywordRemove mcDataKeyword
hi def link mcDataKeywordMerge  mcDataKeyword
hi def link mcDataGetScale      mcValue

" Data modify
syn match   mcDataModifyPad     / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyHow
syn keyword mcDataModifyHow     append merge prepend set        contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource
syn keyword mcDataModifyHow     insert                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyIndex
syn match   mcDataModifyIndex   /\d\+/                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource
syn keyword mcDataModifySource  value                           contained skipwhite nextgroup=mcDoubleSpace,@mcNBTValue
" it just so happens that data modify from ends the same way as data remove!
syn keyword mcDataModifySource  from                            contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
hi def link mcDataModifyHow     mcDataKeyword
hi def link mcDataModifyIndex   mcValue
hi def link mcDataModifySource  mcDataKeyword

" Effect
syn keyword mcEffectKeyword give        contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEffectGive
syn keyword mcEffectKeyword clear       contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEffectClear
syn match   mcEffectSeconds /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectAmp
syn match   mcEffectAmp     /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcBool
hi def link mcEffectSeconds mcValue
hi def link mcEffectAmp     mcValue
hi def link mcEffectKeyword mcKeyword


" Setblock
syn match   mcSetblockPad       / \@=/ contained skipwhite nextgroup=mcDoubleSpace,mcSetBlockMode
syn keyword mcSetblockMode      contained destroy keep replace
hi def link mcSetblockMode      mcKeyword

" Fill
syn match   mcFillPad           / \@=/                          contained skipwhite nextgroup=mcDoubleSpace,mcFillMode
syn keyword mcFillMode          destroy hollow keep outline     contained
syn keyword mcFillMode          replace                         contained skipwhite nextgroup=mcDoubleSpace,mcBlockNameFillReplace
hi def link mcFillMode          mcKeyword

" Clone
syn keyword mcCloneMask         masked replace          contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMask         filtered                contained skipwhite nextgroup=mcDoubleSpace,mcBlockNameClone
syn match   mcClonePad          / \@=/                  contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMode         force move normal       contained
hi def link mcCloneMask         mcKeyword
hi def link mcCloneMode         mcKeyword

