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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rotation
" Same as Column, but no caret allowed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcRotation   contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/
function! s:mcRotation(type,nexttype,serial)
        execute 'syn match mcRotation'.a:type 'contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcRotation'.a:type 'mcRotation'.a:serial
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcNBTPath(type)
        execute 'syn match   mcNBTPath'.a:type           '/\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTPath'.a:type           'matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTArray'.a:type          'matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTTagP'.a:type           'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn match   mcNBTPathDot'.a:type        '/\./                                                            contained                               nextgroup=mcNBTPath'.a:type ',mc'.a:type.'Pad'
        execute 'syn cluster mcNBTPath'.a:type           'contains=mcNBTPath'.a:type.',mcNBTTagP'.a:type
        execute 'syn cluster mcNBTContinue'.a:type       'contains=mcNBTTagP'.a:type.',mcNBTArray'.a:type.',mcNBTPathDot'.a:type
        execute 'syn cluster mcNBT'.a:type               'add=mcNBTPath'.a:type.',mcNBTArray'.a:type.',mcNBTTagP'.a:type.',mcNBTPathDot'.a:type.',mcNBTTag'.a:type
        execute 'hi def link mcNBTPath'.a:type 'mcNBTPath'
        execute 'hi def link mcNBTPathDot'.a:type 'mcNBTPathDot'
endfunction
call s:mcNBTPath("")

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
hi def link mcAdvancementWhich          mcAdvancementKeyword
hi def link mcAdvancementKeyword        mcKeyword

"hi mcAdvancementNameFilter              ctermfg=1 cterm=bold
"hi mcAdvancementCriterionNameFilter     ctermfg=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bossbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand bossbar                   contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword

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
syn keyword mcBossbarSetKeyword players         contained skipwhite nextgroup=mcDoubleSpace,mcEntity
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand clear                     contained skipwhite nextgroup=mcDoubleSpace,mcEntityClear

syn match   mcItemClear                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        skipwhite nextgroup=mcDoubleSpace,mcUInt
call s:mcEntity("Clear","mcItemClear")
hi def link mcItemClear                         mcItem

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clone
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand clone                     contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneFrom

call s:mcCoordinate("CloneDest","mcCloneMask","3")
call s:mcCoordinate("CloneFrom","mcCoordinateCloneTo","")
call s:mcCoordinate("CloneTo","mcCoordinateCloneDest","2")
call s:mcNBTTag("Clone","mcCloneMode")
syn keyword mcCloneMask         masked replace          contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMask         filtered                contained skipwhite nextgroup=mcDoubleSpace,mcBlockClone
syn keyword mcCloneMode         force move normal       contained
hi def link mcCloneMask         mcKeyword
hi def link mcCloneMode         mcKeyword
syn match   mcBlockClone                    /\S\+\(\[[^\]]\]\)\?/   contained contains=mcBlock                 nextgroup=mcAnySpace,mcNBTTagClone,mcClonePad
syn region  mcBlockStateClone           matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagClone,mcClonePad

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand data                      contained skipwhite nextgroup=mcDoubleSpace,mcDataKeyword

call s:mcEntity("DataGet", "@mcNBTPathDataGet")
call s:mcEntity("DataMerge", "mcNBTTag")
call s:mcEntity("DataModify", "@mcNBTPathDataModify")
call s:mcEntity("DataRemove", "@mcNBTPath")
call s:mcCoordinate("DataGet","@mcNBTPathDataGet","")
call s:mcCoordinate("DataMerge","mcNBTTag","")
call s:mcCoordinate("DataModify","@mcNBTPathDataModify","")
call s:mcCoordinate("DataRemove","@mcNBTPath","")
call s:mcNBTPath("DataGet")
call s:mcNBTPath("DataModify")

syn keyword mcDataKeyword       get     contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordGet
syn keyword mcDataKeyword       merge   contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordMerge
syn keyword mcDataKeyword       modify  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordModify
syn keyword mcDataKeyword       remove  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove
syn keyword mcDataKeywordGet    block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataGet
syn keyword mcDataKeywordMerge  block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataMerge
syn keyword mcDataKeywordModify block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataModify
syn keyword mcDataKeywordRemove block   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateDataRemove
syn keyword mcDataKeywordGet    entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataGet
syn keyword mcDataKeywordMerge  entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataMerge
syn keyword mcDataKeywordModify entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataModify
syn keyword mcDataKeywordRemove entity  contained skipwhite nextgroup=mcDoubleSpace,mcEntityDataRemove
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Datapack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand datapack                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackKeyword

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Difficulty
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand difficulty                contained skipwhite nextgroup=mcDoubleSpace,mcDifficulty

syn keyword mcDifficulty        contained peaceful easy normal hard
hi def link mcDifficulty        mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Effect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand effect                    contained skipwhite nextgroup=mcDoubleSpace,mcEffectKeyword

call s:mcEntity("EffectClear", "mcEffect")
call s:mcEntity("EffectGive", "mcEffectGive")

syn match   mcEffectGive                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect      skipwhite nextgroup=mcDoubleSpace,mcEffectSeconds
hi def link mcEffectGive                        mcEffect
syn keyword mcEffectKeyword give        contained skipwhite nextgroup=mcDoubleSpace,mcEntityEffectGive
syn keyword mcEffectKeyword clear       contained skipwhite nextgroup=mcDoubleSpace,mcEntityEffectClear
syn match   mcEffectSeconds /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectAmp
syn match   mcEffectAmp     /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcBool
hi def link mcEffectSeconds mcValue
hi def link mcEffectAmp     mcValue
hi def link mcEffectKeyword mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchant
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand enchant                   contained skipwhite nextgroup=mcDoubleSpace,mcEntityEnchant

call s:mcEntity("Enchant", "mcEnchantmentName")

syn match   mcEnchantmentName   /\S\+/   contained contains=mcEnchantment skipwhite nextgroup=mcDoubleSpace,mcEnchantmentLevel
syn match   mcEnchantmentLevel  /[1-5]/ contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn cluster mcCommand add=mcExecuteCommand

call s:mcEntity("Execute", "@mcExecuteKeyword")
call s:mcEntity("ExecuteCond", "@mcExecuteKeyword")
call s:mcEntity("ExecuteCondData", "@mcNBTPathExecute")
call s:mcEntity("ExecuteCondScoreSource", "mcObjectiveNameExecuteCondScoreSource")
call s:mcEntity("ExecuteCondScoreTarget", "mcObjectiveNameExecuteCondScoreTarget")
call s:mcEntity("ExecuteFacing", "mcExecuteAnchoredValue")
call s:mcEntity("ExecuteStore", "@mcNBTPathExecuteStore")
call s:mcEntity("ExecuteStoreScore", "mcObjectiveNameExecuteStore")
call s:mcCoordinate("Execute","@mcExecuteKeyword","")
call s:mcCoordinate("ExecuteCondBlock","mcBlockmeExecute","")
call s:mcCoordinate("ExecuteCondData","@mcNBTPathExecute","")
call s:mcCoordinate("ExecuteCondDest","mcExecuteCondBlocksMask","")
call s:mcCoordinate("ExecuteCondEnd","mcCoordinateExecuteCondDest","3")
call s:mcCoordinate("ExecuteCondStart","mcCoordinateExecuteCondEnd","2")
call s:mcCoordinate("ExecuteStoreBlock","@mcNBTPathExecuteStore","")
call s:mcRotation("Execute","@mcExecuteKeyword","")
call s:mcNBTPath("ExecuteStore")
call s:mcNBTPath("Execute")
syn match   mcBlockExecute                  /\S\+\(\[[^\]]\]\)\?/   contained contains=mcBlock       skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcDimensionExecute                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinDimension   skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcDimensionExecute                  mcDimension

" Keywords
syn keyword mcExecuteKeyword                    align           contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAlignValue
syn keyword mcExecuteKeyword                    anchored        contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn keyword mcExecuteAsKeyword                  as              contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute
syn keyword mcExecuteKeyword                    at              contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute
syn keyword mcExecuteFacingKeyword              facing          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate
syn keyword mcExecuteFacingEntityKeyword        entity          contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteFacing
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
syn keyword mcExecuteStoreWhere entity          contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteStore
syn keyword mcExecuteStoreWhere score           contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteStoreScore
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
syn keyword mcExecuteCond               entity                  contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCond
syn keyword mcExecuteCond               score                   contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreTarget
syn keyword mcExecuteCondData           block                   contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondData
syn keyword mcExecuteCondData           entity                  contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondData
syn match   mcExecutePad                / \@=/                  contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcExecuteCondScoreOp        /[<>=]\@=[<>]\?=\?/     contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreSource
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand fill                      contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillFrom

call s:mcCoordinate("FillFrom","mcCoordinateFillTo","")
call s:mcCoordinate("FillTo","mcBlockFill","2")
call s:mcNBTTag("Fill","mcFillMode")
call s:mcNBTTag("FillReplace","")
syn keyword mcFillMode          destroy hollow keep outline     contained
syn keyword mcFillMode          replace                         contained skipwhite nextgroup=mcDoubleSpace,mcBlockameFillReplace
hi def link mcFillMode          mcKeyword

syn match   mcBlockFill                     /\S\+\(\[[^\]]\]\)\?/   contained contains=mcBlock                 nextgroup=mcAnySpace,mcNBTTagFill,mcFillPad
syn match   mcBlockFillReplace              /\S\+\(\[[^\]]\]\)\?/   contained contains=mcBlock                 nextgroup=mcAnySpace,mcNBTTagFillReplace
syn region  mcBlockStateFill            matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFill,mcFillPad
syn region  mcBlockStateFillReplace     matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFillReplace,mcFillReplacePad

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Forceload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand forceload                 contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword

call s:mcColumn("ForceloadStart","mcColumnForceloadEnd","")
call s:mcColumn("ForceloadEnd","mcDoubleSpace","2")
syn keyword mcForceloadKeyword          add     contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart
syn keyword mcForceloadKeyword          remove  contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart,mcForceloadRemKeyword
syn keyword mcForceloadKeyword          query   contained skipwhite nextgroup=mcDoubleSpace,mcColumn
syn keyword mcForceloadRemKeyword       all contained
hi def link mcForceloadRemKeyword       mcForceloadKeyword
hi def link mcForceloadKeyword          mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand function                  contained skipwhite nextgroup=mcDoubleSpace,mcFunction

syn match   mcFunction          /#?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gamemode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand defaultgamemode           contained skipwhite nextgroup=mcDoubleSpace,mcGamemode
syn keyword mcCommand gamemode                  contained skipwhite nextgroup=mcDoubleSpace,mcGamemodeSet

syn keyword mcGamemode          contained survival creative adventure spectator
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,mcEntity
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gamerule
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand gamerule                  contained skipwhite nextgroup=mcDoubleSpace,mcGamerule

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand give                      contained skipwhite nextgroup=mcDoubleSpace,mcEntityGive

call s:mcEntity("Give", "mcItemGive")
call s:mcNBTTag("Give","mcUInt")
syn match   mcItemGive                          /\(\w\|:\)\+/   contained contains=mcItem        nextgroup=mcAnySpace,mcNBTTagGive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand help                      contained skipwhite nextgroup=mcDoubleSpace,mcUInt,mcHelpCommand

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say schedule scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
hi def link mcHelpCommand       mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand kill                      contained skipwhite nextgroup=mcDoubleSpace,mcEntity


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand list                      contained skipwhite nextgroup=mcDoubleSpace,mcListUUIDs

syn keyword mcListUUIDs         contained uuids
hi def link mcListUUIDs         mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand locate                    contained skipwhite nextgroup=mcDoubleSpace,mcLocatable

" TODO: add namespace and contains stuff
syn keyword mcLocatable contained Buried_Treasure EndCity Fortress Mansion Mineshaft Monument Ocean_Ruin Shipwreck Stronghold Desert_Pyramid Igloo Jungle_Pyramid Swamp_Hut Village Pillager_Outpost

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand loot                      contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setblock
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand setblock                  contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateSetblock

call s:mcCoordinate("Setblock","mcBlockSetblock","")
call s:mcBlock("Setblock","mcSetblockMode")

syn keyword mcSetblockMode      contained destroy keep replace
hi def link mcSetblockMode      mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spawnpoint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand spawnpoint                contained skipwhite nextgroup=mcDoubleSpace,mcEntitySpawnPos
syn keyword mcCommand setworldspawn             contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate
call s:mcEntity("SpawnPos","mcCoordinate")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Summon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand summon                    contained skipwhite nextgroup=mcDoubleSpace,mcEntityTypeSummon

call s:mcCoordinate("Summon","mcLineEnd,@mcNBT","")
syn match   mcEntityTypeSummon                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEntity      skipwhite nextgroup=mcDoubleSpace,mcCoordinateSummon
hi def link mcEntityTypeSummon                  mcEntityType

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand title                     contained skipwhite nextgroup=mcDoubleSpace,mcEntityTitle

syn keyword mcTitleKeyword      contained actionbar subtitle title skipwhite nextgroup=mcDoubleSpace,mcJSONText
syn keyword mcTitleKeyword      contained clear reset
syn keyword mcTitleKeyword      contained times skipwhite nextgroup=mcDoubleSpace,mcTitleTime
call s:mcEntity("Title","mcTitleKeyword")
hi def link mcTitleKeyword mcKeyWord
syn match mcTitleTime           /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime2
syn match mcTitleTime2          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace,mcTitleTime3
syn match mcTitleTime3          /\d\{1,9\}/ contained skipwhite nextgroup=mcDoubleSpace
hi def link mcTitleTime         mcCoordinate
hi def link mcTitleTime2        mcCoordinate2
hi def link mcTitleTime3        mcCoordinate3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand tp teleport               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate,mcEntityTpTarget

call s:mcEntity("TpFacing", "mcTpAnchoredValue")
call s:mcCoordinate("Tp","mcExecuteFacingKeyword,mcRotation","")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trivial
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand reload seed               contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Weather
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand weather                   contained skipwhite nextgroup=mcDoubleSpace,mcWeather

syn keyword mcWeather           contained clear rain thunder skipwhite nextgroup=mcDoubleSpace,mcWeatherDuration
syn match   mcWeatherDuration   /\d\{0,6\}/ contained
hi def link mcWeather           mcKeyword
hi def link mcWeatherDuration   mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Xp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand xp experience             contained skipwhite nextgroup=mcDoubleSpace,mcXpKeyword

call s:mcEntity("XpQuery", "mcXpUnit")
call s:mcEntity("XpSet", "mcXpAmount")
syn keyword mcXpKeyword add set         contained skipwhite nextgroup=mcDoubleSpace,mcEntityXpSet
syn keyword mcXpKeyword query           contained skipwhite nextgroup=mcDoubleSpace,mcEntityXpQuery
syn match   mcXpAmount  /-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn keyword mcXpUnit    points levels   contained
hi def link mcXpAmount  mcValue
hi def link mcXpUnit    mcKeyword
hi def link mcXpKeyword mcKeyword

