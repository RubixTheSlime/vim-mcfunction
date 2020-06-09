syn cluster mcCommand add=mcCommand

syn keyword mcCommand clear                     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityClear
syn keyword mcCommand clone                     contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneFrom
syn keyword mcCommand data                      contained skipwhite nextgroup=mcDoubleSpace,mcDataKeyword
syn keyword mcCommand defaultgamemode           contained skipwhite nextgroup=mcDoubleSpace,mcGamemode
syn keyword mcCommand difficulty                contained skipwhite nextgroup=mcDoubleSpace,mcDifficulty
syn keyword mcCommand effect                    contained skipwhite nextgroup=mcDoubleSpace,mcEffectKeyword
syn keyword mcCommand enchant                   contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEnchant
syn keyword mcCommand fill                      contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillFrom
syn keyword mcCommand function                  contained skipwhite nextgroup=mcDoubleSpace,mcFunction
syn keyword mcCommand gamemode                  contained skipwhite nextgroup=mcDoubleSpace,mcGamemodeSet
syn keyword mcCommand gamerule                  contained skipwhite nextgroup=mcDoubleSpace,mcGamerule
syn keyword mcCommand give                      contained skipwhite nextgroup=mcDoubleSpace,@mcEntityGive
syn keyword mcCommand help                      contained skipwhite nextgroup=mcDoubleSpace,mcUInt,mcHelpCommand
syn keyword mcCommand kill                      contained skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcCommand list                      contained skipwhite nextgroup=mcDoubleSpace,mcListUUIDs
syn keyword mcCommand msg w tell teammsg tm me  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityMsg
syn keyword mcCommand reload                    contained
syn keyword mcCommand say                       contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage 
syn keyword mcCommand seed                      contained
syn keyword mcCommand setblock                  contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateSetblock
syn keyword mcCommand setworldspawn             contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate
syn keyword mcCommand tp teleport               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate,@mcEntityTpTarget
syn keyword mcCommand xp experience             contained skipwhite nextgroup=mcDoubleSpace,mcXpKeyword
syn keyword mcCommand datapack                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackKeyword
syn keyword mcCommand forceload                 contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword
syn keyword mcCommand locate                    contained skipwhite nextgroup=mcDoubleSpace,mcLocatable
syn keyword mcCommand advancement               contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementKeyword
syn keyword mcCommand bossbar                   contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword
syn keyword mcCommand loot                      contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword
syn keyword mcCommand spawnpoint                contained skipwhite nextgroup=mcDoubleSpace,@mcEntitySpawnPos
syn keyword mcCommand weather                   contained skipwhite nextgroup=mcDoubleSpace,mcWeather
syn keyword mcCommand summon                    contained skipwhite nextgroup=mcDoubleSpace,mcEntityTypeSummon
syn keyword mcCommand title                     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityTitle
