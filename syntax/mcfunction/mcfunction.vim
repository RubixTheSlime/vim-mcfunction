if exists("b:current_syntax")
        finish
endif
let b:current_syntax = "mcfunction"

syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace


syn match   mcUInt              /\d\+/  contained
syn match   mcLineEnd           /\s*$/  contained
syn match   mcGlob              /\*/    contained
syn match   mcUFloat            /\(\d*\.\)\?\d\+/ contained
hi def link mcGlob              mcOp
hi def link mcUInt              mcValue
hi def link mcUFloat            mcValue
"TODO
syn match   mcInt32             /-\?\d\+/ contained
hi def link mcInt32 mcValue

syn keyword mcBool              contained true false
hi def link mcBool              mcValue

"TODO
syn match   mcJSONText          contained /.\+/
hi def link mcJSONText          mcString

" Can't have multiple spaces
syn match mcDoubleSpace / \@<= \+\| \{2,}/ contained containedin=ALLBUT,@mcNBT,mcChatMessage,@mcSelectorFilter,mcBlockState
hi def link mcDoubleSpace mcBadWhitespace

" Optional Slash
syn match mcOptionalSlash /^\/\?/ nextgroup=@mcCommand
hi def link mcOptionalSlash mcCommand
syn cluster mcCommand add=mcCommand

" Illegal Whitespace
syn match mcComment /^#.*/
syn match mcBadWhitespace /\t/

syn sync minlines=1
" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry

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
        execute 'syn match   mcNBTPath'.a:group           '/.\@1<=\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTPath'.a:group           'matchgroup=mcNBTQuote   start=/.\@1<="/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTArray'.a:group          'matchgroup=mcNBTBracket start=/.\@1<=\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
        execute 'syn region  mcNBTTagP'.a:group           'matchgroup=mcNBTBracket start=/.\@1<={/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.a:group ',mcNBTPathPad'.a:group
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
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcBool               doInsomnia doImmediateRespawn drowningDamage fallDamage fireDamage
syn keyword mcGamerule               contained skipwhite nextgroup=mcDoubleSpace,mcBool               do PatrolSpawning doTraderSpawning
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
" Spreadplayers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcEntitySpectateTarget spectate

call s:mcEntity('SpectateTarget','mcPlayer')

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

" Data Values
syn match   mcAdvancement                       /\(\w\+[:/]\)*\w\+/     contained contains=mcNamespace,mcBuiltinAdvancement
syn match   mcBlock                             /\(\w\+:\)*\w\+/        contained contains=mcNamespace,@mcBuiltinBlock nextgroup=mcBlockstate
syn match   mcBossbarId                         /\(\w[:./-]\)*\w\+/     contained contains=mcNamespace,mcBuiltinBossbarId
syn match   mcCraftableItem                     /\(\w\+:\)*\w\+/        contained contains=mcNamespace,@mcBuiltinCraftableItem
syn match   mcDimension                         /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinDimension
syn match   mcEffect                            /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEffect
syn match   mcEnchantment                       /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEnchantment
syn match   mcEntityType                        /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEntity
syn match   mcFunction                          /#\?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained contains=mcNamespace
syn match   mcItem                              /\(\w\+:\)*\w\+/        contained contains=mcNamespace,@mcBuiltinItem
syn match   mcObjective                         /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinObjective
syn match   mcParticle                          /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinParticle
syn match   mcSound                             /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinSound

syn match   mcAdvancementCriteria               /\(\w\+[.+-]\)*\w\+/    contained contains=mcBuiltinAdvancementCriteria
syn match   mcStorage                           /\(\w\+:\)*\w\+/        contained contains=mcNamespace
syn match   mcPredicate                         /\(\w\+:\)\?\w\+/        contained contains=mcNamespace
syn match   mcSoundChannel                      /\w\+/                  contained contains=mcBuiltinSoundChannel

syn match   mcNamespace                         /\w\+:/                 contained contains=mcBuiltinNamespace
hi def link mcAdvancement               mcValue
hi def link mcAdvancementCriteria       mcValue
hi def link mcBlock                     mcValue
hi def link mcBossbarId                 mcValue
hi def link mcDimension                 mcValue
hi def link mcEffect                    mcValue
hi def link mcEnchantment               mcValue
hi def link mcEntityType                mcValue
hi def link mcFunction                  mcValue
hi def link mcItem                      mcValue
hi def link mcObjective                 mcValue
hi def link mcParticle                  mcValue
hi def link mcPredicate                 mcValue
hi def link mcSound                     mcValue
hi def link mcStorage                   mcValue
hi def link mcNamespace                 mcValue

hi def link mcBlockStateBracket         mcBlockStateEq
hi def link mcBlockStateEq              mcFilterEq
hi def link mcBlockStateKeyword         mcFilterKeyword
hi def link mcBlockStateValue           mcFilterValue

syn match mcBadWhiteSpaceBlock / \ze[[{]/ contained
hi def link mcBadWhiteSpaceBlock mcBadWhitespace

" Scoreboard criteria
syn keyword mcCriteria contained air armor deathcount dummy food health level trigger xp playerKillCount
syn match   mcCriteria contained skipwhite nextgroup=mcAnySpace,mcTeamColor /teamkill\.\|killedByTeam./
syn match   mcTeamColor contained /\(light\|dark\)_purple\|\(dark_\)\?\(aqua\|blue\|gray\|green\|red\)\|black\|gold\|white\|yellow/
" item
syn match   mcCriteria contained /minecraft\.\(broken\|crafted\|dropped\|picked_up\|used\):minecraft\./ skipwhite nextgroup=mcAnySpace,mcBuiltinItem,mcBuiltinItemBlock
"block
syn match   mcCriteria contained /minecraft\.mined:minecraft\./ skipwhite nextgroup=mcAnySpace,mcBuiltinBlock,mcBuiltinItemBlock
" entity
syn match   mcCriteria contained /minecraft\.killed\(_by\)\?:minecraft\./ skipwhite nextgroup=mcAnySpace,mcBuiltinEntity
" custom things, this'll be a pain to maintain
syn match   mcCriteria contained /minecraft\.custom:/ skipwhite nextgroup=mcAnySpace,mcCriteriaCustomNamespace
syn match   mcCriteriaCustomNamespace contained /minecraft\./ skipwhite nextgroup=mcAnySpace,mcCriteriaCustom
syn match   mcCriteriaCustom contained /animals_bred\|bell_ring\|deaths\|eat_cake_slice\|enchant_item\|fill_cauldron\|fish_caught\|jump\|leave_game\|pot_flower\|sleep_in_bed\|sneak_time\|trigger_trapped_chest\|tune_noteblock\|use_cauldron/
syn match   mcCriteriaCustom contained /raid_\(trigger\|win\)/
syn match   mcCriteriaCustom contained /time_since_\(death\|rest\)/
syn match   mcCriteriaCustom contained /\(talked_to\|traded_with\)_villager/
syn match   mcCriteriaCustom contained /play_\(noteblock\|one_minute\|record\)/
syn match   mcCriteriaCustom contained /open_\(barrel\|\(ender_\)chest\)/
syn match   mcCriteriaCustom contained /\(mob\|player\)_kills/
syn match   mcCriteriaCustom contained /inspect_\(dropper\|hopper\|dispenser\)/
syn match   mcCriteriaCustom contained /clean_\(armor\|banner\|shulker_box\)/
syn match   mcCriteriaCustom contained /damage_\(\(dealt_\)\?\(absorbed\|resisted\)\|blocked_by_shield\|dealt\|taken\)/
syn match   mcCriteriaCustom contained /\(aviate\|boat\|climb\|crouch\|fall\|fly\|horse\|minecart\|pig\|sprint\|swim\|walk\(_\(on\|under\)_water\)\?\)_one_cm/
syn match   mcCriteriaCustom contained /interact_with_\(beacon\|blast_furnace\|brewingstand\|campfire\|c\(artography\|rafting\)_table\|furnace\|lectern\|loom\|smoker\)/
hi def link mcCriteriaCustomNamespace mcCriteria
hi def link mcCriteriaCustom mcCriteria
hi def link mcTeamColor      mcCriteria
hi def link mcCriteria       mcKeyValue

" Scoreboard displays
syn keyword mcScoreDisplay contained belowName list 
syn match   mcScoreDisplay contained /sidebar\ze[^.]/
syn match   mcScoreDisplay contained /sidebar\.team\./ skipwhite nextgroup=mcAnySpace,mcCriteriaTeam
hi def link mcScoreDisplay mcKeyValue

" Block States
syn region  mcBlockState                matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained skipwhite contains=mcBlockStateKeyword

" keywords
" TODO limit unsigned ints
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqUI          age bites delay distance eggs hatch layers level moisture note pickles power rotation stage honey_level
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
" From other files to reorganize
syn match   mcAdvancementNameFilter             contained skipwhite nextgroup=mcFilterEqAdvance                         /\(\w\|[/:]\)\+/        
syn match   mcAdvancementCriterionNameFilter    contained skipwhite nextgroup=mcFilterEqAdvance                         /\(\w\|[.+-]\)\+/       
hi def link mcAdvancementNameFilter     mcAdvancementName
hi def link mcAdvancementCriterionNameFilter    mcAdvanecmentCriterionName

hi def link mcFilterKeyValue            mcKeyValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterValue               mcValue

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
syn keyword mcFilterKeyword     contained predicate             skipwhite nextgroup=mcFilterEqPredicate

" ... = ...
syn match   mcFilterEqGamemode  contained /=/    skipwhite nextgroup=mcGamemode
syn match   mcFilterEqNBT       contained /=/    skipwhite nextgroup=mcNBTTag
syn match   mcFilterEqPredicate contained /=/    skipwhite nextgroup=mcPredicate
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
" I = integer
" U = unsigned integer
" UF = unsigned float
" R = range
" X = x rotation (-90 - 90)
" Y = y rotation (-180 - 180
" Inf = infinity
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
syn match   mcFilterRangeInf    contained /\.\.\s*\ze\_[,\]]=/

" Lists
syn region  mcFilterScores                      matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcObjectiveNameFilter
syn region  mcFilterAdvancements                matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementNameFilter
syn region  mcFilterAdvancementCriterion        matchgroup=mcSelector start=/{/rs=e end=/}/ contained contains=mcAdvancementCriterionNameFilter


" Links
hi def link mcFilterComma               mcFilterEq
hi def link mcFilterSort                mcKeyValue
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterEq                  mcEntity
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

" Namespace
syn match mcBuiltinNamespace contained /minecraft:/

hi def link mcBuiltin                   mcKeyValue
hi def link mcBuiltinNamespace          mcBuiltin
hi def link mcBuiltinBlock              mcBuiltin
hi def link mcBuiltinDimension          mcBuiltin
hi def link mcBuiltinEffect             mcBuiltin
hi def link mcBuiltinEnchantment        mcBuiltin
hi def link mcBuiltinEntity             mcBuiltin
hi def link mcBuiltinItem               mcBuiltin

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blocks
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinBlock mcKeyValue
syn cluster mcBuiltinBlock contains=mcBuiltinBlock,mcBuiltinItemBlock,mcBuiltinCraftableItemBlock
syn keyword mcBuiltinBlock contained dirt

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dimensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcBuiltinDimension contained overworld the_nether the_end

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchantments
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic
syn keyword mcBuiltinEnchantment contained mending unbreaking
" Curse
syn keyword mcBuiltinEnchantment contained vanishing_curse binding_curse 
" Armor
syn keyword mcBuiltinEnchantment contained thorns respiration projectile_protection protection frost_walker fire_protection feather_falling depth_strider bane_of_arthropods aqua_affinity 
" Tool
syn keyword mcBuiltinEnchantment contained fortune efficiency silk_touch
" Sword/Axe
syn keyword mcBuiltinEnchantment contained looting knockback fire_aspect sharpness smite sweeping
" Bow
syn keyword mcBuiltinEnchantment contained infinity flame power punch
" Triden
syn keyword mcBuiltinEnchantment contained loyalty impaling channeling riptide
" Crossbow
syn keyword mcBuiltinEnchantment contained multishot piercing quick_charge
" Rod
syn keyword mcBuiltinEnchantment contained lure luck_of_the_sea

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entities
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Villagers/Illagers
syn keyword mcBuiltinEntity contained villager evoker wandering_trader illusioner pillager ravager vex vindicator witch
" Undead Mobs
syn keyword mcBuiltinEntity contained drowned giant husk phantom skeleton stray wither_skeleton
" Arthropods
syn keyword mcBuiltinEntity contained cave_spider endermite silverfish spider zombie zombie_pigman zombie_villager
" Other hostile Mobs
syn keyword mcBuiltinEntity contained blaze creeper elder_guardian enderman ghast guardian magma_cube shulker slime 
" Ambient/Aquatic Mobs
syn keyword mcBuiltinEntity contained bat cod dolphin salmon squid tropical_fish turtle pufferfish
" Horses
syn keyword mcBuiltinEntity contained horse zombie_horse skeleton_horse donkey mule llama trader_llama
" Passive Mobs
syn keyword mcBuiltinEntity contained cat chicken cow fox mooshroom ocelot panda parrot pig polar_bear rabbit sheep villager wandering_trader wolf
" Utility etc Mobs
syn keyword mcBuiltinEntity contained iron_golem snow_golem wither ender_dragon player
" Projectiles
syn keyword mcBuiltinEntity contained arrow dragon_fireball egg ender_pearl experience_bottle eye_of_ender fireball firework_rocket llama_spit potion shulker_bullet small_fireball snowball spectral_arrow trident wither_skull
" Boats/Carts
syn keyword mcBuiltinEntity contained boat chest_minecart furnace_minecart command_block_minecart hopper_minecart minecart spawner_minecart tnt_minecart
" Misc
syn keyword mcBuiltinEntity contained area_effect_cloud armor_stand end_crystal evoker_fangs item_frame leash_knot painting falling_block tnt experience_orb item

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Effects
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcBuiltinEffect contained absorption bad_omen blindness conduit_power dolphins_grace fire_resistance glowing haste health_boost hero_of_the_village hunger instant_health instant_damage invisibility jump_boost levitation luck mining_fatigue nausea night_vision poison regeneration resistance saturation slow_falling slowness speed strength unluck water_breathing weakness wither

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Items
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn cluster mcBuiltinItem contains=mcBuiltinItem,mcBuiltinCraftableItem,mcBuiltinItemBlock,mcBuiltinCraftableItemBlock
syn cluster mcBuiltinCraftableItem contains=mcBuiltinCraftableItem,mcBuiltinCraftableItemBlock
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Craftable Items
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinCraftableItem mcBuiltinBlock
syn keyword mcBuiltinCraftableItem contained bread
syn match   mcBuiltinCraftableItem contained /\(red\|pink\|magenta\|purple\|blue\|cyan\|\(ligth_\)\?blue\|green\|lime\|yellow\|orange\|brown\|black\|\(ligth_\)\?gray\|gray\|white\)_dye/

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Craftable Items/Blocks
" Many items and blocks are the same
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinCraftableItemBlock mcBuiltinItem
syn match mcBuiltinCraftableItemBlock contained /\(red\|pink\|magenta\|purple\|blue\|cyan\|\(ligth_\)\?blue\|green\|lime\|yellow\|orange\|brown\|black\|\(ligth_\)\?gray\|gray\|white\)_\(banner\|bed\|carpet\|concrete\(_powder\)\?\|\(glazed_\)terracotta\|shulker_box\|stained_glass\(_pane\)\?\|wool\)/ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncraftable Items
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcBuiltinItem contained apple

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncraftable Items/Blocks
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinItemBlock mcBuiltinItem
syn keyword mcBuiltinItemBlock contained dragon_egg

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Particles
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sounds
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sound channels
""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link mcBuiltinSoundChannel mcKeyWord
syn keyword mcBuiltinSoundChannel contained ambient block hostile master music neutral player record voice weather
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

hi def link mcNBTIndex                  mcNBTPathDot
hi def link mcNBTPath                   mcKeyValue
hi def link mcNBTPathDot                mcNBTBracket
hi def link mcNBTQuote                  mcNBTPath
hi def link mcNBTString                 mcNBTValue

" For debugging purposes
syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath
