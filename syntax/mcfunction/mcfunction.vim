" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry


if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mc"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entity
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEntity(type, nexttype)
      execute 'hi def link mcEntity'.a:type 'mcEntity'
      execute 'syn match   mcEntity'.a:type 'contained /\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn match   mcEntity'.a:type 'contained /@[eaprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn match   mcEntity'.a:type 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn region  mcEntity'.a:type 'contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn cluster mcFilter add='.a:type
endfunction

syn match   mcEntity contained /\w\{3,16}\>-\@!/
syn match   mcEntity contained /@[eaprs]\>\[\@!/
syn match   mcEntity contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn region  mcEntity contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

"This one requires a special name regex
hi def link mcEntityTpTarget mcEntity
syn match   mcEntityTpTarget contained /\<\(\d\+\(\s\+[0-9~.-]\+\)\{1,2}\s*$\)\@!\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn match   mcEntityTpTarget contained /@[eaprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn match   mcEntityTpTarget contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn region  mcEntityTpTarget contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Player
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcPlayer mcEntity
function! s:mcPlayer(type, nexttype)
      execute 'hi def link mcPlayer'.a:type 'mcPlayer'
      execute 'syn cluster mcPlayer'.a:type 'add=mcPlayer'.a:type
      execute 'syn match   mcPlayer'.a:type 'contained /\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn match   mcPlayer'.a:type 'contained /@[aprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn match   mcPlayer'.a:type 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn region  mcPlayer'.a:type 'contained matchgroup=mcSelector start=/@[aprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
      execute 'syn cluster mcFilter add='.a:type
endfunction

syn match   mcPlayer contained /\w\{3,16}\>-\@!/
syn match   mcPlayer contained /@[aprs]\>\[\@!/
syn match   mcPlayer contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn region  mcPlayer contained matchgroup=mcSelector start=/@[aprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coordinate
" (~[#ientrs] | #) * 3 | (^[#]) * 3
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn match mcCoordinate contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace

function! s:mcCoordinate(type,nexttype,serial)
        execute 'syn match mcCoordinate'.a:type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcCoordinate'.a:type 'mcCoordinate'.a:serial
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Column
" Same as Coordinate, but 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcColumn     contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
function! s:mcColumn(type,nexttype,serial)
        execute 'syn match mcColumn'.a:type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcColumn'.a:type 'mcColumn'.a:serial
endfunction
hi def link mcColumn                    mcCoordinate
hi def link mcColumn2                   mcCoordinate2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rotation
" Same as Column, but no caret allowed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcRotation   contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/
function! s:mcRotation(type,nexttype,serial)
        execute 'syn match mcRotation'.a:type 'contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcRotation'.a:type 'mcRotation'.a:serial
endfunction
hi def link mcRotation                  mcCoordinate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcNBTPath(type,nexttype)
        execute 'syn match   mcNBTPath'.a:type           '/\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.a:type ',mcNBTPathPad'.a:type
        execute 'syn region  mcNBTPath'.a:type           'matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.a:type ',mcNBTPathPad'.a:type
        execute 'syn region  mcNBTArray'.a:type          'matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.a:type ',mcNBTPathPad'.a:type
        execute 'syn region  mcNBTTagP'.a:type           'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.a:type ',mcNBTPathPad'.a:type
        execute 'syn match   mcNBTPathDot'.a:type        '/\./                                                            contained                               nextgroup=mcNBTPath'.a:type ',mcNBTPathPad'.a:type
        execute 'syn cluster mcNBTPath'.a:type           'contains=mcNBTPath'.a:type.',mcNBTTagP'.a:type
        execute 'syn cluster mcNBTContinue'.a:type       'contains=mcNBTTagP'.a:type.',mcNBTArray'.a:type.',mcNBTPathDot'.a:type
        execute 'syn cluster mcNBT'.a:type               'add=mcNBTPath'.a:type.',mcNBTArray'.a:type.',mcNBTTagP'.a:type.',mcNBTPathDot'.a:type.',mcNBTTag'.a:type
        execute 'hi def link mcNBTPath'.a:type 'mcNBTPath'
        execute 'hi def link mcNBTPathDot'.a:type 'mcNBTPathDot'
        execute 'syn match mcNBTPathPad'.a:type '/\ze\_[ ]/ contained skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction
call s:mcNBTPath("","")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcNBTTag(type,nexttype)
        execute 'syn region  mcNBTTag'.a:type 'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,mcNBTPad'.a:type
        execute 'syn cluster mcNBT add=mcNBTTag'.a:type
        execute 'syn match   mcNBTPad'.a:type '/\ze\_[ ]/ skipwhite contained nextgroup=mcDoubleSpace,'.a:nexttype
endfunction
syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

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
syn region  mcNBTValue          matchgroup=mcNBTBracket start=/\[\([BIL];\)\?/rs=e end=/]/      oneline contained contains=@mcNBTValue,mcNBTComma
syn cluster mcNBTValue          contains=mcNBTValue,mcNBTString,mcNBTBool
syn cluster mcNBT               add=mcNBTIndex,mcNBTComma,mcNBTColon,mcNBTTagKey,mcNBTValue,mcNBTString,mcNBTBool
hi def link mcNBTBool           mcBool
hi def link mcNBTTagKey         mcNBTPath
hi def link mcNBTComma          mcNBTPathDot
hi def link mcNBTColon          mcNBTPathDot
hi def link mcNBTValueQuote     mcNBTValue


" For debugging purposes
syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Block
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcBlock(type,nexttype)
        execute 'syn match mcBlock'.a:type '/\(\w\+:\)*\w\+\(\[[^]]*\]\)\?/ contained contains=mcBlock nextgroup=mcBadWhiteSpaceBlock,mcNBTTagBlock'.a:type
        call s:mcNBTTag('Block'.a:type,a:nexttype)
        execute 'syn match mcNBTTagBlock'.a:type '/\ze\_[ ]/ contained skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dimension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcDimension(type,nexttype)
        execute 'syn match mcDimension'.a:type '/\S\+/ contained contains=mcDimension skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Effect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEffect(type,nexttype)
        execute 'syn match mcEffect'.a:type '/\S\+/ contained contains=mcEffect skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EntityType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEntityType(type,nexttype)
        execute 'syn match mcEntityType'.a:type '/\S\+/ contained contains=mcEntityType skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchantment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEnchantment(type,nexttype)
        execute 'syn match mcEnchantment'.a:type '/\S\+/ contained contains=mcEnchantment skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Item
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcItem(type,nexttype)
        execute 'syn match mcItem'.a:type '/\S\+/ contained contains=mcItem skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advancement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand advancement               contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementKeyword

syn match   mcAdvancementName                   /\(\w\|[/:]\)\+/        contained
syn match   mcAdvancementNameFilter             /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcFilterEqAdvance
syn match   mcAdvancementNameCriteria           /\(\w\|[/:]\)\+/        contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementCriterionName
hi def link mcAdvancementNameFilter     mcAdvancementName
hi def link mcAdvancementNameCriteria   mcAdvancementName
call s:mcEntity("Advancement","mcAdvancementWhich")

syn match   mcAdvancementCriterionName          /\(\w\|[.+-]\)\+/       contained
syn match   mcAdvancementCriterionNameFilter    /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcFilterEqAdvance
hi def link mcAdvancementCriterionNameFilter    mcAdvanecmentCriterionName

syn keyword mcAdvancementKeyword        grant revoke    contained skipwhite nextgroup=mcDoubleSpace,mcEntityAdvancement
syn keyword mcAdvancementWhich          everything
syn keyword mcAdvancementWhich          only            contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementNameCriteria
syn keyword mcAdvancementWhich          from through until      contained skipwhite nextgroup=mcDoulbleSpace,mcAdvancementName

hi def link mcAdvancementWhich          mcKeyword
hi def link mcAdvancementName           mcValue
hi def link mcAdvancementCriterionName  mcValue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bossbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand bossbar contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword

" Bossbar add
syn keyword mcBossbarKeyword add contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdAdd
syn match   mcBossbarIdAdd /\(\w\|[:./-]\)\+/ contained skipwhite contains=mcNamespace nextgroup=mcDoubleSpace,mcJSONText

" Bossbar get
syn keyword mcBossbarKeyword get contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdGet
syn match   mcBossbarIdGet /\(\w\|[:./-]\)\+/ contained skipwhite contains=mcNamespace nextgroup=mcDoubleSpace,mcBossbarGetKeyword
syn keyword mcBossbarGetKeyword contained max players value visible

" Bossbar list
syn keyword mcBossbarKeyword list contained

" Bossbar remove
syn keyword mcBossbarKeyword remove contained skipwhite nextgroup=mcDoubleSpace,mcBossbarId
syn match   mcBossbarId /\(\w\|[:./-]\)\+/ contained contains=mcNamespace

" Bossbar set
syn keyword mcBossbarKeyword set contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdSet
syn match   mcBossbarIdSet /\(\w\|[:./-]\)\+/ contained contains=mcNamespace skipwhite nextgroup=mcDoubleSpace,mcBossbarSetKeyword

syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetColor   color
        syn keyword mcBossbarSetColor   contained                                                       blue green pink purple red white yellow
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcUInt              max value 
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcJSONText          name 
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcEntity            players 
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetStyle   style 
        syn keyword mcBossbarSetStyle   contained                                                       progress notched_6 notched_10 notched_12 notched_20
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBool              visible

" Links
hi def link mcBossbarGetKeyword         mcKeyword
hi def link mcBossbarSetKeyword         mcKeyword

hi def link mcBossbarFeild              mcKeyValue
hi def link mcBossbarSetColor           mcKeyValue
hi def link mcBossbarSetStyle           mcKeyValue

hi def link mcBossbarIdAdd              mcValue
hi def link mcBossbarIdExecuteStore     mcValue
hi def link mcBossbarIdSet              mcValue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand clear contained skipwhite nextgroup=mcDoubleSpace,mcEntityClear

call s:mcEntity("Clear","mcItemClear")
syn match mcItemClear /\(\w\|:\)\+/ contained contains=mcNamespace,mcBuiltinItem skipwhite nextgroup=mcDoubleSpace,mcUInt
hi def link mcItemClear mcItem

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clone
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand clone contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneFrom

call s:mcCoordinate("CloneFrom","mcCoordinateCloneTo","")
call s:mcCoordinate("CloneTo","mcCoordinateCloneDest","2")
call s:mcCoordinate("CloneDest","mcCloneMask","3")

syn keyword mcCloneMask         masked replace          contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMask         filtered                contained skipwhite nextgroup=mcDoubleSpace,mcBlockClone
hi def link mcCloneMask         mcKeyword
call s:mcBlock("Clone","mcCloneMode")

syn keyword mcCloneMode         force move normal       contained
hi def link mcCloneMode         mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand data contained skipwhite nextgroup=mcDoubleSpace,mcDataKeyword


" Data get
syn keyword mcDataKeyword       get     contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordGet

syn keyword mcDataKeywordGet    entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataGet
        call s:mcEntity("DataGet", "@mcNBTPathDataGet")
syn keyword mcDataKeywordGet    block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataGet
        call s:mcCoordinate("DataGet","@mcNBTPathDataGet","")

call s:mcNBTPath("DataGet","mcDataGetScale")

syn match   mcDataGetScale      /-\?\d*\.\?\d\+/                contained

" Data merge
syn keyword mcDataKeyword       merge   contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordMerge

syn keyword mcDataKeywordMerge  entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataMerge
        call s:mcEntity("DataMerge", "mcNBTTag")
syn keyword mcDataKeywordMerge  block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataMerge
        call s:mcCoordinate("DataMerge","mcNBTTag","")

" Data modify
syn keyword mcDataKeyword       modify  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordModify

syn keyword mcDataKeywordModify entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataModify
        call s:mcEntity("DataModify", "@mcNBTPathDataModify")
syn keyword mcDataKeywordModify block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataModify
        call s:mcCoordinate("DataModify","@mcNBTPathDataModify","")

call s:mcNBTPath("DataModify","mcDataModifyHow")

syn keyword mcDataModifyHow     append merge prepend set        contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource
        syn keyword mcDataModifySource  value                           contained skipwhite nextgroup=mcDoubleSpace,@mcNBTValue
        syn keyword mcDataModifySource  from                            contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
        " it just so happens that data modify from ends the same way as data remove!

syn keyword mcDataModifyHow     insert                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyIndex
        syn match   mcDataModifyIndex   /\d\+/                          contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource

" Data remove
syn keyword mcDataKeyword       remove  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove

syn keyword mcDataKeywordRemove entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataRemove
        call s:mcEntity("DataRemove", "@mcNBTPath")
syn keyword mcDataKeywordRemove block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataRemove
        call s:mcCoordinate("DataRemove","@mcNBTPath","")

" Links
hi def link mcDataKeywordGet    mcKeyword
hi def link mcDataKeywordModify mcKeyword
hi def link mcDataKeywordRemove mcKeyword
hi def link mcDataKeywordMerge  mcKeyword
hi def link mcDataModifyHow     mcKeyword
hi def link mcDataModifySource  mcKeyword
hi def link mcDataGetScale      mcValue
hi def link mcDataModifyIndex   mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Datapack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand datapack contained skipwhite nextgroup=mcDoubleSpace,mcDatapackKeyword

" Datapack disable
syn keyword mcDatapackKeyword           disable                 contained skipwhite nextgroup=mcDoubleSpace,mcDatapackName
syn match   mcDatapackName              /\w\+/                  contained

" Datapack enable
syn keyword mcDatapackKeyword           enable                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnable
syn match   mcDatapackNameEnable        /\w\+/                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackEnableKeyword

syn keyword mcDatapackEnableKeyword     first last              contained

syn keyword mcDatapackEnableKeyword     before after            contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnableRel
        syn match   mcDatapackNameEnableRel /\w\+/              contained

" Datapack list
syn keyword mcDatapackKeyword           list                    contained skipwhite nextgroup=mcDoubleSpace,mcDatapackListKeyword
syn keyword mcDatapackListKeyword       enabled available       contained

" Links
hi def link mcDatapackNameEnable        mcValue
hi def link mcDatapackNameEnableRel     mcValue
hi def link mcDatapackEnableKeyword     mcKeyword
hi def link mcDatapackListKeyword       mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Difficulty
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand difficulty contained skipwhite nextgroup=mcDoubleSpace,mcDifficulty

syn keyword mcDifficulty        contained peaceful easy normal hard
hi def link mcDifficulty        mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Effect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand effect contained skipwhite nextgroup=mcDoubleSpace,mcEffectKeyword


" Effect give
syn keyword mcEffectKeyword give        contained skipwhite nextgroup=mcDoubleSpace,mcEntityEffectGive
call s:mcEntity("EffectGive", "mcEffectGive")
syn match   mcEffectGive    /\S\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectSeconds contains=mcEffect
syn match   mcEffectSeconds /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectAmp
syn match   mcEffectAmp     /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcBool

" Effect clear
syn keyword mcEffectKeyword clear       contained skipwhite nextgroup=mcDoubleSpace,mcEntityEffectClear
call s:mcEntity("EffectClear", "mcEffect")

" Links
hi def link mcEffectKeyword mcKeyword
hi def link mcEffectSeconds mcValue
hi def link mcEffectAmp     mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchant
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand enchant contained skipwhite nextgroup=mcDoubleSpace,mcEntityEnchant

call s:mcEntity("Enchant", "mcEnchantmentName")

syn match   mcEnchantmentName   /\S\+/   contained contains=mcEnchantment skipwhite nextgroup=mcDoubleSpace,mcEnchantmentLevel
syn match   mcEnchantmentLevel  /[1-5]/ contained
hi def link mcEnchantmentLevel  mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand execute contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn cluster mcExecuteKeyword add=mcExecuteKeyword

" Execute align
syn keyword mcExecuteKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAlignValue align 
syn match   mcExecuteAlignValue contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword   /\<\(x\([^ x]*x\)\@!\|y\([^ y]*y\)\@!\|z\([^ z]*z\)\@!\)\{1,3\}\>/

" Execute anchored
syn keyword mcExecuteKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue anchored
syn keyword mcExecuteAnchoredValue contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword      eyes feet

" Execute as/at
syn cluster mcExecuteKeyword add=mcExecuteAsKeyword
syn keyword mcExecuteAsKeyword contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute as
syn keyword mcExecuteKeyword   contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute at
call s:mcEntity("Execute", "@mcExecuteKeyword")

" Execute facing
syn cluster mcExecuteKeyword add=mcExecuteFacingKeyword
syn keyword mcExecuteFacingKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate facing
syn keyword mcExecuteFacingEntityKeyword contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteFacing                     entity
call s:mcEntity("ExecuteFacing", "mcExecuteAnchoredValue")

" Execute in
syn keyword mcExecuteKeyword contained skipwhite nextgroup=mcDoubleSpace,mcDimensionExecute in
call s:mcDimension("ExecuteIn","@mcExecuteKeyword")

" Execute positioned
syn keyword mcExecuteKeyword contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecute,mcExecuteAsKeyword positioned
call s:mcCoordinate("Execute","@mcExecuteKeyword","")

" Execute rotated
syn keyword mcExecuteKeyword contained skipwhite nextgroup=mcDoubleSpace,mcRotationExecute,mcExecuteAsKeyword rotated
call s:mcRotation("Execute","@mcExecuteKeyword","")

" Execute run
syn keyword mcExecuteKeyword contained skipwhite nextgroup=mcDoubleSpace,mcCommand run

" Execute store
"""""""""""""""""""""""""
syn keyword mcExecuteKeyword                    store           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhat
syn keyword mcExecuteStoreWhat  result success  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhere

" block/entity
syn keyword mcExecuteStoreWhere block           contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteStoreBlock
        call s:mcCoordinate("ExecuteStoreBlock","@mcNBTPathExecuteStore","")
syn keyword mcExecuteStoreWhere entity          contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteStore
        call s:mcEntity("ExecuteStore", "@mcNBTPathExecuteStore")

call s:mcNBTPath("ExecuteStore","mcExecuteStoreType")
syn keyword mcExecuteStoreType  byte short int long float double        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreScale
syn match   mcExecuteStoreScale /-\?\d*\.\?\d\+/                        contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword

" bossbar
syn keyword mcExecuteStoreWhere        contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdExecuteStore    bossbar
syn match   mcExecuteStoreBossbarId    contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreBossbarFeild /\(\w\|[:./-]\)\+/ contains=mcNamespace
syn keyword mcExecuteStoreBossbarFeild contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword          max value
hi def link mcExecuteStoreBossbarFeild mcBossbarFeild

" score
syn keyword mcExecuteStoreWhere score           contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteStoreScore
call s:mcEntity("ExecuteStoreScore", "mcExecuteStoreObjectiveName")
"TODO after finishing scoreboard, include objective

" Execute if/unless
"""""""""""""""""""""""
syn keyword mcExecuteKeyword                    if unless       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCond

" block
syn keyword mcExecuteCond contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondBlock block
call s:mcCoordinate("ExecuteCondBlock","mcBlockExecute","")
call s:mcBlock("Execute","@mcExecuteKeyword")

" blocks
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondStart blocks
call s:mcCoordinate("ExecuteCondStart","mcCoordinateExecuteCondEnd","")
call s:mcCoordinate("ExecuteCondEnd","mcCoordinateExecuteCondDest","2")
call s:mcCoordinate("ExecuteCondDest","mcExecuteCondBlocksMask","3")
syn keyword mcExecuteCondBlocksMask     contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword            all masked

" data
syn keyword mcExecuteCond               data                    contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCondData
syn keyword mcExecuteCondData           block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondData
        call s:mcCoordinate("ExecuteCondData","@mcNBTPathExecute","")
syn keyword mcExecuteCondData           entity                  contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondData
        call s:mcEntity("ExecuteCondData", "@mcNBTPathExecute")
call s:mcNBTPath("Execute","@mcExecuteKeyword")

" entity
syn keyword mcExecuteCond               entity                  contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCond
call s:mcEntity("ExecuteCond", "@mcExecuteKeyword")

" score
syn keyword mcExecuteCond               score                   contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreTarget
call s:mcEntity("ExecuteCondScoreTarget", "mcObjectiveNameExecuteCondScoreTarget")
call s:mcEntity("ExecuteCondScoreSource", "mcObjectiveNameExecuteCondScoreSource")
" TODO after finishing scoreboard
syn match   mcExecuteCondScoreOp        /[<>=]\@=[<>]\?=\?/     contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreSource
syn keyword mcExecuteCondScoreMatch     matches                 contained skipwhite nextgroup=mcDoubleSpace,mcExecuteIR1,mcExecuteIR2
syn match   mcExecuteIR1                /-\?\d\+/               contained skipwhite nextgroup=mcDoubleSpace,mcExecuteRangeInf,mcExecuteIR2,@mcExecuteKeyword
syn match   mcExecuteIR2                / \@!\.\.-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteRangeInf           /\.\.\_[ ]/             contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword

" Links
hi def link mcExecuteAsKeyword                  mcKeyword
hi def link mcExecuteCond                       mcKeyword
hi def link mcExecuteCondData                   mcKeyword
hi def link mcExecuteCondScoreMatch             mcKeyword
hi def link mcExecuteCondScoreOp                mcKeyword
hi def link mcExecuteFacingEntityKeyword        mcKeyword
hi def link mcExecuteFacingKeyword              mcKeyword
hi def link mcExecuteStoreWhat                  mcKeyword
hi def link mcExecuteStoreWhere                 mcKeyword

hi def link mcExecuteAlignValue                 mcKeyValue
hi def link mcExecuteAnchoredValue              mcKeyValue
hi def link mcExecuteCondBlocksMask             mcKeyValue
hi def link mcExecuteInValueRaw                 mcKeyValue
hi def link mcExecuteStoreType                  mcKeyValue

hi def link mcExecuteIR1                        mcValue
hi def link mcExecuteIR2                        mcValue
hi def link mcExecuteRangeInf                   mcValue
hi def link mcExecuteStoreScale                 mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand fill contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillFrom

call s:mcCoordinate("FillFrom","mcCoordinateFillTo","")
call s:mcCoordinate("FillTo","mcBlockFill","2")
call s:mcBlock("Fill","mcFillMode")
syn keyword mcFillMode          destroy hollow keep outline     contained
syn keyword mcFillMode          replace                         contained skipwhite nextgroup=mcDoubleSpace,mcBlockFillReplace
        call s:mcBlock("FillReplace","")

" Links
hi def link mcFillMode          mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Forceload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand forceload contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword

" Forceload add
syn keyword mcForceloadKeyword          add     contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart
call s:mcColumn("ForceloadStart","mcColumnForceloadEnd","")
call s:mcColumn("ForceloadEnd","mcAnySpace","2")

" Forceload remove
syn keyword mcForceloadKeyword          remove  contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart,mcForceloadRemKeyword
syn keyword mcForceloadRemKeyword       all contained

" Forceload query
syn keyword mcForceloadKeyword          query   contained skipwhite nextgroup=mcDoubleSpace,mcColumn

" Links
hi def link mcForceloadRemKeyword       mcForceloadKeyword
hi def link mcForceloadKeyword          mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand function contained skipwhite nextgroup=mcDoubleSpace,mcFunction

syn match   mcFunction          /#?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained
hi def link mcFuncion   mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gamemode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand defaultgamemode contained skipwhite nextgroup=mcDoubleSpace,mcGamemode
syn keyword mcCommand gamemode        contained skipwhite nextgroup=mcDoubleSpace,mcGamemodeSet

syn keyword mcGamemode          contained survival creative adventure spectator
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,mcEntity
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gamerule
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand gamerule contained skipwhite nextgroup=mcDoubleSpace,mcGamerule

"bools
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcBool               announceAdvancements commandBlockOutput disableElytraMovementCheck disableRaids
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcBool               doDaylightCycle doEntityDrops doMobLoot doMobSpawning doTileDrops doWeatherCycle 
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcBool               naturalRegeneration reducedDebugInfo sendCommandFeedback showDeathMessages spectatorsGenerateChunks 
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcGameruleNumber     maxCommandChainLength maxEntityCramming spawnRadius
        syn match mcGameruleNumber /\<-\?\d\{1,10\}\>/ contained skipwhite
syn keyword mcGamerule contained skipwhite nextgroup=mcDoubleSpace,mcRandomTickNumber   randomTickSpeed
        syn match mcRandomTickNumber /\<\([1-3]\?\d\{1,3\}\|409[0-6]\|40[0-8]\d\)\>/ contained skipwhite

hi def link mcGamerule          mcKeyWord
hi def link mcRandomTickNumber  mcGameruleNumber
hi def link mcGameruleNumber    mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand give contained skipwhite nextgroup=mcDoubleSpace,mcEntityGive

call s:mcEntity("Give", "mcItemGive")
syn match mcItemGive /\(\w\|:\)\+/ contained contains=mcItem nextgroup=mcAnySpace,mcNBTTagGive
call s:mcNBTTag("Give","mcUInt")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand help contained skipwhite nextgroup=mcDoubleSpace,mcUInt,mcHelpCommand

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say schedule scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
hi def link mcHelpCommand mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand kill contained skipwhite nextgroup=mcDoubleSpace,mcEntity


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand list contained skipwhite nextgroup=mcDoubleSpace,mcListUUIDs

syn keyword mcListUUIDs         contained uuids
hi def link mcListUUIDs         mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand locate contained skipwhite nextgroup=mcDoubleSpace,mcLocatable

" TODO: add namespace and contains stuff
syn keyword mcLocatable contained Buried_Treasure EndCity Fortress Mansion Mineshaft Monument Ocean_Ruin Shipwreck Stronghold Desert_Pyramid Igloo Jungle_Pyramid Swamp_Hut Village Pillager_Outpost
hi def link mcLocatable                 mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand loot contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword

call s:mcEntity("Loot", "mcLootSourceKeyword")
call s:mcEntity("LootReplace", "mcItemSlotLoot")
call s:mcCoordinate("Loot","mcLootSourceKeyword","")
call s:mcCoordinate("LootMine","mcExecuteFacingKeyword,mcItem,mcLootHand","")
call s:mcCoordinate("LootReplace","mcItemSlotLoot","")


syn keyword mcLootTargetKeyword         spawn insert    contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLoot
syn keyword mcLootTargetKeyword         replace         contained skipwhite nextgroup=mcDoubleSpace,mcLootReplaceKeyword
syn keyword mcLootReplaceKeyword        entity          contained skipwhite nextgroup=mcDoubleSpace,mcEntityLootReplace
syn keyword mcLootReplaceKeyword        block           contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLootReplace
syn keyword mcLootTargetKeyword         give            contained skipwhite nextgroup=mcDoubleSpace,mcEntityLoot
syn keyword mcLootSourceKeyword         fish            contained skipwhite nextgroup=mcDoubleSpace,mcLootTableFish
syn keyword mcLootSourceKeyword         loot            contained skipwhite nextgroup=mcDoubleSpace,mcLootTable
syn keyword mcLootSourceKeyword         kill            contained skipwhite nextgroup=mcDoubleSpace,mcEntity
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Msg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand msg w tell teammsg tm me  contained skipwhite nextgroup=mcDoubleSpace,mcEntityMsg
syn keyword mcCommand say                       contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage 

call s:mcEntity("Msg", "mcChatMessage")

syn match   mcChatMessage       /.*/    contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scoreboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO finish execute store/cond score after finishing this
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
hi def link mcObjectiveName             mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setblock
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand setblock contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateSetblock

call s:mcCoordinate("Setblock","mcBlockSetblock","")
syn keyword mcSetblockMode      contained destroy keep replace
call s:mcBlock("Setblock","mcSetblockMode")

hi def link mcSetblockMode      mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spawnpoint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand spawnpoint contained skipwhite nextgroup=mcDoubleSpace,mcEntitySpawnPos
call s:mcEntity("SpawnPos","mcCoordinate")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setworldspawn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand setworldspawn contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Summon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand summon contained skipwhite nextgroup=mcDoubleSpace,mcEntityTypeSummon

call s:mcEntityType("Entity","mcCoordinateSummon")
call s:mcCoordinate("Summon","mcLineEnd,@mcNBT","")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand title contained skipwhite nextgroup=mcDoubleSpace,mcEntityTitle

call s:mcEntity("Title","mcTitleKeyword")

" Title title (title title title?)
syn keyword mcTitleKeyword      contained actionbar subtitle title skipwhite nextgroup=mcDoubleSpace,mcJSONText

" Title clear/reset
syn keyword mcTitleKeyword      contained clear reset

" Title times
syn keyword mcTitleKeyword      contained times skipwhite nextgroup=mcDoubleSpace,mcTitleTime
syn match mcTitleTime           /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime2
syn match mcTitleTime2          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime3
syn match mcTitleTime3          /\d\{1,9\}/ contained

hi def link mcTitleKeyword mcKeyWord
" might as well right?
hi def link mcTitleTime         mcCoordinate
hi def link mcTitleTime2        mcCoordinate2
hi def link mcTitleTime3        mcCoordinate3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand tp teleport contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate,mcEntityTpTarget

call s:mcEntity("TpFacing", "mcTpAnchoredValue")
call s:mcCoordinate("Tp","mcExecuteFacingKeyword,mcRotation","")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trivial Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand reload seed contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Weather
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand weather contained skipwhite nextgroup=mcDoubleSpace,mcWeather

syn keyword mcWeather           contained clear rain thunder skipwhite nextgroup=mcDoubleSpace,mcWeatherDuration
syn match   mcWeatherDuration   contained /\d\{0,6\}/

hi def link mcWeather           mcKeyword
hi def link mcWeatherDuration   mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Xp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand xp experience contained skipwhite nextgroup=mcDoubleSpace,mcXpKeyword

syn keyword mcXpKeyword query           contained skipwhite nextgroup=mcDoubleSpace,mcEntityXpQuery
        call s:mcEntity("XpQuery", "mcXpUnit")

syn keyword mcXpKeyword add set         contained skipwhite nextgroup=mcDoubleSpace,mcEntityXpSet
        call s:mcEntity("XpSet", "mcXpAmount")
        syn match   mcXpAmount  /-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcXpUnit

syn keyword mcXpUnit    points levels   contained

hi def link mcXpAmount  mcValue
hi def link mcXpUnit    mcKeyword
hi def link mcXpKeyword mcKeyword

