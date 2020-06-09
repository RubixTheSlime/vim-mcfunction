"bools
syn keyword mcGamerule announceAdvancements commandBlockOutput disableElytraMovementCheck disableRaids doDaylightCycle doEntityDrops doMobLoot doMobSpawning doTileDrops doWeatherCycle naturalRegeneration reducedDebugInfo sendCommandFeedback showDeathMessages spectatorsGenerateChunks contained skipwhite nextgroup=mcDoubleSpace,mcBool

"maxCommandChainLength: -999999999-9999999999
"maxEntityCramming: ditto
"spawnRadius: ditto
"randomTickSpeed: 0-4096
syn keyword mcGamerule maxCommandChainLength maxEntityCramming spawnRadius contained skipwhite nextgroup=mcDoubleSpace,mcGameruleNumber
syn keyword mcGamerule randomTickSpeed contained skipwhite nextgroup=mcDoubleSpace,mcRandomTickNumber
syn match mcGameruleNumber /\<-\?\d\{1,10\}\>/ contained skipwhite
syn match mcRandomTickNumber /\<\([1-3]\?\d\{1,3\}\|409[0-6]\|40[0-8]\d\)\>/ contained skipwhite
hi def link mcGamerule mcKeyWord
hi def link mcRandomTickNumber mcGameruleNumber
hi def link mcGameruleNumber mcValue
