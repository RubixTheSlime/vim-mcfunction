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
function! s:mcEntity(group, nextgroup)
      execute 'hi def link mcEntity'.a:group 'mcEntity'
      execute 'syn match   mcEntity'.a:group 'contained /\w\{3,16}\>-\@1!/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn match   mcEntity'.a:group 'contained /@[eaprs]\>\[\@1!/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn match   mcEntity'.a:group 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn region  mcEntity'.a:group 'contained matchgroup=mcEntity start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn cluster mcFilter add='.a:group
endfunction

syn match   mcEntity contained /\w\{3,16}\>-\@1!/
syn match   mcEntity contained /@[eaprs]\>\[\@1!/
syn match   mcEntity contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn region  mcEntity contained matchgroup=mcEntity start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

"This one requires a special name regex
"Don't touch it just works
syn match   mcEntityTpTarget contained /\<\(\d\+\(\s\+[0-9~.-]\+\)\{1,2}\s*$\)\@!\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn match   mcEntityTpTarget contained /@[eaprs]\>\[\@1!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn match   mcEntityTpTarget contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
syn region  mcEntityTpTarget contained matchgroup=mcEntity start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcEntity
hi def link mcEntityTpTarget mcEntity

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Player
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcPlayer(group, nextgroup)
      execute 'hi def link mcPlayer'.a:group 'mcPlayer'
      execute 'syn match   mcPlayer'.a:group 'contained /\w\{3,16}\>-\@1!/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn match   mcPlayer'.a:group 'contained /@[aprs]\>\[\@1!/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn match   mcPlayer'.a:group 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn region  mcPlayer'.a:group 'contained matchgroup=mcPlayer start=/@[aprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
      execute 'syn cluster mcFilter add='.a:group
endfunction

syn match   mcPlayer contained /\w\{3,16}\>-\@1!/
syn match   mcPlayer contained /@[eaprs]\>\[\@1!/
syn match   mcPlayer contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn region  mcPlayer contained matchgroup=mcPlayer start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

hi def link mcPlayer mcEntity

" for filters
syn match   mcPlayerName contained /\w\{3,16}\>-\@!/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coordinate
" (~[#ientrs] | #) * 3 | (^[#]) * 3
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn match mcCoordinate  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcCoordinate2 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcCoordinate3 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace

function! s:mcCoordinate(group,nextgroup,serial)
        execute 'syn match mcCoordinate'.a:group 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        execute 'hi def link mcCoordinate'.a:group 'mcCoordinate'.a:serial
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Column
" Same as Coordinate, but 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcColumn     contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
syn match mcColumn2    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
function! s:mcColumn(group,nextgroup,serial)
        execute 'syn match mcColumn'.a:group 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        execute 'hi def link mcColumn'.a:group 'mcColumn'.a:serial
endfunction
hi def link mcColumn                    mcCoordinate
hi def link mcColumn2                   mcCoordinate2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rotation
" Same as Column, but no caret allowed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcRotation   contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1! \?\)\{2\}/
syn match mcRotation2  contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1! \?\)\{2\}/
function! s:mcRotation(group,nextgroup,serial)
        execute 'syn match mcRotation'.a:group 'contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@1! \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        execute 'hi def link mcRotation'.a:group 'mcRotation'.a:serial
endfunction
hi def link mcRotation                  mcCoordinate
hi def link mcRotation2                 mcCoordinate2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entity Block
" initializes both Entity and Block with respective keywords
" not to be confused with a 'Block Entity'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEntityBlock(group,nextgroup)
        execute 'syn keyword mcEntityBlock'.a:group 'entity contained skipwhite nextgroup=mcDoubleSpace,mcEntity'.a:group
        execute 'syn keyword mcEntityBlock'.a:group 'block contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate'.a:group
        call s:mcEntity(a:group,a:nextgroup)
        call s:mcCoordinate(a:group,a:nextgroup,'')
        execute 'hi def link mcEntityBlock'.a:group 'mcKeyword'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entity Block Storage
" initializes all three similarly to EntityBlock
" not to be confused with a 'Block Entity'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEBS(group,nextgroup)
        execute 'syn keyword mcEBS'.a:group 'entity contained skipwhite nextgroup=mcDoubleSpace,mcEntity'.a:group
        execute 'syn keyword mcEBS'.a:group 'block contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate'.a:group
        execute 'syn keyword mcEBS'.a:group 'storage contained skipwhite nextgroup=mcDoubleSpace,mcStorage'.a:group
        call s:mcEntity(a:group,a:nextgroup)
        call s:mcCoordinate(a:group,a:nextgroup,'')
        call s:mcData('Storage',a:group,a:nextgroup)
        execute 'hi def link mcEBS'.a:group 'mcKeyword'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcNBTPath(group,nextgroup)
        execute 'syn match   mcNBTPath'.a:group           '/\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTPath'.a:group           'matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTArray'.a:group          'matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTTagP'.a:group           'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn match   mcNBTPathDot'.a:group        '/\./                                                            contained                               nextgroup=mcNBTPath'.a:group ',mcNBTPathPad'.a:group
        execute 'syn cluster mcNBTPath'.a:group           'contains=mcNBTPath'.a:group.',mcNBTTagP'.a:group
        execute 'syn cluster mcNBTContinue'.a:group       'contains=mcNBTTagP'.a:group.',mcNBTArray'.a:group.',mcNBTPathDot'.a:group
        execute 'syn cluster mcNBT'.a:group               'add=mcNBTPath'.a:group.',mcNBTArray'.a:group.',mcNBTTagP'.a:group.',mcNBTPathDot'.a:group.',mcNBTTag'.a:group
        execute 'hi def link mcNBTPath'.a:group 'mcNBTPath'
        execute 'hi def link mcNBTPathDot'.a:group 'mcNBTPathDot'
        execute 'syn match mcNBTPathPad'.a:group '/\ze\_[ ]/ contained skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
endfunction
call s:mcNBTPath("","")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcNBTTag(group,nextgroup)
        execute 'syn region  mcNBTTag'.a:group 'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,mcNBTPad'.a:group
        execute 'syn cluster mcNBT add=mcNBTTag'.a:group
        execute 'syn match   mcNBTPad'.a:group '/\ze\_[ ]/ skipwhite contained nextgroup=mcDoubleSpace,'.a:nextgroup
endfunction
syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Block
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcBlock(group,nextgroup)
        execute 'syn match mcBlock'.a:group '/\(\w\+:\)*\w\+\(\[[^]]*\]\)\?/ contained contains=mcBlock nextgroup=mcBadWhiteSpaceBlock,mcNBTTagBlock'.a:group
        call s:mcNBTTag('Block'.a:group,a:nextgroup)
        execute 'syn match mcNBTTagBlock'.a:group '/\ze\_[ ]/ contained skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other (namespaceable) data types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcData(type,group,nextgroup)
        if a:nextgroup == ""
                execute 'syn match mc'.a:type.a:group '/\S\+/ contained contains=mc'.a:type
        else
                execute 'syn match mc'.a:type.a:group '/\S\+/ contained contains=mc'.a:type 'skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advancement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand advancement contained skipwhite nextgroup=mcDoubleSpace,mcAdvanceKeyword

syn keyword mcAdvanceKeyword                contained skipwhite nextgroup=mcDoubleSpace,mcEntityAdvance         grant revoke
call s:mcEntity("Advance","mcAdvanceWhich")
syn keyword mcAdvanceWhich                  contained                                                           everything
syn keyword mcAdvanceWhich                  contained skipwhite nextgroup=mcDoubleSpace,mcAdvancementCriteria   only
        call s:mcData('Advancement','Criteria','mcAdvancementCriteria')
syn keyword mcAdvancementWhich              contained skipwhite nextgroup=mcDoulbleSpace,mcAdvancementName      from through until
        call s:mcData('Advancement','Criteria','')

hi def link mcAdvanceWhich          mcKeyword
hi def link mcAdvanceKeyword        mcKeyword


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bossbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand bossbar contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword

" Bossbar add
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdAdd add
call s:mcData('BossbarId','Add','mcJSONText')

" Bossbar get
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdGet get
call s:mcData('BossbarId','Get','mcBossbarGetKeyword')
syn keyword mcBossbarGetKeyword contained                                                  max players value visible

" Bossbar list
syn keyword mcBossbarKeyword    contained                                                  list

" Bossbar remove
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcBossbarId    remove

" Bossbar set
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdSet set
call s:mcData('BossbarId','Set','mcBossbarSetKeyword')

syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetColor   color
        syn keyword mcBossbarSetColor   contained                                                       blue green pink purple red white yellow
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcUInt              max value
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcJSONText          name
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcEntity            players
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetStyle   style
        syn keyword mcBossbarSetStyle   contained                                                       progress notched_6 notched_10 notched_12 notched_20
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBool              visible

" Links
hi def link mcBossbarKeyword            mcKeyword
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
call s:mcData('Item','Clear','mcUInt')

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
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataGet    get
call s:mcEBS('DataGet','@mcNBTPathDataGet')
call s:mcNBTPath("DataGet","mcDataGetScale")
syn match   mcDataGetScale      contained                                                       /-\?\d*\.\?\d\+/

" Data merge
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataMerge    merge
call s:mcEBS('DataMerge','mcNBTTag')

" Data modify
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataModify    modify
call s:mcEBS('DataModify','@mcNBTPathDataModify')
call s:mcNBTPath("DataModify","mcDataModifyHow")

syn keyword mcDataModifyHow             contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource  append merge prepend set
        syn keyword mcDataModifySource  contained skipwhite nextgroup=mcDoubleSpace,@mcNBTValue         value
        syn keyword mcDataModifySource  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove from

syn keyword mcDataModifyHow             contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyIndex   insert
        syn match   mcDataModifyIndex   contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource  /\d\+/

" Data remove
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataRemove    remove
call s:mcEBS('DataRemove','@mcNBTPath')

" Links
hi def link mcDataKeyword       mcKeyword
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
call s:mcData('Effect','Give','mcEffectSeconds')
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

call s:mcEntity("Enchant", "mcEnchantmentEnchant")

call s:mcData('Enchantment','Enchant','mcEnchantLevel')
syn match   mcEnchantLevel  /[1-5]/ contained
hi def link mcEnchantLevel  mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand execute contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword

" Execute align
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAlignValue                         align
syn match   mcExecuteAlignValue         contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                           /\<\(x\([^ x]*x\)\@!\|y\([^ y]*y\)\@!\|z\([^ z]*z\)\@!\)\{1,3\}\>/

" Execute anchored
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue                      anchored
syn keyword mcExecuteAnchoredValue      contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                           eyes feet

" Execute as/at
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute                             at as
call s:mcEntity("Execute", "mcExecuteKeyword")

" Execute facing
syn keyword mcExecuteKeyword             contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate facing
syn keyword mcExecuteFacingEntityKeyword contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteFacing                     entity
call s:mcEntity("ExecuteFacing", "mcExecuteAnchoredValue")

" Execute in
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcDimensionExecute                          in
call s:mcData("Dimension","ExecuteIn","mcExecuteKeyword")

" Execute positioned
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecute,mcExecutePosAs          positioned
syn keyword mcExecutePosAs              contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecute                             as
call s:mcCoordinate("Execute","mcExecuteKeyword","")

" Execute rotated
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcRotationExecute,mcExecuteAsKeyword        rotated
call s:mcRotation("Execute","mcExecuteKeyword","")

" Execute run
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcCommand                                   run

" Execute store
"""""""""""""""""""""""""
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhat                          store
syn keyword mcExecuteStoreWhat          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhere,mcEBSExecuteStore       result success

" block/entity
call s:mcEBS('ExecuteStore','@mcNBTPathExecuteStore')
call s:mcNBTPath("ExecuteStore","mcExecuteStoreType")
syn keyword mcExecuteStoreType          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreScale                 byte short int long float double
syn match   mcExecuteStoreScale         contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                   /-\?\d*\.\?\d\+/

" bossbar
syn keyword mcExecuteStoreWhere         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdExecuteStore             bossbar
call s:mcData('BossbarId','ExecuteStore','mcExecuteStoreBossbarFeild')
syn keyword mcExecuteStoreBossbarFeild  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                   max value

" score
syn keyword mcExecuteStoreWhere         contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteStoreScore           score
call s:mcEntity("ExecuteStoreScore", "mcObjectiveExecuteStore")
call s:mcData("Objective","ExecuteStore","mcExecuteKeyword")

" Execute if/unless
"""""""""""""""""""""""
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCond                       if unless

" block
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondBlock        block
call s:mcCoordinate("ExecuteCondBlock","mcBlockExecute","")
call s:mcBlock("Execute","mcExecuteKeyword")

" blocks
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondStart        blocks
call s:mcCoordinate("ExecuteCondStart","mcCoordinateExecuteCondEnd","")
call s:mcCoordinate("ExecuteCondEnd","mcCoordinateExecuteCondDest","2")
call s:mcCoordinate("ExecuteCondDest","mcExecuteCondBlocksMask","3")
syn keyword mcExecuteCondBlocksMask     contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                    all masked

" data
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcEntityBlockExecuteCondData        data
call s:mcEntityBlock('ExecuteCondData','@mcNBTPathExecute')
call s:mcNBTPath("Execute","mcExecuteKeyword")

" entity
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCond                 entity
call s:mcEntity("ExecuteCond", "mcExecuteKeyword")

" score
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreTarget      score
call s:mcEntity("ExecuteCondScoreTarget","mcObjectiveExecuteCondScoreTarget")
call s:mcData('Objective','ExecuteCondScoreTarget','mcExecuteCondScoreOp,mcExecuteCondScoreMatch')
syn match   mcExecuteCondScoreOp        contained skipwhite nextgroup=mcDoubleSpace,mcEntityExecuteCondScoreSource      /[<>=]\@=[<>]\?=\?/
        call s:mcEntity("ExecuteCondScoreSource","mcObjectiveExecuteCondScoreSource")
        call s:mcData('Objective','ExecuteCondScoreSource','mcExecuteKeyword')
syn keyword mcExecuteCondScoreMatch     contained skipwhite nextgroup=mcDoubleSpace,mcExecuteIR1,mcExecuteIR2           matches
        syn match   mcExecuteIR1                /-\?\d\+/               contained skipwhite nextgroup=mcDoubleSpace,mcExecuteRangeInf,mcExecuteIR2,mcExecuteKeyword
        syn match   mcExecuteIR2                / \@!\.\.-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword
        syn match   mcExecuteRangeInf           /\.\.\_[ ]/             contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword

" predicate
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcPredicateExecuteCond              predicate
call s:mcData('Predicate','ExecuteCond','mcExecuteKeyword')

" Links
hi def link mcExecuteAsKeyword                  mcExecuteKeyword

hi def link mcExecuteKeyword                    mcKeyword
hi def link mcExecuteCond                       mcKeyword
hi def link mcExecuteCondData                   mcKeyword
hi def link mcExecuteCondScoreMatch             mcKeyword
hi def link mcExecuteFacingEntityKeyword        mcKeyword
hi def link mcExecuteFacingKeyword              mcKeyword
hi def link mcExecuteStoreBossbarFeild          mcKeyword
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

hi def link mcExecuteCondScoreOp                  mcOp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand fill contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillFrom

call s:mcCoordinate("FillFrom","mcCoordinateFillTo","")
call s:mcCoordinate("FillTo","mcBlockFill","2")
call s:mcBlock("Fill","mcFillMode")
syn keyword mcFillMode contained                                                        destroy hollow keep outline
syn keyword mcFillMode contained skipwhite nextgroup=mcDoubleSpace,mcBlockFillReplace   replace
        call s:mcBlock("FillReplace","")

" Links
hi def link mcFillMode          mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Forceload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand forceload contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword

" Forceload add
syn keyword mcForceloadKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart                       add
call s:mcColumn("ForceloadStart","mcColumn2","")

" Forceload remove
syn keyword mcForceloadKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart,mcForceloadRemKeyword remove
syn keyword mcForceloadRemKeyword contained                                                                                all

" Forceload query
syn keyword mcForceloadKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcColumn                                     query

" Links
hi def link mcForceloadRemKeyword mcForceloadKeyword
hi def link mcForceloadKeyword    mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand function contained skipwhite nextgroup=mcDoubleSpace,mcFunction

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
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcBool               announceAdvancements commandBlockOutput disableElytraMovementCheck disableRaids
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcBool               doDaylightCycle doEntityDrops doMobLoot doMobSpawning doTileDrops doWeatherCycle
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcBool               naturalRegeneration reducedDebugInfo sendCommandFeedback showDeathMessages spectatorsGenerateChunks
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcGameruleNumber     maxCommandChainLength maxEntityCramming spawnRadius
        syn match mcGameruleNumber   contained skipwhite                                              /\<-\?\d\{1,10\}\>/
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcRandomTickNumber   randomTickSpeed
        syn match mcRandomTickNumber contained skipwhite                                              /\<\([1-3]\?\d\{1,3\}\|409[0-6]\|40[0-8]\d\)\>/

hi def link mcGamerule          mcKeyWord
hi def link mcRandomTickNumber  mcGameruleNumber
hi def link mcGameruleNumber    mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand give contained skipwhite nextgroup=mcDoubleSpace,mcPlayerGive

call s:mcPlayer("Give", "mcItemGive")
call s:mcData('Item','Give','mcNBTTagGive')
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

" Target
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLoot                    spawn insert
        call s:mcCoordinate("Loot","mcLootSourceKeyword","")
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcEntityLoot                        give
        call s:mcEntity("Loot", "mcLootSourceKeyword")
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcEntityBlockLootReplace            replace
        call s:mcEntityBlock('LootReplace','mcItemSlotLoot')
        syn keyword mcItemSlotLoot              contained skipwhite nextgroup=mcDoubleSpace,mcLootCount,mcLootSourceKeyword     slot
                syn match   mcLootCount         contained skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword                 /0*\(6[0-4]\|[1-5]\?\d\|[1-9]\)/

" Source
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcLootTableFish                             fish
        syn match   mcLootTableFish             contained skipwhite nextgroup=mcDoubleSpace,mcLootFishingLocation contains=mcNamespace  /\(\w\|:\)\+/
        syn match   mcLootFishingLocation       contained skipwhite nextgroup=mcDoubleSpace,mcItem,mcLootHand                           /\w\+/
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcLootTable                                 loot
        syn match   mcLootTable                 contained contains=mcNamespace                                                          /\(\w\|:\)\+/
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcEntity                                    kill
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLootMine                        mine
        call s:mcCoordinate("LootMine","mcItem,mcLootHand","")
syn keyword mcLootHand                          contained                                                                               mainhand offhand

" Links
hi def link mcLootTargetKeyword         mcKeyword
hi def link mcLootReplaceKeyword        mcKeyword
hi def link mcLootSourceKeyword         mcKeyword
hi def link mcItemSlotLoot              mcKeyword
hi def link mcLootHand                  mcKeyword

hi def link mcLootTableFish             mcLootTable
hi def link mcLootTable                 mcValue
hi def link mcLootFishingLocation       mcValue

hi def link mcLootCount                 mcUInt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Msg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand msg w tell teammsg tm me  contained skipwhite nextgroup=mcDoubleSpace,mcEntityMsg
syn keyword mcCommand say                       contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage

call s:mcEntity("Msg", "mcChatMessage")

syn match   mcChatMessage       /.*/    contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Particle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcParticleParticle particle

call s:mcData('Particle','Particle','mcCoordinateParticle')
call s:mcCoordinate('Particle','mcCoordinateParticleDelta','')
call s:mcCoordinate('ParticleDelta','mcParticleSpeed','2')
syn match   mcParticleSpeed contained skipwhite nextgroup=mcDoubleSpace,mcParticleCount /\(\d*\.\)\?\d\+/ 
syn match   mcParticleCount contained skipwhite nextgroup=mcDoubleSpace,mcParticleMode  /\d\+/ 
syn keyword mcParticleMode  contained skipwhite nextgroup=mcDoubleSpace,mcEntity        force normal

hi def link mcParticleSpeed mcValue
hi def link mcParticleCount mcValue
hi def link mcParticleMode  mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Playsound
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSoundPlay playsound

call s:mcData('Sound','Play','mcSoundChannelPlay')
call s:mcData('SoundChannel','Play','mcEntityPlaysound')
call s:mcEntity('Playsound','mcCoordinatePlaysound')
call s:mcCoordinate('Playsound','mcPlaysoundVolume','')

syn match   mcPlaysoundVolume    contained skipwhite nextgroup=mcDoubleSpace,mcPlaysoundPitch     /\(\d*\.\)\?\d\+/ 
syn match   mcPlaysoundPitch     contained skipwhite nextgroup=mcDoubleSpace,mcPlaysoundMinVolume /0*1\?\.\d\+\|0*2\(\.0*\)\?\ze\_[ ]/ 
syn match   mcPlaysoundMinVolume contained                                                        /0*\.\d\+\|0*1\(\.0*\)\?\ze\_[ ]/

hi def link mcPlaysoundVolume    mcValue
hi def link mcPlaysoundPitch     mcValue
hi def link mcPlaysoundMinVolume mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Recipe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcRecipeKeyword recipe

syn keyword mcRecipeKeyword contained skipwhite nextgroup=mcDoubleSpace,mcEntityRecipe give take
call s:mcEntity('Recipe','mcCraftableItem,mcGlob')
hi def link mcRecipeKeyword mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ReplaceItem
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcEntityBlockReplaceitem replaceitem

call s:mcEntityBlock('Replaceitem','mcReplaceitemSlot')
syn match   mcReplaceitemSlot  contained skipwhite nextgroup=mcDoubleSpace,mcItemReplaceitem /armor\.\(chest\|feet\|head\|legs\)\|container.\([1-4]\?\d\|5[0-3]\)\|\(inventory\|enderchest\)\.\(1\?\d\|2[0-6]\)\|horse\.\(armor\|saddle\|chest\|\d\|1[0-5]\)\|hotbar.[0-8]\|villager.[0-7]\|weapon\(\.\(main\|off\)hand\)\?/
call s:mcData('Item','Replaceitem','mcUInt')

hi def link mcReplaceitemWhere mcKeyword
hi def link mcReplaceitemSlot  mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Schedule
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcScheduleKeyword schedule

syn keyword mcScheduleKeyword contained skipwhite nextgroup=mcDoubleSpace,mcFunction            clear
syn keyword mcScheduleKeyword contained skipwhite nextgroup=mcDoubleSpace,mcFunctionSchedule    function
call s:mcData('Function','Schedule','mcScheduleTime')
syn match   mcScheduleTime    contained skipwhite nextgroup=mcDoubleSpace,mcScheduleMode        /\d\+[dst]\?/
syn keyword mcScheduleMode    contained append replace

hi def link mcScheduleKeyword mcKeyword
hi def link mcScheduleMode    mcKeyword
hi def link mcScheduleTime    mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scoreboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand scoreboard contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardKeyword

" players
syn keyword mcScoreboardKeyword contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardPlayers         players
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcEntityScoreboardSet       add remove set
        call s:mcEntity('ScoreboardSet','mcObjectiveScoreboardSet')
        call s:mcData('Objective','ScoreboardSet','mcInt32')
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcEntityScoreboardGet       enable reset get
        call s:mcEntity('ScoreboardGet','mcObjective')
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcEntity                    list
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcEntityScoreboardOp        operation
        call s:mcEntity('ScoreboardOp','mcObjectiveScoreboardOpTarget')
        call s:mcData('Objective','ScoreboardOpTarget','mcScoreboardOp')
        syn match mcScoreboardOp contained skipwhite nextgroup=mcDoubleSpace,mcEntityScoreboardGet      /[%*/+-]\?=\|><\?\|</

" objectives
syn keyword mcScoreboardKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardObjectives           objectives

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveObjAdd                add
        call s:mcData('Objective','ObjAdd','mcCriteriaObjAdd')
        call s:mcData('Criteria','ObjAdd','mcJSONText')

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace                                  list

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveObjModify             modify
        call s:mcData('Objective','ObjModify','mcScoreboardModifyWhat')
        syn keyword mcScoreboardModifyWhat contained skipwhite nextgroup=mcDoubleSpace,mcJSONText               displayname
        syn keyword mcScoreboardModifyWhat contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardModifyRender rendertype
        syn keyword mcScoreboardModifyRender contained                                                          hearts integer

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjective                      remove

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcScoreDisplaySet                setdisplay
        call s:mcData('ScoreDisplay','Set','mcObjective')

" Links
hi def link mcScoreboardObjectives      mcKeyword
hi def link mcScoreboardPlayers         mcKeyword
hi def link mcScoreboardKeyword         mcKeyword
hi def link mcScoreboardModifyWhat      mcKeyword
hi def link mcScoreboardModifyRender    mcKeyword
hi def link mcScoreboardOp              mcOp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spreadplayers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcColumnSpread spreadplayers

call s:mcColumn('Spread','mcSpreadPlayersDistance','')
syn match   mcSpreadPlayersDistance contained skipwhite nextgroup=mcDoubleSpace,mcSpreadplayersRange    /\(\d*\.\)\?\d\+/
syn match   mcSpreadPlayersRange    contained skipwhite nextgroup=mcDoubleSpace,mcSpreadplayersRespect  /\(\d*\.\)\?\d\+/
syn keyword mcSpreadPlayersRespect  contained skipwhite nextgroup=mcDoubleSpace,mcEntity                true false

hi def link mcSpreadPlayersDistance mcValue
hi def link mcSpreadPlayersRange    mcValue
hi def link mcSpreadPlayersRespect  mcBool

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stopsound
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcEntityStopsound stopsound

call s:mcEntity('StopSound','mcSoundChannelStopSound,mcStopsoundGlob')
call s:mcData('SoundChannel','StopSound','mcSound')
syn match mcStopsoundGlob /\*/ contained skipwhite nextgroup=mcSound
hi def link mcStopsoundGlob mcOp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcEntityTag tag

call s:mcEntity('Tag','mcTagKeyword')
syn keyword mcTagKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTag add remove
syn keyword mcTagKeyword contained                                         list
syn match mcTag /\w\+/ contained

hi def link mcTagKeyword mcKeyword
hi def link mcTag mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Team
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcTeamKeyword team

syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcEntity          leave
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamAdd         add
        call s:mcData('Team','Add','mcJSONText')
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeam            empty remove list
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamJoin        join
        call s:mcData('Team','Join','mcEntity')
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamModify      modify
        call s:mcData('Team','Modify','mcTeamModifyHow')

" Team modify
syn keyword mcTeamModifyHow        contained skipwhite nextgroup=mcDoubleSpace,mcTeamModifyCollision   collisionRule
syn keyword mcTeamModifyHow        contained skipwhite nextgroup=mcDoubleSpace,mcTeamColor             color
syn keyword mcTeamModifyHow        contained skipwhite nextgroup=mcDoubleSpace,mcTeamModifyVisibility  deathMessageVisibility nametagVisibility
syn keyword mcTeamModifyHow        contained skipwhite nextgroup=mcDoubleSpace,mcJSONText              displayName prefix suffix
syn keyword mcTeamModifyHow        contained skipwhite nextgroup=mcDoubleSpace,mcBool                  friendlyFire seeFriendlyInvisibles
syn keyword mcTeamModifyCollision  contained                                                           always never pushOtherTeams pushOwnTeam
syn keyword mcTeamModifyVisibility contained                                                           always never hideForOtherTeams hideForOwnTeam


syn match   mcTeam contained /\w\+/
hi def link mcTeamKeyword          mcKeyword
hi def link mcTeamModifyHow        mcKeyword
hi def link mcTeamModifyCollision  mcKeyword
hi def link mcTeamModifyVisibility mcKeyword
hi def link mcTeam                 mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tellraw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcEntityTellraw tellraw

call s:mcEntity('Tellraw','mcJSONText')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Time
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcTimeKeyword time

syn keyword mcTimeKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcTimeQuery         query
        syn keyword mcTimeQuery contained skipwhite                                             day daytime gametime
syn keyword mcTimeKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcTimeAdd           add
        syn match   mcTimeAdd   contained skipwhite                                             /\d\+[dst]\?/
syn keyword mcTimeKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcTimeAdd,mcTimeSet set
        syn keyword mcTimeSet   contained skipwhite                                             day night midnight noon

hi def link mcTimeKeyword mcKeyword
hi def link mcTimeQuery   mcKeyword
hi def link mcTimeSet     mcKeyword

hi def link mcTimeAdd     mcValue

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

call s:mcData("EntityType","Summon","mcCoordinateSummon")
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

" Entity is defined in the entity area
call s:mcCoordinate("Tp","mcTpFacing,mcRotation2","")
syn keyword mcTpFacing contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate2 facing
hi def link mcTpFacing mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveTrigger trigger

call s:mcData('Objective','Trigger','mcTriggerMode')
syn keyword mcTriggerMode contained skipwhite nextgroup=mcDoubleSpace,mcUInt add set

hi def link mcTriggerMode mcKeyword

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
" Worldborder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcWorldborderKeyword worldborder

syn keyword mcWorldborderKeyword         contained                                                               get
syn keyword mcWorldborderKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcColumn                    center
syn keyword mcWorldborderKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcWorldborderSet            set
        syn match   mcWorldborderSet     contained skipwhite nextgroup=mcDoubleSpace,mcUInt                      /\(\d*\.\)\?\d\+/
syn keyword mcWorldborderKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcWorldborderAdd            add
        syn match   mcWorldborderAdd     contained skipwhite nextgroup=mcDoubleSpace,mcUInt                      /-\?\(\d*\.\)\?\d\+/
syn keyword mcWorldborderKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcWorldborderDamage         damage
        syn keyword mcWorldborderDamage  contained skipwhite nextgroup=mcDoubleSpace,mcUFloat                    amount buffer
syn keyword mcWorldborderKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcWorldborderWarning        warning
        syn keyword mcWorldborderWarning contained skipwhite nextgroup=mcDoubleSpace,mcUInt                      time distance

hi def link mcWorldborderKeyword        mcKeyword
hi def link mcWorldborderAdd            mcValue
hi def link mcWorldborderSet            mcValue
hi def link mcWorldborderDamage         mcKeyword
hi def link mcWorldborderWarning        mcKeyword

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

