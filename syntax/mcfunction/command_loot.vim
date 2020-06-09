syn keyword mcCommand loot                      contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword

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
syn keyword mcItemSlotLoot      slot    contained skipwhite nextgroup=mcDoubleSpace,mcLootCount,mcLootSourceKeyword
hi def link mcItemSlotLoot              mcKeyword
