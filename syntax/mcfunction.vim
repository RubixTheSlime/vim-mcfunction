" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry


if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mc"

" Unimplemented commands
" advancement bossbar clone data* datapack fill forceload locate loot particle playsound recipe replaceitem schedule scoreboard setblock spawnpoint spreadplayers stopsound summon tag team time title trigger weather worldboarder tellraw

syn sync minlines=1

syn match   mcAdvancementName                   /\(\w\|[/:]\)\+/        contained
syn match   mcAdvancementNameFilter             /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcFilterEqAdvance
syn match   mcAdvancementNameCriteria           /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementCriterionName
hi def link mcAdvancementNameFilter     mcAdvancementName
hi def link mcAdvancementNameCriteria   mcAdvancementName

syn match   mcAdvancementCriterionName          /\(\w\|[.+-]\)\+/       contained
syn match   mcAdvancementCriterionNameFilter    /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcFilterEqAdvance
hi def link mcAdvancementCriterionNameFilter    mcAdvanecmentCriterionName

syn keyword mcAdvancementKeyword        grant revoke    contained skipwhite nextgroup=mcDoubleSpace,@mcEntityAdvancement
syn keyword mcAdvancementWhich          everything
syn keyword mcAdvancementWhich          only            contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementNameCriteria
syn keyword mcAdvancementWhich          from through until      contained skipwhite nextgroup=mcDoulbleSpace,mcAdvancementName
hi def link mcAdvancementWhich          mcAdvancementKeyword
hi def link mcAdvancementKeyword        mcKeyword

"hi mcAdvancementNameFilter              ctermfg=1 cterm=bold
"hi mcAdvancementCriterionNameFilter     ctermfg=1
syn match   mcBossbarId                 /\(\w\|[:./-]\)\+/      contained contains=mcNamespace
syn match   mcBossbarIdExecuteStore     /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarFeildExecuteStore
syn match   mcBossbarIdAdd              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn match   mcBossbarIdGet              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarGetKeyword
syn match   mcBossbarIdSet              /\(\w\|[:./-]\)\+/      contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarSetKeyword
hi def link mcBossbarIdExecuteStore     mcBossbarId
hi def link mcBossbarIdAdd              mcBossbarId
hi def link mcBossbarIdSet              mcBossbarId

syn keyword mcBossbarKeyword    add             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdAdd
syn keyword mcBossbarKeyword    get             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdGet
syn keyword mcBossbarKeyword    list            contained
syn keyword mcBossbarKeyword    remove          contained skipwhite nextgroup=mcDoubleSpace,mcBossbarId
syn keyword mcBossbarKeyword    set             contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdSet
syn keyword mcBossbarSetKeyword color           contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetColor  
syn keyword mcBossbarSetKeyword max value       contained skipwhite nextgroup=mcDoubleSpace,mcUInt
syn keyword mcBossbarSetKeyword name            contained skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn keyword mcBossbarSetKeyword players         contained skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcBossbarSetKeyword style           contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetStyle  
syn keyword mcBossbarSetKeyword visible         contained skipwhite nextgroup=mcDoubleSpace,mcBool
syn keyword mcBossbarSetColor   contained blue green pink purple red white yellow
syn keyword mcBossbarSetStyle   contained progress notched_6 notched_10 notched_12 notched_20
syn keyword mcBossbarGetKeyword contained max players value visible
hi def link mcBossbarGetKeyword mcBossbarKeyword
hi def link mcBossbarSetKeyword mcBossbarKeyword
hi def link mcBossbarSetColor   mcKeyValue
hi def link mcBossbarSetStyle   mcKeyValue
hi def link mcBossbarKeyword    mcKeyword

syn keyword mcBossbarFeildExecuteStore  max value                       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcBossbarFeildExecuteStore  mcBossbarFeild
" Namespace
"syn match mcBuiltinNamespace contained /minecraft:/

" Blocks
syn keyword mcBuiltinBlock contained dirt

" Dimensions
syn keyword mcBuiltinDimension contained overworld the_nether the_end

" Enchantments
syn keyword mcBuiltinEnchantment contained aqua_affinity bane_of_arthropods binding_curse blast_protection channeling depth_strider efficiency feather_falling fire_aspect fire_protection flame fortune frost_walker impaling infinity knockback looting loyalty luck_of_the_sea lure mending multishot piercing power projectile_protection protection punch quick_charge respiration riptide sharpness silk_touch smite sweeping thorns unbreaking vanishing_curse

" Entities
syn keyword mcBuiltinEntity contained blaze cave_spider creeper drowned elder_guardian enderman endermite evoker ghast giant guardian husk illusioner magma_cube phantom pillager pufferfish ravager shulker silverfish skeleton slime spider stray vex vindicator witch wither_skeleton zombie zombie_pigman zombie_villager
syn keyword mcBuiltinEntity contained bat cat chicken cod cow dolphin donkey fox horse llama mooshroom mule ocelot panda parrot pig polar_bear rabbit salmon sheep skeleton_horse squid trader_llama tropical_fish turtle villager wandering_trader wolf zombie_horse
syn keyword mcBuiltinEntity contained iron_golem snow_golem wither ender_dragon
syn keyword mcBuiltinEntity contained area_effect_cloud armor_stand end_crystal evoker_fangs item_frame leash_knot painting
syn keyword mcBuiltinEntity contained arrow dragon_fireball egg ender_pearl experience_bottle eye_of_ender fireball firework_rocket llama_spit potion shulker_bullet small_fireball snowball spectral_arrow trident wither_skull
syn keyword mcBuiltinEntity contained boat chest_minecart furnace_minecart command_block_minecart hopper_minecart minecart spawner_minecart tnt_minecart
syn keyword mcBuiltinEntity contained falling_block tnt experience_orb item

" Effects
syn keyword mcBuiltinEffect contained absorption bad_omen blindness conduit_power dolphins_grace fire_resistance glowing haste health_boost hero_of_the_village hunger instant_health instant_damage invisibility jump_boost levitation luck mining_fatigue nausea night_vision poison regeneration resistance saturation slow_falling slowness speed strength unluck water_breathing weakness wither

" Items
syn keyword mcBuiltinItem contianed bread apple

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
" Coordinate
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
syn match mcCoordinate                          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcCoordinateCloneDest                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCloneMask
syn match mcCoordinateCloneFrom                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneTo
syn match mcCoordinateCloneTo                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneDest
syn match mcCoordinateDataGet                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn match mcCoordinateDataMerge                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn match mcCoordinateDataModify                contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn match mcCoordinateDataRemove                contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn match mcCoordinateExecute                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match mcCoordinateExecuteCondBlock          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameExecute
syn match mcCoordinateExecuteCondData           contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn match mcCoordinateExecuteCondDest           contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteCondBlocksMask
syn match mcCoordinateExecuteCondEnd            contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondDest
syn match mcCoordinateExecuteCondStart          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondEnd
syn match mcCoordinateExecuteStoreBlock         contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn match mcCoordinateFillFrom                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillTo
syn match mcCoordinateFillTo                    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameFill
syn match mcCoordinateLoot                      contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn match mcCoordinateLootMine                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingKeyword,mcItem,mcLootHand
syn match mcCoordinateLootReplace               contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn match mcCoordinateSetblock                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameSetblock
syn match mcCoordinateTp                        contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingKeyword,mcRotation
hi def link mcCoordinateCloneDest               mcCoordinate3
hi def link mcCoordinateCloneFrom               mcCoordinate
hi def link mcCoordinateCloneTo                 mcCoordinate2
hi def link mcCoordinateDataGet                 mcCoordinate
hi def link mcCoordinateDataMerge               mcCoordinate
hi def link mcCoordinateDataModify              mcCoordinate
hi def link mcCoordinateDataRemove              mcCoordinate
hi def link mcCoordinateExecute                 mcCoordinate
hi def link mcCoordinateExecuteCondBlock        mcCoordinate
hi def link mcCoordinateExecuteCondDest         mcCoordinate3
hi def link mcCoordinateExecuteCondEnd          mcCoordinate2
hi def link mcCoordinateExecuteCondStart        mcCoordinate
hi def link mcCoordinateExecuteStoreBlock       mcCoordinate
hi def link mcCoordinateFillFrom                mcCoordinate
hi def link mcCoordinateFillTo                  mcCoordinate2
hi def link mcCoordinateLoot                    mcCoordinate
hi def link mcCoordinateLootMine                mcCoordinate
hi def link mcCoordinateLootReplace             mcCoordinate
hi def link mcCoordinateSetblock                mcCoordinate
hi def link mcCoordinateTp                      mcCoordinate

" Column
" Same as Coordinate, but 2
syn match   mcColumn                    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
syn match   mcColumnForceloadStart      contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadEnd
syn match   mcColumnForceloadEnd        contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
hi def link mcColumnForceloadStart      mcColumn
hi def link mcColumnForceloadEnd        mcColumn2


" Rotation
" Same as Column, but no caret allowed
syn match mcRotation                    contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/
syn match mcRotationExecute             contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/        skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
" Data Values
syn match   mcBlockName                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock
syn match   mcBlockNameExecute                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock       skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcBlockNameSetblock                 /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateSetblock,mcNBTTagSetblock,mcSetblockPad
syn match   mcBlockNameFill                     /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFill,mcNBTTagFill,mcFillPad
syn match   mcBlockNameFillReplace              /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFillReplace,mcNBTTagFillReplace
syn match   mcBlockNameClone                    /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateClone,mcNBTTagClone,mcClonePad
syn match   mcDimensionExecute                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinDimension   skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcEffect                            /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect
syn match   mcEffectGive                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect      skipwhite nextgroup=mcDoubleSpace,mcEffectSeconds
syn match   mcEnchantment                       /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEnchantment skipwhite nextgroup=mcDoubleSpace,mcEnchantmentLevel
syn match   mcEntityType                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEntity
syn match   mcItem                              /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem
syn match   mcItemGive                          /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        nextgroup=mcAnySpace,mcNBTTagGive
syn match   mcItemClear                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        skipwhite nextgroup=mcDoubleSpace,mcUInt
" Data Value Instance Links
hi def link mcBlockNameSetblock                 mcBlockName
hi def link mcBlockNameFill                     mcBlockName
hi def link mcBlockNameFillReplace              mcBlockName
hi def link mcBlockNameClone                    mcBlockName
hi def link mcBlockNameExecute                  mcBlockName
hi def link mcItemGive                          mcItem
hi def link mcItemClear                         mcItem
hi def link mcEffectGive                        mcEffect

" Block States
syn region  mcBlockState                matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained skipwhite contains=mcBlockStateKeyword
syn region  mcBlockStateSetblock        matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagSetblock,mcSetblockPad
syn region  mcBlockStateFill            matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFill,mcFillPad
syn region  mcBlockStateFillReplace     matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFillReplace,mcFillReplacePad
syn region  mcBlockStateClone           matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagClone,mcClonePad
" keywords
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqUI          age bites delay distance eggs hatch layers level moisture note pickles power rotation stage
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqBool        attached bottom conditional disarmed down drag enabled extended eye hanging has_book has_bottle_0 has_bottle_1 has_bottle_2 has_record in_wall inverted lit locked note occupied open persistent powered short signal_fire snowy triggered unstable up waterlogged
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqAttachment  attachment
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqAxis        axis
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqCardinal    north east south west
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqFace        face
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqFacing      facing
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqHalf        half
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqHinge       hinge
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqInstrument  instrument
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqLeaves      leaves
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqMode        mode
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqPart        part
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqShape       shape
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqType        type
" ...=...
syn match   mcBlockStateEqUI            contained skipwhite nextgroup=mcBlockStateValueUI               /=/
syn match   mcBlockStateEqBool          contained skipwhite nextgroup=mcBlockStateValueBool             /=/
syn match   mcBlockStateEqAttachment    contained skipwhite nextgroup=mcBlockStateValueAttachment       /=/
syn match   mcBlockStateEqAxis          contained skipwhite nextgroup=mcBlockStateValueAxis             /=/
syn match   mcBlockStateEqCardinal      contained skipwhite nextgroup=mcBlockStateValueCardinal         /=/
syn match   mcBlockStateEqFace          contained skipwhite nextgroup=mcBlockStateValueFace             /=/
syn match   mcBlockStateEqFacing        contained skipwhite nextgroup=mcBlockStateValueFacing           /=/
syn match   mcBlockStateEqHalf          contained skipwhite nextgroup=mcBlockStateValueHalf             /=/
syn match   mcBlockStateEqHinge         contained skipwhite nextgroup=mcBlockStateValueHinge            /=/
syn match   mcBlockStateEqInstrument    contained skipwhite nextgroup=mcBlockStateValueInstrument       /=/
syn match   mcBlockStateEqLeaves        contained skipwhite nextgroup=mcBlockStateValueLeaves           /=/
syn match   mcBlockStateEqMode          contained skipwhite nextgroup=mcBlockStateValueMode             /=/
syn match   mcBlockStateEqPart          contained skipwhite nextgroup=mcBlockStateValuePart             /=/
syn match   mcBlockStateEqShape         contained skipwhite nextgroup=mcBlockStateValueShape            /=/
syn match   mcBlockStateEqType          contained skipwhite nextgroup=mcBlockStateValueType             /=/
" values
syn match   mcBlockStateValueUI         contained skipwhite     /\d\+/
syn match   mcBlockStateValueShape      contained skipwhite     /ascending_\(north\|east\|south\|west\)\|east_west\|north_south\|\(inner\|outer\)_\(left\|right\)\|\(nort\|south\)_\(east\|west\)\|straight/
syn keyword mcBlockStateValueBool       contained skipwhite     true false
syn keyword mcBlockStateValueAttachment contained skipwhite     ceiling double_wall floor single_wall
syn keyword mcBlockStateValueAxis       contained skipwhite     x y z
syn keyword mcBlockStateValueCardinal   contained skipwhite     true false none syde up
syn keyword mcBlockStateValueFace       contained skipwhite     ceiling floor wall
syn keyword mcBlockStateValueFacing     contained skipwhite     up down north east south west
syn keyword mcBlockStateValueHalf       contained skipwhite     lower upper bottom top
syn keyword mcBlockStateValueHinge      contained skipwhite     left right
syn keyword mcBlockStateValueInstrument contained skipwhite     basedrum bass bell chime flute guitar harp hat snare xylophone
syn keyword mcBlockStateValueLeaves     contained skipwhite     large none small
syn keyword mcBlockStateValueMode       contained skipwhite     compare subtract corner data load save
syn keyword mcBlockStateValuePart       contained skipwhite     foot head
syn keyword mcBlockStateValueType       contained skipwhite     normal sticky left right single bottom double top
" Block State Links
hi def link mcBlockStateEqUI            mcBlockStateEq
hi def link mcBlockStateEqBool          mcBlockStateEq
hi def link mcBlockStateEqAttachment    mcBlockStateEq
hi def link mcBlockStateEqAxis          mcBlockStateEq
hi def link mcBlockStateEqCardinal      mcBlockStateEq
hi def link mcBlockStateEqFace          mcBlockStateEq
hi def link mcBlockStateEqFacing        mcBlockStateEq
hi def link mcBlockStateEqHalf          mcBlockStateEq
hi def link mcBlockStateEqHinge         mcBlockStateEq
hi def link mcBlockStateEqInstrument    mcBlockStateEq
hi def link mcBlockStateEqLeaves        mcBlockStateEq
hi def link mcBlockStateEqMode          mcBlockStateEq
hi def link mcBlockStateEqPart          mcBlockStateEq
hi def link mcBlockStateEqShape         mcBlockStateEq
hi def link mcBlockStateEqType          mcBlockStateEq

hi def link mcBlockStateValueUI         mcBlockStateValue
hi def link mcBlockStateValueBool       mcBlockStateValue
hi def link mcBlockStateValueAttachment mcBlockStateValue
hi def link mcBlockStateValueAxis       mcBlockStateValue
hi def link mcBlockStateValueCardinal   mcBlockStateValue
hi def link mcBlockStateValueFace       mcBlockStateValue
hi def link mcBlockStateValueFacing     mcBlockStateValue
hi def link mcBlockStateValueHalf       mcBlockStateValue
hi def link mcBlockStateValueHinge      mcBlockStateValue
hi def link mcBlockStateValueInstrument mcBlockStateValue
hi def link mcBlockStateValueLeaves     mcBlockStateValue
hi def link mcBlockStateValueMode       mcBlockStateValue
hi def link mcBlockStateValuePart       mcBlockStateValue
hi def link mcBlockStateValueShape      mcBlockStateValue
hi def link mcBlockStateValueType       mcBlockStateValue
" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry
" Latest Revision: 14 August 2019

" Entity file
" - link Player names, selectors, and UUIDs to their respective universal
"   counterparts
" - cluster player names, selectors, and UUIDs into entities
" - match each group

for type in ["Advancment","Clear","DataGet","DataMerge","DataModify","DataRemove","EffectClear","EffectGive","Enchant","Execute","ExecuteCond","ExecuteCondData","ExecuteCondScoreSource","ExecuteCondScoreTarget","ExecuteFacing","ExecuteStore","Give","Loot","LootReplace","Msg","TpFacing","TpTarget","XpQuery","XpSet"]
        execute 'hi def link mcPlayerName'.type 'mcPlayerName'
        execute 'hi def link mcSelector'.type 'mcSelector'
        execute 'hi def link mcUUID'.type 'mcUUID'
endfor

synt cluster mcFilter add=mcSelectorFilter,mcSelectorFilterEnchant,mcSelectorFilterExecute,mcSelectorFacingFilterExecute,mcSelectorFilterExecuteStore,mcSelectorFilterExecuteStoreScore,msSelectorFilterMsg,mcSelectorFilterTpFacing
" TODO store if unless
" Keywords
syn keyword mcExecuteKeyword                    align           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAlignValue
syn keyword mcExecuteKeyword                    anchored        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn keyword mcExecuteAsKeyword                  as              contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecute
syn keyword mcExecuteKeyword                    at              contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecute
syn keyword mcExecuteFacingKeyword              facing          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate
syn keyword mcExecuteFacingEntityKeyword        entity          contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteFacing
syn keyword mcExecuteKeyword                    in              contained skipwhite nextgroup=mcDoubleSpace,mcDimensionExecute
syn keyword mcExecuteKeyword                    positioned      contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecute,mcExecuteAsKeyword
syn keyword mcExecuteKeyword                    rotated         contained skipwhite nextgroup=mcDoubleSpace,mcRotationExecute,mcExecuteAsKeyword
syn keyword mcExecuteKeyword                    store           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhat
syn keyword mcExecuteKeyword                    if unless       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCond
syn keyword mcExecuteKeyword                    run             contained skipwhite nextgroup=mcDoubleSpace,mcCommand
hi def link mcExecuteAsKeyword                  mcExecuteKeyword
hi def link mcExecuteFacingKeyword              mcExecuteKeyword
hi def link mcExecuteFacingEntityKeyword        mcExecuteKeyword
syn cluster mcExecuteKeyword contains=mcExecuteKeyword,mcExecuteAsKeyword,mcExecuteFacingKeyword

" Values for align, anchored, and in
syn match   mcExecuteAlignValue         contained /\<\(x\([^ x]*x\)\@!\|y\([^ y]*y\)\@!\|z\([^ z]*z\)\@!\)\{1,3\}\>/    skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteAnchoredValue      contained eyes feet                                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteInValueRaw         contained overworld the_nether the_end                                          skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn keyword mcExecuteCondBlocksMask     contained all masked                                                            skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteAlignValue         mcExecuteKeyValue
hi def link mcExecuteAnchoredValue      mcExecuteKeyValue
hi def link mcExecuteInValueRaw         mcExecuteKeyValue
hi def link mcExecuteCondBlocksMask     mcExecuteKeyValue

" Store
syn keyword mcExecuteStoreWhat  result success  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhere
syn keyword mcExecuteStoreWhere block           contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteStoreBlock
syn keyword mcExecuteStoreWhere bossbar         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdExecuteStore
syn keyword mcExecuteStoreWhere entity          contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteStore
syn keyword mcExecuteStoreWhere score           contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteStoreScore
syn keyword mcExecuteStoreType  byte short int long float double        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreScale
syn match   mcExecuteStoreTypePad       / \@=/  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreType
syn match   mcExecuteStoreScale /-\?\d*\.\?\d\+/                        contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteStoreWhat  mcExecuteKeyword
hi def link mcExecuteStoreWhere mcExecuteKeyword
hi def link mcExecuteStoreType  mcExecuteKeyValue
hi def link mcExecuteStoreScale mcExecuteValue

" Condition
syn keyword mcExecuteCond               block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondBlock
syn keyword mcExecuteCond               blocks                  contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondStart
syn keyword mcExecuteCond               data                    contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCondData
syn keyword mcExecuteCond               entity                  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCond
syn keyword mcExecuteCond               score                   contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondScoreTarget
syn keyword mcExecuteCondData           block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondData
syn keyword mcExecuteCondData           entity                  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondData
syn match   mcExecutePad                / \@=/                  contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteCondScoreOp        /[<>=]\@=[<>]\?=\?/     contained skipwhite nextgroup=mcDoubleSpace,@mcEntityExecuteCondScoreSource
syn keyword mcExecuteCondScoreMatch     matches                 contained skipwhite nextgroup=mcDoubleSpace,mcExecuteIR1,mcExecuteIR2
syn match   mcExecuteIR1                /-\?\d\+/               contained skipwhite nextgroup=mcDoubleSpace,mcExecuteRangeInf,mcExecuteIR2,@mcExecuteKeyword
syn match   mcExecuteIR2                / \@!\.\.-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteRangeInf           /\.\.\_[ ]/             contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcExecuteIR1                mcExecuteValue
hi def link mcExecuteIR2                mcExecuteValue
hi def link mcExecuteRangeInf           mcExecuteValue
hi def link mcExecuteCond               mcExecuteKeyword
hi def link mcExecuteCondData           mcExecuteKeyword
hi def link mcExecuteCondScoreOp        mcExecuteKeyword
hi def link mcExecuteCondScoreMatch     mcExecuteKeyword

syn match mcExecuteInValuePrefix /minecraft:/ contained skipwhite nextgroup=mcAnySpace,mcExecuteInValueRaw
hi def link mcExecuteInValuePrefix mcExecuteInValueRaw
syn cluster mcExecuteInValue contains=mcExecuteInValueRaw,mcExecuteInValuePrefix

syn keyword mcExecuteCommand execute contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn cluster mcCommand add=mcExecuteCommand

syn match   mcFilterComma       contained /,/
" Keywords
syn keyword mcFilterKeyword     contained x y z dx dy dz        skipwhite nextgroup=mcFilterEqF
syn keyword mcFilterKeyword     contained x_rotation            skipwhite nextgroup=mcFilterEqXR
syn keyword mcFilterKeyword     contained y_rotation            skipwhite nextgroup=mcFilterEqYR
syn keyword mcFilterKeyword     contained distance              skipwhite nextgroup=mcFilterEqUFR
syn keyword mcFilterKeyword     contained limit                 skipwhite nextgroup=mcFilterEqUI
syn keyword mcFilterKeyword     contained level                 skipwhite nextgroup=mcFilterEqUIR
syn keyword mcFilterKeyword     contained nbt                   skipwhite nextgroup=mcFilterEqNBT
syn keyword mcFilterKeyword     contained sort                  skipwhite nextgroup=mcFilterEqSort
syn keyword mcFilterKeyword     contained gamemode              skipwhite nextgroup=mcFilterEqGamemode
syn keyword mcFilterKeyword     contained team                  skipwhite nextgroup=mcFilterEqTeam
syn keyword mcFilterKeyword     contained name                  skipwhite nextgroup=mcFilterEqName
syn keyword mcFilterKeyword     contained tag                   skipwhite nextgroup=mcFilterEqTag
syn keyword mcFilterKeyword     contained type                  skipwhite nextgroup=mcFilterEqType
syn keyword mcFilterKeyword     contained scores                skipwhite nextgroup=mcFilterEqScores
syn keyword mcFilterKeyword     contained advancements          skipwhite nextgroup=mcFilterEqAdvances

" ... = ...
syn match   mcFilterEqGamemode  contained /=/    skipwhite nextgroup=mcGamemode
syn match   mcFilterEqNBT       contained /=/    skipwhite nextgroup=mcNBTTag
syn match   mcFilterEqTag       contained /=/    skipwhite nextgroup=mcFilterTag
syn match   mcFilterEqSort      contained /=/    skipwhite nextgroup=mcFilterSort
syn match   mcFilterEqScores    contained /=/    skipwhite nextgroup=mcFilterScores
syn match   mcFilterEqAdvances  contained /=/    skipwhite nextgroup=mcFilterAdvancements
syn match   mcFilterEqScore     contained /=/    skipwhite nextgroup=mcFilterIR1,mcFilterIR2
syn match   mcFilterEqAdvance   contained /=/    skipwhite nextgroup=mcFilterAdvancementCriterion,mcBool
syn match   mcFilterEqName      contained /=!\?/ skipwhite nextgroup=mcPlayerName
syn match   mcFilterEqTeam      contained /=!\?/ skipwhite nextgroup=mcTeamName
syn match   mcFilterEqType      contained /=!\?/ skipwhite nextgroup=mcEntityType
syn match   mcFilterEqTag       contained /=!\?/ skipwhite nextgroup=mcTagName
syn match   mcFilterEqF         contained /=/    skipwhite nextgroup=mcFilterF
syn match   mcFilterEqUI        contained /=/    skipwhite nextgroup=mcFilterUI
syn match   mcFilterEqUFR       contained /=/    skipwhite nextgroup=mcFilterUFR1,mcFilterUFR2
syn match   mcFilterEqXR        contained /=/    skipwhite nextgroup=mcFilterXR1,mcFilterXR2
syn match   mcFilterEqYR        contained /=/    skipwhite nextgroup=mcFilterYR1,mcFilterYR2

" Key Values
syn keyword mcFilterSort        contained nearest furthest random arbitrary

" Values
syn match   mcFilterUI          contained /\d\+/
syn match   mcFilterF           contained /-\?\d*\.\?\d\+/

" Ranges
syn match   mcFilterIR1         contained /-\?\d\+/                                                                        nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterIR2
syn match   mcFilterUIR1        contained /\d\+/                                                                           nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterUIR2
syn match   mcFilterUFR1        contained /-\?\d*\.\?\d\+/                                                                 nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterUFR2
syn match   mcFilterXR1         contained /-\?90\(\.0\+\)\?\|-\?[0-8]\?\d\(\.\d\+\)\?\|-\?\.\d\+/                          nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterXR2
syn match   mcFilterYR1         contained /-\?180\(\.0\+\)\?\|-\?1[0-7]\d\(\.\d\+\)\?\|-\?\d\?\d\(\.\d\+\)\?\|-\?\.\d\+/   nextgroup=mcAnySpace,mcFilterRangeInf,mcFilterYR2
syn match   mcFilterIR2         contained /\.\.-\?\d\+/
syn match   mcFilterUIR2        contained /\.\.\d\+/
syn match   mcFilterUFR2        contained /\.\.-\?\d*\.\?\d\+/
syn match   mcFilterXR2         contained /\.\.\(90\(\.0\+\)\?\|-\?[0-8]\?\d\(\.\d\+\)\?\|-\?\.\d\+\)/
syn match   mcFilterYR2         contained /\.\.\(-\?180\(\.0\+\)\?\|-\?1[0-7]\d\(\.\d\+\)\?\|-\?\d\?\d\(\.\d\+\)\?\|-\?\.\d\+\)/
syn match   mcFilterRangeInf    contained /\.\.\s*\_[,\]]\@=/

" Lists
syn region  mcFilterScores                      matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcObjectiveNameFilter
syn region  mcFilterAdvancements                matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementNameFilter
syn region  mcFilterAdvancementCriterion        matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementCriterionNameFilter


" Links
hi def link mcFilterComma               mcFilterEq
hi def link mcFilterSort                mcKeyValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterEq                  mcSelector
hi def link mcFilterRange               mcFilterValue
hi def link mcFilterValue               mcValue

hi def link mcFilterEqGamemode          mcFilterEq
hi def link mcFilterEqNBT               mcFilterEq
hi def link mcFilterEqTag               mcFilterEq
hi def link mcFilterEqSort              mcFilterEq
hi def link mcFilterEqScores            mcFilterEq
hi def link mcFilterEqAdvances          mcFilterEq
hi def link mcFilterEqScore             mcFilterEq
hi def link mcFilterEqAdvance           mcFilterEq
hi def link mcFilterEqName              mcFilterEq
hi def link mcFilterEqTeam              mcFilterEq
hi def link mcFilterEqType              mcFilterEq
hi def link mcFilterEqTag               mcFilterEq
hi def link mcFilterEqF                 mcFilterEq
hi def link mcFilterEqUI                mcFilterEq
hi def link mcFilterEqUFR               mcFilterEq
hi def link mcFilterEqXR                mcFilterEq
hi def link mcFilterEqYR                mcFilterEq

hi def link mcFilterUI                  mcFilterValue
hi def link mcFilterF                   mcFilterValue

hi def link mcFilterIR1                 mcFilterRange
hi def link mcFilterUIR1                mcFilterRange
hi def link mcFilterUFR1                mcFilterRange
hi def link mcFilterXR1                 mcFilterRange
hi def link mcFilterYR1                 mcFilterRange
hi def link mcFilterIR2                 mcFilterRange
hi def link mcFilterUIR2                mcFilterRange
hi def link mcFilterUFR2                mcFilterRange
hi def link mcFilterXR2                 mcFilterRange
hi def link mcFilterYR2                 mcFilterRange
hi def link mcFilterRangeInf            mcFilterRange


hi mcCommand ctermfg=4 cterm=bold
"hi mcExecuteCommand ctermfg=1 cterm=bold

hi def link mcBadWhitespace     Error
hi def link mcChatMessage       String
hi def link mcCommand           Statement
hi def link mcComment           Comment
hi def link mcCoordinate        Constant
hi def link mcKeyword           Keyword
hi def link mcSelector          Type
hi def link mcValue             Constant
hi def link mcNBTBracket        Operator
hi def link mcBool              Boolean
hi def link mcNamespace         Keyword
"hi def link mcNBTString         String
hi mcKeyValue           ctermfg=5 cterm=bold
hi mcNBTPath            ctermfg=6
hi mcNBTBracket         ctermfg=2
hi mcNBTPathDot         ctermfg=4
hi mcNBTValue           ctermfg=6 cterm=bold


hi def link mcBlockStateBracket         mcSelector
hi def link mcBlockStateEq              mcFilterEq
hi def link mcBlockStateKeyword         mcFilterKeyword
hi def link mcBlockStateValue           mcFilterValue
hi def link mcBossbarFeild              mcKeyValue
hi def link mcBossbarId                 mcValue
hi def link mcCoordinate2               mcCoordinate
hi def link mcCoordinate3               mcCoordinate
hi def link mcDataKeyword               mcKeyword
hi def link mcEnchantmentLevel          mcValue
hi def link mcExecuteCommand            mcCommand
hi def link mcExecuteKeyValue           mcKeyValue
hi def link mcExecuteKeyword            mcKeyword
hi def link mcExecuteRun                mcExecuteKeyword
hi def link mcExecuteValue              mcValue
hi def link mcFilterKeyValue            mcFilterValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterValue               mcValue
hi def link mcKeyValue                  mcValue
hi def link mcNBTIndex                  mcNBTPathDot
hi def link mcNBTPath                   mcKeyValue
hi def link mcNBTPathDot                mcNBTBracket
hi def link mcNBTQuote                  mcNBTPath
hi def link mcNBTString                 mcNBTValue
hi def link mcObjectiveName             mcValue
hi def link mcPlayerName                mcSelector
hi def link mcRotation                  mcCoordinate
hi def link mcUUID                      mcSelector
hi def link mcDatapackName              mcValue
hi def link mcColumn                    mcCoordinate
hi def link mcColumn2                   mcColumn
hi def link mcLocatable                 mcKeyValue
hi def link mcAdvancementName           mcValue
hi def link mcAdvancementCriterionName  mcValue

hi def link mcDataValue                 mcValue
hi def link mcBuiltin                   mcKeyValue
hi def link mcBlockName                 mcDataValue
hi def link mcDimension                 mcDataValue
hi def link mcEffect                    mcDataValue
hi def link mcEnchantment               mcDataValue
hi def link mcEntityType                mcDataValue
hi def link mcItem                      mcDataValue
hi def link mcBuiltinNamespace          mcBuiltin
hi def link mcBuiltinBlock              mcBuiltin
hi def link mcBuiltinDimension          mcBuiltin
hi def link mcBuiltinEffect             mcBuiltin
hi def link mcBuiltinEnchantment        mcBuiltin
hi def link mcBuiltinEntity             mcBuiltin
hi def link mcBuiltinItem               mcBuiltin

syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace

syn match   mcNamespace         /\w\+:/ contained contains=mcBuiltinNamespace

syn match   mcChatMessage       /.*/    contained
syn match   mcFunction          /#?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained
syn match   mcUInt              /\d\+/  contained
hi def link mcUInt              mcValue

syn keyword mcGamemode          contained survival creative adventure spectator
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,@mcEntity
syn keyword mcDifficulty        contained peaceful easy normal hard
syn keyword mcListUUIDs         contained uuids
syn keyword mcBool              contained true false
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue
hi def link mcDifficulty        mcKeyValue
hi def link mcListUUIDs         mcKeyword

"TODO
syn match   mcJSONText          contained /.\+/

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
" (same with /seed but that one was easy so i don't really care)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say schedule scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
hi def link mcHelpCommand       mcKeyValue

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

" Gamerules
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcBool       announceAdvancements commandBlockOutput disableElytraMovementCheck disableRaids doDaylightCycle doEntityDrops doFireTick doLimitedCrafting doMobLoot doTileDrops doWeatherCycle keepInventory logAdminCommands mobGriefing naturalRegeneration reducedDebugInfo sendCommandFeedback showDeathMessages spectatorsGenerateChunks
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcUInt       maxCommandChainLength maxEntityCramming randomTickSpeed spawnRadius

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


" Can't have multiple spaces
syn match mcDoubleSpace / \@<= \+\| \{2,}/ contained containedin=ALLBUT,@mcNBT,mcChatMessage,@mcSelectorFilter
hi def link mcDoubleSpace mcBadWhitespace

" Optional Slash
syn match mcOptionalSlash /^\/\?/ nextgroup=@mcCommand
hi def link mcOptionalSlash mcCommand

" Illegal Whitespace
syn match mcComment /^#.*/
syn match mcBadWhitespace /\t/
" Repeat all 8 fields present when making a new instance of NBT Path
" Repeat only mcNBTTagP and mcNBT for a new instance of NBT Tag
syn match   mcNBTPath           /\w\+/                                                          contained                               nextgroup=@mcNBTContinue
syn region  mcNBTPath           matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue
syn region  mcNBTArray          matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue
syn region  mcNBTTagP           matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue
syn match   mcNBTPathDot        /\./                                                            contained                               nextgroup=mcNBTPath
syn cluster mcNBTPath           contains=mcNBTPath,mcNBTTagP
syn cluster mcNBTContinue       contains=mcNBTTagP,mcNBTArray,mcNBTPathDot
syn cluster mcNBT               add=mcNBTPath,mcNBTArray,mcNBTTagP,mcNBTPathDot,mcNBTTag
syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

" Execute store
syn match   mcNBTPathExecuteStore       /\w\+/                                                          contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTPathExecuteStore       matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTArrayExecuteStore      matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTTagExecuteStore        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn match   mcNBTPathDotExecuteStore    /\./                                                            contained                               nextgroup=mcNBTPathExecuteStore
syn cluster mcNBTPathExecuteStore       contains=mcNBTPathExecuteStore,mcNBTTagExecuteStore
syn cluster mcNBTContinueExecuteStore   contains=mcNBTTagExecuteStore,mcNBTArrayExecuteStore,mcNBTPathDotExecuteStore
syn cluster mcNBT                       add=mcNBTPathExecuteStore,mcNBTArrayExecuteStore,mcNBTTagExecuteStore,mcNBTPathDotExecuteStore
hi def link mcNBTPathExecuteStore       mcNBTPath
hi def link mcNBTPathDotExecuteStore    mcNBTPathDot

" Execute [condition]
syn match   mcNBTPathExecute            /\w\+/                                                          contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTPathExecute            matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTArrayExecute           matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTTagExecute             matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn match   mcNBTPathDotExecute         /\./                                                            contained                               nextgroup=mcNBTPathExecuteStore
syn cluster mcNBTPathExecute            contains=mcNBTPathExecute,mcNBTTagExecute
syn cluster mcNBTContinueExecute        contains=mcNBTTagExecute,mcNBTArrayExecute,mcNBTPathDotExecute
syn cluster mcNBT                       add=mcNBTPathExecute,mcNBTArrayExecute,mcNBTTagExecute,mcNBTPathDotExecute
hi def link mcNBTPathExecute            mcNBTPath
hi def link mcNBTPathDotExecute         mcNBTPathDot

" Data get
syn match   mcNBTPathDataGet            /\w\+/                                                          contained                               nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTPathDataGet            matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTArrayDataGet           matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTTagDataGet             matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn match   mcNBTPathDotDataGet         /\./                                                            contained                               nextgroup=mcNBTPathDataGet
syn cluster mcNBTPathDataGet            contains=mcNBTPathDataGet,mcNBTTagDataGet
syn cluster mcNBTContinueDataGet        contains=mcNBTTagDataGet,mcNBTArrayDataGet,mcNBTPathDotDataGet
syn cluster mcNBT                       add=mcNBTPathDataGet,mcNBTArrayDataGet,mcNBTTagDataGet,mcNBTPathDotDataGet
hi def link mcNBTPathDataGet            mcNBTPath
hi def link mcNBTPathDotDataGet         mcNBTPathDot

" Data Modify
syn match   mcNBTPathDataModify         /\w\+/                                                          contained                               nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTPathDataModify         matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTArrayDataModify        matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTTagDataModify          matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn match   mcNBTPathDotDataModify      /\./                                                            contained                               nextgroup=mcNBTPathDataModify
syn cluster mcNBTPathDataModify         contains=mcNBTPathDataModify,mcNBTTagDataModify
syn cluster mcNBTContinueDataModify     contains=mcNBTTagDataModify,mcNBTArrayDataModify,mcNBTPathDotDataModify
syn cluster mcNBT                       add=mcNBTPathDataModify,mcNBTArrayDataModify,mcNBTTagDataModify,mcNBTPathDotDataModify
hi def link mcNBTPathDataModify         mcNBTPath
hi def link mcNBTPathDotDataModify      mcNBTPathDot

" Tag instances
syn region  mcNBTTagGive        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,mcUInt
syn region  mcNBTTagSetblock    matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcSetblockPad
syn region  mcNBTTagFill        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcFillPad
syn region  mcNBTTagFillReplace matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey
syn region  mcNBTTagClone       matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcClonePad
syn cluster mcNBT               add=mcNBTTagGive,mcNBTTagSetblock,mcNBTTagFill,mcNBTTagFillReplace,mcNBTTagClone

" These never need to be redefined as they will always be found inside
" something, thus they don't need a custom nextgroup
syn match   mcNBTIndex          /\s*\d\+\s*/                                                            contained
syn match   mcNBTComma          /,/                                                                     contained
syn match   mcNBTColon          /:/                                                                     contained skipwhite nextgroup=@mcNBTValue
syn match   mcNBTTagKey         /\w\+/                                                                  contained skipwhite nextgroup=mcNBTColon
syn region  mcNBTTagKey         matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/            oneline contained skipwhite nextgroup=mcNBTColon
syn keyword mcNBTBool           true false                                                              contained
syn match   mcNBTValue          /-\?\d*\.\?\d\+[bBsSlLfFdD]\?\>/                                        contained
syn match   mcNBTString         /\(\d*\h\)\@=\w*/                                                       contained
syn region  mcNBTString         matchgroup=mcNBTValueQuote   start=/"/ end=/"/ skip=/\\"/       oneline contained
syn region  mcNBTString         matchgroup=mcNBTValueQuote   start=/'/ end=/'/ skip=/\\'/       oneline contained
syn region  mcNBTValue          matchgroup=mcNBTBracket start=/{/rs=e end=/}/                   oneline contained contains=mcNBTTagKey,mcNBTComma
syn region  mcNBTValue          matchgroup=mcNBTBracket start=/\[\([BIL];\)\?/rs=e end=/]/       oneline contained contains=@mcNBTValue,mcNBTComma
syn cluster mcNBTValue          contains=mcNBTValue,mcNBTString,mcNBTBool
syn cluster mcNBT               add=mcNBTIndex,mcNBTComma,mcNBTColon,mcNBTTagKey,mcNBTValue,mcNBTString,mcNBTBool
hi def link mcNBTBool           mcBool
hi def link mcNBTTagKey         mcNBTPath
hi def link mcNBTComma          mcNBTPathDot
hi def link mcNBTColon          mcNBTPathDot
hi def link mcNBTValueQuote     mcNBTValue

" For debugging purposes
syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath
" Scoreboard

syn match   mcTeamName                    /\(\w\|[.+-]\)\+/       contained
syn match   mcTagName                     /\(\w\|[.+-]\)\+/       contained

syn match   mcObjectiveName                             /\(\w\|[.+-]\)\+/       contained
syn match   mcObjectiveNameExecuteStore                 /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcObjectiveNameFilter                       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcFilterEqScore
syn match   mcObjectiveNameExecuteCondScoreTarget       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCondScoreMatch,mcExecuteCondScoreOp
syn match   mcObjectiveNameExecuteCondScoreSource       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcObjectiveNameExecuteStore                 mcObjectiveName
hi def link mcObjectiveNameFilter                       mcObjectiveName
hi def link mcObjectiveNameExecuteCondScoreTarget       mcObjectiveName
hi def link mcObjectiveNameExecuteCondScoreSource       mcObjectiveName
