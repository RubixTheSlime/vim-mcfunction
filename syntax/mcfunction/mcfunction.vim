if exists("b:current_syntax")
        finish
endif

if (!exists('g:mcEnableBuiltinJSON') || g:mcEnableBuiltinJSON)
        syn match   mcJSONText          contained /.\+/ contains=@mcjson
        syn match   mcjsonNumber        contained /\v-?(0|[1-9]\d*)(\.\d*)?([eE](0|[1-9]\d*))?/
        hi def link mcjsonNumber        jsonNumber
        syn include @mcJSON syntax/json.vim
        syn cluster mcJSON add=mcjsonNumber,jsonString

        " Proof that at some point we should be able to add our own 'special' keywords
        "syn keyword mcjsonKeyword contained containedin=jsonKeyword color
        "hi def link mcjsonKeyword mcKeyword

        let b:current_syntax='mcfunction'
endif

syn match mcAnySpace contained / /
hi def link mcAnySpace mcBadWhitespace
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h').'/'

" MC Version identifier
function! s:toNumericVersion(name)
        if a:name =~ '\c\<c\%[ombat]'
                let l:num = matchstr(a:name,'\d\+$')
                if l:num == 1
                        return s:toNumericVersion('1.14.3p4')
                elseif l:num == 2
                        return s:toNumericVersion('1.14.4')
                elseif l:num == 3
                        return s:toNumericVersion('1.14.4')
                elseif l:num == 4
                        return s:toNumericVersion('1.15p3')
                elseif l:num == 5
                        return s:toNumericVersion('1.15.2p2')
                endif
        elseif a:name =~ '\c\d\dw\d\d\w'
                let l:year=matchstr(a:name,'^\c\d\+\zew')
                let l:week=matchstr(a:name,'\cw\zs\d\+')
                let l:day=tr(substitute(matchstr(a:name,'\a$'),'^','\L',''), 'zabcdefghi', '0123456789')
                return l:year*10000 + l:week*100 + l:day
        else
                let l:result=0
                if a:name =~ '1.13.1'
                        return s:addOffset('18w33',a:name)
                elseif a:name =~ '1.13.2'
                        return s:addOffset('18w42',a:name)
                elseif a:name =~ '1.13'
                        return s:addOffset('18w23',a:name)
                elseif a:name =~ '1.14.1'
                        return s:addOffset('19w19',a:name)
                elseif a:name =~ '1.14.2'
                        return s:addOffset('19w20',a:name)
                elseif a:name =~ '1.14.3'
                        return s:addOffset('19w23',a:name)
                elseif a:name =~ '1.14.4'
                        return s:addOffset('19w27',a:name)
                elseif a:name =~ '1.14'
                        return s:addOffset('19w15',a:name)
                elseif a:name =~ '1.15.1'
                        return s:addOffset('19w50',a:name)
                elseif a:name =~ '1.15.2'
                        return s:addOffset('20w03',a:name)
                elseif a:name =~ '1.15'
                        return s:addOffset('19w47',a:name)
                elseif a:name =~ '1.16'
                        return s:addOffset('20w23',a:name)
                endif
        endif
endfunction

function! s:addOffset(snapshot,name)
        let l:result=s:toNumericVersion(a:snapshot)
        " take the week the first prerelease occurs converted to a string,
        " add 30+n for prereleases, 60+n for release candidates, 99 for release.

        " and hope and pray mojang doesn't start two prerelease sequences in one week.
        if a:name =~ '\cp'
                " prerelease 
                return l:result + 30 + matchstr(a:name,'\d\+$')
        elseif a:name =~ '\cc'
                " release candidate
                return l:result + 60 + matchstr(a:name,'\d\+$')
        else
                " release
                return l:result + 99
        endif
endfunction

function! s:atLeastVersion(version)
        return s:toNumericVersion(a:version) <= g:numericVersion
endfunction

" Determine minecraft version
if !exists('g:mcversion')
        let g:mcversion='release'
endif
let g:numericVersion=0
let s:combatVersion=0

if g:mcversion=~'\<l\%[atest]\>'
        let g:numericVersion = 9999999
else
        let s:versions = readfile(s:path.'currentmcversions')
        let s:auto = 0
        if g:mcversion=~'\<r\%[elease]\>'
                let g:numericVersion= max([g:numericVersion,s:toNumericVersion(s:versions[0])])
                let s:auto = 1
        endif
        if g:mcversion=~'\<p\%[rerelease]\>'
                let g:numericVersion= max([g:numericVersion,s:toNumericVersion(s:versions[1])])
                let s:auto = 1
        endif
        if g:mcversion=~'\<s\%[napshot]\>'
                let g:numericVersion= max([g:numericVersion,s:toNumericVersion(s:versions[2])])
                let s:auto = 1
        endif
        if g:mcversion=~'\<e\%[xperimental]\>'
                let g:numericVersion= max([g:numericVersion,s:toNumericVersion(s:versions[3])])
                let s:auto = 1
        endif
        if g:mcversion=~'\<c\%[andidate]\>'
                let g:numericVersion= max([g:numericVersion,s:toNumericVersion(s:versions[4])])
                let s:auto = 1
        endif
        if !s:auto
                let g:numericVersion = s:toNumericVersion(g:mcversion)
        endif
endif

" Determine the experimental combat version
if g:mcversion =~ '\<e\%[xperimental]\>\'
        let s:combatVersion=9999999
elseif g:mcversion =~ '|\<c\%[ombat]'
        let s:combatVersion=matchstr(g:mcversion,'\<c\%[ombat]\s*\zs\d\+')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Values
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match   mcUInt              /\d\+/  contained
syn match   mcLineEnd           /\s*$/  contained
syn match   mcGlob              /\*/    contained
syn match   mcUFloat            /\(\d*\.\)\?\d\+/ contained
syn match   mcFloat             /-\?\(\d*\.\)\?\d\+/ contained
hi def link mcGlob              mcOp
hi def link mcUInt              mcValue
hi def link mcUFloat            mcValue
hi def link mcFloat            mcValue
"TODO
syn match   mcInt32             /-\?\d\+/ contained
hi def link mcInt32 mcValue

syn keyword mcBool              contained true false
hi def link mcBool              mcKeyValue

" Can't have multiple spaces
syn match mcDoubleSpace / \@<= \+\| \{2,}/ contained containedin=ALLBUT,@mcNBT,mcChatMessage,@mcSelectorFilter,mcBlockState
hi def link mcDoubleSpace mcBadWhitespace

" Optional Slash
syn match mcOptionalSlash /^\/\?/ nextgroup=@mcCommand
hi def link mcOptionalSlash mcCommand
syn cluster mcCommand add=mcCommand

" Illegal Whitespace
syn match mcBadWhitespace /\t/

syn sync minlines=1

syn match mcComment /^#.*/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entity Block
" initializes both Entity and Block with respective keywords
" not to be confused with a 'Block Entity'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcSelectorBlock(group,nextgroup)
        execute 'syn keyword mcSelectorBlock'.a:group 'entity contained skipwhite nextgroup=mcDoubleSpace,mcSelector'.a:group
        execute 'syn keyword mcSelectorBlock'.a:group 'block contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate'.a:group
        call s:addInstance('Selector',a:group,a:nextgroup)
        call s:addInstance('Coordinate',a:group,a:nextgroup)
        execute 'hi def link mcSelectorBlock'.a:group 'mcKeyword'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Entity Block Storage
" initializes all three similarly to EntityBlock
" not to be confused with a 'Block Entity'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:mcEBS(group,nextgroup)
        execute 'syn keyword mcEBS'.a:group 'entity contained skipwhite nextgroup=mcDoubleSpace,mcSelector'.a:group
        execute 'syn keyword mcEBS'.a:group 'block contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate'.a:group
        call s:addInstance('Selector',a:group,a:nextgroup)
        call s:addInstance('Coordinate',a:group,a:nextgroup)
        if s:atLeastVersion('19w38a')
                execute 'syn keyword mcEBS'.a:group 'storage contained skipwhite nextgroup=mcDoubleSpace,mcStorage'.a:group
                call s:addInstance('Storage',a:group,a:nextgroup)
        endif
        execute 'hi def link mcEBS'.a:group 'mcKeyword'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taggable thing
" for blocks, items, and entities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:addTaggableInstance(type,group,nextgroup)
        execute 'syn match mcTaggable'.a:type.a:group '/[^ =,\]\t\r\n]\+/ contained skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup 'contains=@mcTaggable'.a:type
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add Instance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:addInstance(type,group,nextgroup)
        if a:type=~ 'Selector'
                execute 'syn match mc'.a:type.a:group 'contained /\v\S+(\[[^\]]*\])?\ze\_[ ]/   contains=mc'.a:type 'skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        elseif a:type=~ 'Coordinate'
                execute 'syn match mc'.a:type.a:group 'contained /\v(\S+\s+){2}\S+/             contains=mc'.a:type 'skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        elseif a:type=~ 'Column|Rotation'
                execute 'syn match mc'.a:type.a:group 'contained /\S\+\s\+\S\+/                 contains=mc'.a:type 'skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        elseif a:type=~ 'NBTPath'
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
        elseif a:type=~ 'NBTTag'
                execute 'syn region  mcNBTTag'.a:group 'matchgroup=mcNBTBracket start=/.\@1<={/rs=e end=/}/ oneline contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,mcNBTPad'.a:group
                execute 'syn cluster mcNBT add=mcNBTTag'.a:group
                execute 'syn match   mcNBTPad'.a:group '/\ze\_[ ]/ skipwhite contained nextgroup=mcDoubleSpace,'.a:nextgroup
        elseif a:nextgroup == ""
                execute 'syn match mc'.a:type.a:group '/[^ =,\t\r\]\n]\+/ contained contains=mc'.a:type
        else
                execute 'syn match mc'.a:type.a:group '/[^ =,\t\r\]\n]\+/ contained contains=mc'.a:type 'skipwhite nextgroup=mcDoubleSpace,'.a:nextgroup
        endif
endfunction

call s:addInstance('NBTPath',"","")
call s:addInstance('NBTTag','','')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SP COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advancement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand advancement contained skipwhite nextgroup=mcDoubleSpace,mcAdvanceKeyword

syn keyword mcAdvanceKeyword                contained skipwhite nextgroup=mcDoubleSpace,mcSelectorAdvance         grant revoke
call s:addInstance('Selector',"Advance","mcAdvanceWhich")
syn keyword mcAdvanceWhich                  contained                                                           everything
syn keyword mcAdvanceWhich                  contained skipwhite nextgroup=mcDoubleSpace,mcNsAdvancementViaCriteria   only
        call s:addInstance('NsAdvancement','ViaCriteria','mcAdvancementCriteria')
syn keyword mcAdvanceWhich              contained skipwhite nextgroup=mcDoulbleSpace,mcAdvancement      from through until

hi def link mcAdvanceWhich          mcKeyword
hi def link mcAdvanceKeyword        mcKeyword


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Attribute
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('20w17a')
syn keyword mcCommand attribute contained skipwhite nextgroup=mcDoubleSpace,mcSelectorAttr
call s:addInstance('Selector','Attr','mcNsAttributeAttr')
call s:addInstance('NsAttribute','Attr','mcAttrKeyword')
syn keyword mcAttrKeyword                       contained skipwhite nextgroup=mcDoubleSpace,mcFloat             get

syn keyword mcAttrKeyword                       contained skipwhite nextgroup=mcDoubleSpace,mcAttrBaseKeyword   base
        syn keyword mcAttrBaseKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcFloat             get set

syn keyword mcAttrKeyword                       contained skipwhite nextgroup=mcDoubleSpace,mcAttrModKeyword    modifier
        syn keyword mcAttrModKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcAttrModGet        value
                syn keyword mcAttrModGet        contained skipwhite nextgroup=mcDoubleSpace,mcUUIDAttrModScale  get
                call s:addInstance('UUID','AttrModScale','mcFloat')
        syn keyword mcAttrModKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcUUID              remove
        syn keyword mcAttrModKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcUUIDAttrModAdd    add
                call s:addInstance('UUID','AttrModAdd','mcAttrModAddName')
                syn match   mcAttrModAddName    contained skipwhite nextgroup=mcDoubleSpace,mcFloatAttrModAdd   /'\([^\\']\|\\[\\']\)*'/
                syn match   mcAttrModAddName    contained skipwhite nextgroup=mcDoubleSpace,mcFloatAttrModAdd   /"\([^\\"]\|\\[\\"]\)*"/
                syn match   mcAttrModAddName    contained skipwhite nextgroup=mcDoubleSpace,mcFloatAttrModAdd   /[a-zA-Z0-9_.+-]\+/
                call s:addInstance('Float','AttrModAdd','mcAttrModAddMode')
                syn keyword mcAttrModAddMode    contained skipwhite nextgroup=mcDoubleSpace,mcFloatAttrModAdd   add multiply multiply_base

hi def link mcAttrKeyword               mcKeyword
hi def link mcAttrBaseKeyword            mcKeyword
hi def link mcAttrModGet                mcKeyword
hi def link mcAttrModKeyword            mcKeyword
hi def link mcAttrModAddMode            mcKeyword

hi def link mcAttrModAddName            mcValue
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bossbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand bossbar contained skipwhite nextgroup=mcDoubleSpace,mcBossbarKeyword

" Bossbar add
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcNsBossbarIdAdd add
call s:addInstance('NsBossbarId','Add','mcJSONText')

" Bossbar get
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcNsBossbarIdGet get
call s:addInstance('NsBossbarId','Get','mcBossbarGetKeyword')
syn keyword mcBossbarGetKeyword contained                                                  max players value visible

" Bossbar list
syn keyword mcBossbarKeyword    contained                                                  list

" Bossbar remove
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcNsBossbarId    remove

" Bossbar set
syn keyword mcBossbarKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcBossbarIdSet set
call s:addInstance('NsBossbarId','Set','mcBossbarSetKeyword')

syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcBossbarSetColor   color
        syn keyword mcBossbarSetColor   contained                                                       blue green pink purple red white yellow
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcUInt              max value
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcJSONText          name
syn keyword mcBossbarSetKeyword         contained skipwhite nextgroup=mcDoubleSpace,mcSelector            players
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
syn keyword mcCommand clear contained skipwhite nextgroup=mcDoubleSpace,mcPlayerSelectorClear

call s:addInstance('PlayerSelector',"Clear","mcNsTItemClear")
call s:addInstance('NsTItem','Clear','mcUInt')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clone
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand clone contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateClone

call s:addInstance('Coordinate',  "Clone","mcCoordinate2Clone")
call s:addInstance('Coordinate2', "Clone","mcCoordinate3Clone")
call s:addInstance('Coordinate3', "Clone","mcCloneMask")

syn keyword mcCloneMask         masked replace          contained skipwhite nextgroup=mcDoubleSpace,mcCloneMode
syn keyword mcCloneMask         filtered                contained skipwhite nextgroup=mcDoubleSpace,mcNsTBlockClone
hi def link mcCloneMask         mcKeyword
call s:addInstance('NsTBlock','Clone','mcCloneMode')

syn keyword mcCloneMode         force move normal       contained
hi def link mcCloneMode         mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Debug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('1.14.4p1')
        syn keyword mcCommand debug contained skipwhite nextgroup=mcDoubleSpace,mcDebugKeyword
        syn keyword mcDebugKeyword contained report
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand data contained skipwhite nextgroup=mcDoubleSpace,mcDataKeyword


" Data get
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataGet    get
call s:mcEBS('DataGet','@mcNBTPathDataGet')
call s:addInstance('NBTPath',"DataGet","mcDataGetScale")
syn match   mcDataGetScale      contained                                                       /-\?\d*\.\?\d\+/

" Data merge
syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataMerge    merge
call s:mcEBS('DataMerge','mcNBTTag')

" Data modify
if s:atLeastVersion('18w43a')

syn keyword mcDataKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcEBSDataModify    modify
call s:mcEBS('DataModify','@mcNBTPathDataModify')
call s:addInstance('NBTPath',"DataModify","mcDataModifyHow")

syn keyword mcDataModifyHow             contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource  append merge prepend set
        syn keyword mcDataModifySource  contained skipwhite nextgroup=mcDoubleSpace,@mcNBTValue         value
        syn keyword mcDataModifySource  contained skipwhite nextgroup=mcDoubleSpace,mcDataKeywordRemove from

syn keyword mcDataModifyHow             contained skipwhite nextgroup=mcDoubleSpace,mcDataModifyIndex   insert
        syn match   mcDataModifyIndex   contained skipwhite nextgroup=mcDoubleSpace,mcDataModifySource  /\d\+/

endif
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
syn keyword mcEffectKeyword give        contained skipwhite nextgroup=mcDoubleSpace,mcSelectorEffectGive
call s:addInstance('Selector', "EffectGive", "mcNsEffectGive")
call s:addInstance('NsEffect','Give','mcEffectSeconds')
syn match   mcEffectSeconds /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcEffectAmp
syn match   mcEffectAmp     /\d\+/      contained skipwhite nextgroup=mcDoubleSpace,mcBool

" Effect clear
syn keyword mcEffectKeyword clear       contained skipwhite nextgroup=mcDoubleSpace,mcSelectorEffectClear
call s:addInstance('Selector', "EffectClear", "mcEffect")

" Links
hi def link mcEffectKeyword mcKeyword
hi def link mcEffectSeconds mcValue
hi def link mcEffectAmp     mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enchant
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand enchant contained skipwhite nextgroup=mcDoubleSpace,mcSelectorEnchant

call s:addInstance('Selector',"Enchant", "mcNsEnchantmentEnchant")

call s:addInstance('NsEnchantment','Enchant','mcEnchantLevel')
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
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecute                             at as
call s:addInstance('Selector',"Execute", "mcExecuteKeyword")

" Execute facing
syn keyword mcExecuteKeyword             contained skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingEntityKeyword,mcCoordinate facing
syn keyword mcExecuteFacingEntityKeyword contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecuteFacing                     entity
call s:addInstance('Selector', "ExecuteFacing", "mcExecuteAnchoredValue")

" Execute in
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcNsDimensionExecute                          in
call s:addInstance("NsDimension","ExecuteIn","mcExecuteKeyword")

" Execute positioned
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecute,mcExecutePosAs          positioned
syn keyword mcExecutePosAs              contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecute                             as
call s:addInstance('Coordinte',"Execute","mcExecuteKeyword")

" Execute rotated
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcRotationExecute,mcExecuteAsKeyword        rotated
call s:addInstance('Rotation',"Execute","mcExecuteKeyword")

" Execute run
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcCommand                                   run

" Execute store
"""""""""""""""""""""""""
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhat                          store
syn keyword mcExecuteStoreWhat          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreWhere,mcEBSExecuteStore       result success

" block/entity
call s:mcEBS('ExecuteStore','@mcNBTPathExecuteStore')
call s:addInstance('NBTPath',"ExecuteStore","mcExecuteStoreType")
syn keyword mcExecuteStoreType          contained skipwhite nextgroup=mcDoubleSpace,mcExecuteStoreScale                 byte short int long float double
syn match   mcExecuteStoreScale         contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                   /-\?\d*\.\?\d\+/

" bossbar
syn keyword mcExecuteStoreWhere         contained skipwhite nextgroup=mcDoubleSpace,mcNsBossbarIdExecuteStore             bossbar
call s:addInstance('NsBossbarId','ExecuteStore','mcExecuteStoreBossbarFeild')
syn keyword mcExecuteStoreBossbarFeild  contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                   max value

" score
syn keyword mcExecuteStoreWhere         contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecuteStoreScore           score
call s:addInstance('Selector',"ExecuteStoreScore", "mcObjectiveExecuteStore")
call s:addInstance("Objective","ExecuteStore","mcExecuteKeyword")



" Execute if/unless
"""""""""""""""""""""""
syn keyword mcExecuteKeyword            contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCond                       if unless

" block
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondBlock        block
call s:addInstance('Coordinate',"ExecuteCondBlock","mcNsTBlockExecute")
call s:addInstance("NsTBlock","Execute","mcExecuteKeyword")

" blocks
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondStart        blocks
call s:addInstance('Coordinate',"ExecuteCondStart","mcCoordinateExecuteCondEnd")
call s:addInstance('Coordinate2',"ExecuteCondEnd","mcCoordinateExecuteCondDest")
call s:addInstance('Coordinate3',"ExecuteCondDest","mcExecuteCondBlocksMask")
syn keyword mcExecuteCondBlocksMask     contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword                    all masked

" data
if s:atLeastVersion('18w43a')
        syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcEBSExecuteCondData        data
        call s:mcEBS('ExecuteCondData','@mcNBTPathExecute')
        call s:addInstance('NBTPath', "Execute","mcExecuteKeyword")
endif

" entity
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecuteCond                 entity
call s:addInstance('Selector', "ExecuteCond", "mcExecuteKeyword")

" score
syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecuteCondScoreTarget      score
call s:addInstance('Selector', "ExecuteCondScoreTarget","mcObjectiveExecuteCondScoreTarget")
call s:addInstance('Objective','ExecuteCondScoreTarget','mcExecuteCondScoreOp,mcExecuteCondScoreMatch')
syn match   mcExecuteCondScoreOp        contained skipwhite nextgroup=mcDoubleSpace,mcSelectorExecuteCondScoreSource      /[<>=]\@=[<>]\?=\?/
        call s:addInstance('Selector', "ExecuteCondScoreSource","mcObjectiveExecuteCondScoreSource")
        call s:addInstance('Objective','ExecuteCondScoreSource','mcExecuteKeyword')
syn keyword mcExecuteCondScoreMatch     contained skipwhite nextgroup=mcDoubleSpace,mcExecuteIR1,mcExecuteIR2           matches
        syn match   mcExecuteIR1                /-\?\d\+/               contained skipwhite nextgroup=mcDoubleSpace,mcExecuteRangeInf,mcExecuteIR2,mcExecuteKeyword
        syn match   mcExecuteIR2                / \@!\.\.-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword
        syn match   mcExecuteRangeInf           /\.\.\_[ ]/             contained skipwhite nextgroup=mcDoubleSpace,mcExecuteKeyword

" predicate
if s:atLeastVersion('19w38a')
        syn keyword mcExecuteCond               contained skipwhite nextgroup=mcDoubleSpace,mcNsPredicateExecuteCond              predicate
        call s:addInstance('NsPredicate','ExecuteCond','mcExecuteKeyword')
endif

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
syn keyword mcCommand fill contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateFill

call s:addInstance('Coordinate', "Fill","mcCoordinate2Fill")
call s:addInstance('Coordinate2', "Fill","mcNsBlockFill")
call s:addInstance('NsBlock',"Fill","mcFillMode")
syn keyword mcFillMode contained                                                        destroy hollow keep outline
syn keyword mcFillMode contained skipwhite nextgroup=mcDoubleSpace,mcNsTBlockFillReplace   replace
        call s:addInstance('NsTBlock',"FillReplace","")

" Links
hi def link mcFillMode          mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Forceload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand forceload contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword

" Forceload add
syn keyword mcForceloadKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart                       add
call s:addInstance('Column',"ForceloadStart","mcColumn2")

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
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,mcSelector
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gamerule
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand gamerule contained skipwhite nextgroup=mcDoubleSpace,mcGamerule

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand give contained skipwhite nextgroup=mcDoubleSpace,mcPlayerSelectorGive

call s:addInstance('PlayerSelector',"Give", "mcNsTItemGive")
call s:addInstance('NsTItem','Give','mcNBTTagGive')
call s:addInstance('NBTTag',"Give","mcUInt")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand help contained skipwhite nextgroup=mcDoubleSpace,mcUInt,mcHelpCommand

" Help commands (why am i even including this, or UUID highlighting for that matter)
" (i guess you could /execute store result ... run help for a message generator)
syn keyword mcHelpCommand contained advancement bossbar clear clone data datapack debug defaultgamemode difficulty effect enchant execute experience fill forceload function gamemode gamerule give help kill list locate loot me msg paraticle playsound recipe reload replaceitem say scoreboard seed setblock setworldspawn spawnpoint spreadplayers stopsound summon tag team teleport teammsg tell tellraw time title tp trigger w weather worldborder xp
if s:atLeastVersion('18w43a')
        if s:atLeastVersion('18w45a')
                syn keyword mcHelpCommand contained loot
        else
                syn keyword mcHelpCommand contained drop
        endif
        syn keyword mcHelpCommand contained schedule
endif
hi def link mcHelpCommand mcKeyValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kick
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand kill contained skipwhite nextgroup=mcDoubleSpace,mcSelectorKick
call s:addInstance('Selector','Kick','mcChatMessage')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand kill contained skipwhite nextgroup=mcDoubleSpace,mcSelector


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand list contained skipwhite nextgroup=mcDoubleSpace,mcListUUIDs

syn keyword mcListUUIDs         contained uuids
hi def link mcListUUIDs         mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand locate contained skipwhite nextgroup=mcDoubleSpace,mcLocatableStructure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locatebiome
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('20w06a')
syn keyword mcCommand locate contained skipwhite nextgroup=mcDoubleSpace,mcBiome
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('18w43a')
        if s:atLeastVersion('18w45a')
                syn keyword mcCommand loot contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword
        else
                syn keyword mcCommand drop contained skipwhite nextgroup=mcDoubleSpace,mcLootTargetKeyword
        endif

        if !s:atLeastVersion('18w44a')
                " TODO add /drop award
        endif
" Target
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLoot                            spawn insert
        call s:addInstance('Coordinate', "Loot","mcLootSourceKeyword")
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcSelectorLoot                        give
        call s:addInstance('Selector', "Loot", "mcLootSourceKeyword")
syn keyword mcLootTargetKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcSelectorBlockLootReplace            replace
        call s:mcSelectorBlock('LootReplace','mcSlotLoot')
        call s:addInstance('Slot','Loot','mcLootCount,mcLootSourceKeyword')
        syn match   mcLootCount         contained skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword                 /0*\(6[0-4]\|[1-5]\?\d\)/ "0-64

" Source
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcLootTableFish                             fish
        syn match   mcLootTableFish             contained skipwhite nextgroup=mcDoubleSpace,mcLootFishingLocation contains=mcNamespace  /\(\w\|:\)\+/
        syn match   mcLootFishingLocation       contained skipwhite nextgroup=mcDoubleSpace,mcNsItem,mcLootHand                         /\w\+/
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcLootTable                                 loot
        syn match   mcLootTable                 contained contains=mcNamespace                                                          /\(\w\|:\)\+/
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcSelector                                  kill
syn keyword mcLootSourceKeyword                 contained skipwhite nextgroup=mcDoubleSpace,mcCoordinateLootMine                        mine
        call s:addInstance('Coordinate', "LootMine","mcNsItem,mcLootHand")
syn keyword mcLootHand                          contained                                                                               mainhand offhand

" Links
hi def link mcLootTargetKeyword         mcKeyword
hi def link mcLootReplaceKeyword        mcKeyword
hi def link mcLootSourceKeyword         mcKeyword
hi def link mcLootHand                  mcKeyword

hi def link mcLootTableFish             mcLootTable
hi def link mcLootTable                 mcValue
hi def link mcLootFishingLocation       mcValue

hi def link mcLootCount                 mcUInt

endif 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Msg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand msg w tell me  contained skipwhite nextgroup=mcDoubleSpace,mcSelectorMsg
syn keyword mcCommand say                       contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage
if s:atLeastVersion('19w02a')
        syn keyword mcCommand teammsg tm contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage
endif

call s:addInstance('Selector', "Msg", "mcChatMessage")

syn match   mcChatMessage       /.*/    contained

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Particle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcNsParticleParticle particle

call s:addInstance('NsParticle', 'Particle','mcCoordinateParticle')
call s:addInstance('Coordinate', 'Particle','mcCoordinate2Particle')
call s:addInstance('Coordinate2', 'Particle','mcParticleSpeed')
syn match   mcParticleSpeed contained skipwhite nextgroup=mcDoubleSpace,mcParticleCount /\(\d*\.\)\?\d\+/
syn match   mcParticleCount contained skipwhite nextgroup=mcDoubleSpace,mcParticleMode  /\d\+/
syn keyword mcParticleMode  contained skipwhite nextgroup=mcDoubleSpace,mcSelector        force normal

hi def link mcParticleSpeed mcUFloatValue
hi def link mcParticleCount mcUIntValue
hi def link mcParticleMode  mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Playsound
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcNsSoundPlay playsound

call s:addInstance('NsSound','Play','mcSoundChannelPlay')
call s:addInstance('SoundChannel','Play','mcSelectorPlaysound')
call s:addInstance('Selector', 'Playsound','mcCoordinatePlaysound')
call s:addInstance('Coordinate', 'Playsound','mcPlaysoundVolume')

syn match   mcPlaysoundVolume    contained skipwhite nextgroup=mcDoubleSpace,mcPlaysoundPitch     /\(\d*\.\)\?\d\+/
syn match   mcPlaysoundPitch     contained skipwhite nextgroup=mcDoubleSpace,mcPlaysoundMinVolume /0*1\?\.\d\+\|0*2\(\.0*\)\?\ze\_[ ]/
syn match   mcPlaysoundMinVolume contained                                                        /0*\.\d\+\|0*1\(\.0*\)\?\ze\_[ ]/

hi def link mcPlaysoundVolume    mcUFloatValue
hi def link mcPlaysoundPitch     mcUFloatValue
hi def link mcPlaysoundMinVolume mcUFloatValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Recipe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcRecipeKeyword recipe

syn keyword mcRecipeKeyword contained skipwhite nextgroup=mcDoubleSpace,mcSelectorRecipe give take
call s:addInstance('Selector', 'Recipe','mcRecipe,mcGlob')
hi def link mcRecipeKeyword mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ReplaceItem
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSelectorBlockReplaceitem replaceitem

call s:mcSelectorBlock('Replaceitem','mcSlotReplaceitem')
call s:addInstance('Slot','Replaceitem','mcNsItemReplaceitem')
call s:addInstance('NsItem','Replaceitem','mcUInt')

hi def link mcReplaceitemWhere mcKeyword
hi def link mcReplaceitemSlot  mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Schedule
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('18w43a')

        syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcScheduleKeyword schedule

        syn keyword mcScheduleKeyword contained skipwhite nextgroup=mcDoubleSpace,mcNamespacedFunctionSchedule    function
        call s:addInstance('NamespacedFunction','Schedule','mcScheduleTime')
        syn match   mcScheduleTime    contained skipwhite nextgroup=mcDoubleSpace,mcScheduleMode        /\d\+[dst]\?/

        if s:atLeastVersion('19w38a')
                syn keyword mcScheduleKeyword contained skipwhite nextgroup=mcDoubleSpace,mcFunction            clear
                syn keyword mcScheduleMode    contained append replace
                hi def link mcScheduleMode    mcKeyword
        endif

        hi def link mcScheduleKeyword mcKeyword
        hi def link mcScheduleTime    mcValue

endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scoreboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand scoreboard contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardKeyword

" players
syn keyword mcScoreboardKeyword contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardPlayers         players
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcSelectorScoreboardSet       add remove set
        call s:addInstance('Selector', 'ScoreboardSet','mcObjectiveScoreboardSet')
        call s:addInstance('Objective','ScoreboardSet','mcInt32')
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcSelectorScoreboardGet       enable reset get
        call s:addInstance('Selector', 'ScoreboardGet','mcObjective')
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcSelector                    list
syn keyword mcScoreboardPlayers contained skipwhite nextgroup=mcDoubleSpace,mcSelectorScoreboardOp        operation
        call s:addInstance('Selector', 'ScoreboardOp','mcObjectiveScoreboardOpTarget')
        call s:addInstance('Objective','ScoreboardOpTarget','mcScoreboardOp')
        syn match mcScoreboardOp contained skipwhite nextgroup=mcDoubleSpace,mcSelectorScoreboardGet      /[%*/+-]\?=\|><\?\|</

" objectives
syn keyword mcScoreboardKeyword    contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardObjectives           objectives

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveObjAdd                add
        call s:addInstance('Objective','ObjAdd','mcCriteriaObjAdd')
        call s:addInstance('Criteria','ObjAdd','mcJSONText')

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace                                  list

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveObjModify             modify
        call s:addInstance('Objective','ObjModify','mcScoreboardModifyWhat')
        syn keyword mcScoreboardModifyWhat contained skipwhite nextgroup=mcDoubleSpace,mcJSONText               displayname
        syn keyword mcScoreboardModifyWhat contained skipwhite nextgroup=mcDoubleSpace,mcScoreboardModifyRender rendertype
        syn keyword mcScoreboardModifyRender contained                                                          hearts integer

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcObjective                      remove

syn keyword mcScoreboardObjectives contained skipwhite nextgroup=mcDoubleSpace,mcScoreDisplaySet                setdisplay
        call s:addInstance('ScoreDisplay','Set','mcObjective')

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

call s:addInstance('Column','Spread','mcUFloatSpreadDistance')
call s:addInstance('UFloat','SpreadDistance','mcUFloatSpreadRange')
call s:addInstance('UFloat','SpreadRange','mcBoolSpreadRespect,mcSpreadUnder')
call s:addInstance('Bool','SpreadRespect','mcPlayerSelector')

if s:atLeastVersion('20w21a')
        syn keyword mcSpreadUnder        contained skipwhite nextgroup=mcDoubleSpace,mcUIntSpreadHeight           under
        call s:addInstance('UInt','SpreadHeight','mcSpreadRespect')
        hi def link mcSpreadUnder        mcKeyword
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spectate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if s:atLeastVersion('19w41a')
        syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSelectorSpectateTarget spectate
        call s:addInstance('Selector', 'SpectateTarget','mcPlayerSelector')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stopsound
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSelectorStopsound stopsound

call s:addInstance('Selector', 'StopSound','mcSoundChannelStopSound,mcStopsoundGlob')
call s:addInstance('SoundChannel','StopSound','mcNsSound')
syn match mcStopsoundGlob /\*/ contained skipwhite nextgroup=mcSound
hi def link mcStopsoundGlob mcOp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSelectorTag tag

call s:addInstance('Selector', 'Tag','mcTagKeyword')
syn keyword mcTagKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTag add remove
syn keyword mcTagKeyword contained                                         list
syn match mcTag /\w\+/ contained

hi def link mcTagKeyword mcKeyword
hi def link mcTag mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Team
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcTeamKeyword team

syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcSelector          leave
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamAdd         add
        call s:addInstance('Team','Add','mcJSONText')
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeam            empty remove list
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamJoin        join
        call s:addInstance('Team','Join','mcSelector')
syn keyword mcTeamKeyword contained skipwhite nextgroup=mcDoubleSpace,mcTeamModify      modify
        call s:addInstance('Team','Modify','mcTeamModifyHow')

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
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcSelectorTellraw tellraw

call s:addInstance('Selector', 'Tellraw','mcJSONText')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Time
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcTimeKeyword time

syn keyword mcTimeKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcTimeQuery         query
        syn keyword mcTimeQuery contained skipwhite                                             day daytime gametime
syn keyword mcTimeKeyword       contained skipwhite nextgroup=mcDoubleSpace,mcTimeAdd           add
if s:atLeastVersion('18w43a')
        syn match   mcTimeAdd   contained skipwhite                                             /\(\d*\.\)\?\d\+[dst]\?/
else
        syn match   mcTimeAdd   contained skipwhite                                             /\d\+/
endif
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

call s:addInstance('Coordinate', "Setblock","mcNsBlockSetblock")
syn keyword mcSetblockMode      contained destroy keep replace
call s:addInstance('NsBlock',"Setblock","mcSetblockMode")

hi def link mcSetblockMode      mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spawnpoint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand spawnpoint contained skipwhite nextgroup=mcDoubleSpace,mcSelectorSpawnPos
call s:addInstance('Selector', "SpawnPos","mcCoordinate")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setworldspawn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand setworldspawn contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Summon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand summon contained skipwhite nextgroup=mcDoubleSpace,mcNsEntitySummon

call s:addInstance("NsEntity","Summon","mcCoordinateSummon")
call s:addInstance('Coordinate', "Summon","mcNBTTag")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand title contained skipwhite nextgroup=mcDoubleSpace,mcSelectorTitle

call s:addInstance('Selector', "Title","mcTitleKeyword")

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
hi def link mcTitleTime    mcValue
hi def link mcTitleTime2   mcValue
hi def link mcTitleTime3   mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand tp teleport contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate,mcSelectorTpTarget

" Entity is defined in the entity area
call s:addInstance('Coordinate', "Tp","mcTpFacing,mcRotation2")
syn keyword mcTpFacing contained skipwhite nextgroup=mcDoubleSpace,mcCoordinate2 facing
hi def link mcTpFacing mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCommand contained skipwhite nextgroup=mcDoubleSpace,mcObjectiveTrigger trigger

" no namespace
call s:addInstance('Objective','Trigger','mcTriggerMode')
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

syn keyword mcXpKeyword query           contained skipwhite nextgroup=mcDoubleSpace,mcSelectorXpQuery
        call s:addInstance('Selector', "XpQuery", "mcXpUnit")

syn keyword mcXpKeyword add set         contained skipwhite nextgroup=mcDoubleSpace,mcSelectorXpSet
        call s:addInstance('Selector', "XpSet", "mcXpAmount")
        syn match   mcXpAmount  /-\?\d\+/       contained skipwhite nextgroup=mcDoubleSpace,mcXpUnit

syn keyword mcXpUnit    points levels   contained

hi def link mcXpAmount  mcValue
hi def link mcXpUnit    mcKeyword
hi def link mcXpKeyword mcKeyword

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MP COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (!exists(g:mcEnableMP) || g:mcEnableMP) && s:atLeastVersion('1.14.4p4')
        " function-permission-level wasn't available until 1.14.4p4, so
        " functions couldn't use any of these commands
        syn keyword mcCommand   contained                                                               save-on save-off stop
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcSaveKW                    save-all 
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcBanlistKW                 banlist 
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcSelectorKick              ban
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcSelectorKick,mcIPBan      ban-ip
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcSelector,mcIP             pardon-ip
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcSelector                  pardon op
        syn keyword mcCommand   contained skipwhite nextgroup=mcDoubleSpace,mcUInt                      setidletimeout publish
        syn match   mcIPBan     contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage               /\v%(%([0-1]?\d{1,2}|2%([0-4]\d|5[0-5]))\.){4}/
        syn match   mcIP        contained skipwhite nextgroup=mcDoubleSpace                             /\v%(%([0-1]?\d{1,2}|2%([0-4]\d|5[0-5]))\.){4}/
        syn keyword mcSaveKW    contained flush
        syn keyword mcBanlistKW contained ips players
        hi def link mcSaveKW    mcKeyword
        hi def link mcBanlistKW mcKeyword
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scoreboard Criteria
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcCriteria contained air armor deathcount dummy food health level trigger xp playerKillCount
syn match   mcCriteria contained skipwhite nextgroup=mcAnySpace,mcTeamColor /teamkill\.\|killedByTeam./
syn match   mcTeamColor contained /\(light\|dark\)_purple\|\(dark_\)\?\(aqua\|blue\|gray\|green\|red\)\|black\|gold\|white\|yellow/
" item
syn match   mcCriteria contained /minecraft\.\(broken\|crafted\|dropped\|picked_up\|used\):minecraft\./ skipwhite nextgroup=mcAnySpace,mcItem
"block
syn match   mcCriteria contained /minecraft\.mined:minecraft\./ skipwhite nextgroup=mcAnySpace,mcBlock
" entity
syn match   mcCriteria contained /minecraft\.killed\(_by\)\?:minecraft\./ skipwhite nextgroup=mcAnySpace,mcEntity
"custom things
syn match   mcCriteria contained /minecraft\.custom:/ skipwhite nextgroup=mcAnySpace,mcCustomCriteria,mcCriteriaCustomNamespace
syn match   mcCriteriaCustomNamespace contained /minecraft\./ skipwhite nextgroup=mcAnySpace,mcCustomCriteria
hi def link mcCriteriaCustomNamespace mcCriteria
"hi def link mcCriteriaCustom mcCriteria
hi def link mcTeamColor      mcCriteria
hi def link mcCriteria       mcKeyId

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scoreboard Displays
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword mcScoreDisplay contained belowName list
syn match   mcScoreDisplay contained /sidebar\ze[^.]/
syn match   mcScoreDisplay contained /sidebar\.team\./ skipwhite nextgroup=mcAnySpace,mcCriteriaTeam
hi def link mcScoreDisplay mcKeyValue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Block States
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn region  mcBlockState                matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained skipwhite contains=mcBlockStateKeyword

" keywords
" TODO limit unsigned ints
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
if s:atLeastVersion('19w34a')
        syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqUI  honey_level
endif

" values
syn match   mcBlockStateValueUI         contained skipwhite     /\d\+/
syn match   mcBlockStateValueShape      contained skipwhite     /ascending_\(north\|east\|south\|west\)\|east_west\|north_south\|\(inner\|outer\)_\(left\|right\)\|\(nort\|south\)_\(east\|west\)\|straight/
syn keyword mcBlockStateValueBool       contained skipwhite     true false
syn keyword mcBlockStateValueAttachment contained skipwhite     ceiling double_wall floor single_wall
syn keyword mcBlockStateValueAxis       contained skipwhite     x y z
syn keyword mcBlockStateValueCardinal   contained skipwhite     true false none side up
if s:atLeastVersion('20w06a')
syn keyword mcBlockStateValueCardinal   contained skipwhite     tall low
endif
syn keyword mcBlockStateValueFace       contained skipwhite     ceiling floor wall
syn keyword mcBlockStateValueFacing     contained skipwhite     up down north east south west
syn keyword mcBlockStateValueHalf       contained skipwhite     lower upper bottom top
syn keyword mcBlockStateValueHinge      contained skipwhite     left right
syn keyword mcBlockStateValueInstrument contained skipwhite     basedrum bass bell chime flute guitar harp hat pling snare xylophone
if s:atLeastVersion('19w09a')
        syn keyword mcBlockStateValueInstrument contained skipwhite     iron_xylophone cow_bell didgeridoo bit banjo
endif
syn keyword mcBlockStateValueLeaves     contained skipwhite     large none small
syn keyword mcBlockStateValueMode       contained skipwhite     compare subtract corner data load save
syn keyword mcBlockStateValuePart       contained skipwhite     foot head
syn keyword mcBlockStateValueType       contained skipwhite     normal sticky left right single bottom double top

for x in split('UI Bool Attachment Axis Cardinal Face Facing Half Hinge Instrument Leaves Mode Part Shape Type',' ')
        execute 'syn match   mcBlockStateEq'.x '/=/ contained skipwhite nextgroup=mcBlockStateValue'.x
        execute 'hi def link mcBlockStateEq'.x 'mcBlockStateEq'
        execute 'hi def link mcBlockStateValue'.x 'mcBlockStateValue'
endfor

hi def link mcBlockStateBracket         mcOp
hi def link mcBlockStateEq              mcOp
hi def link mcBlockStateKeyword         mcKeyword
hi def link mcBlockStateValue           mcValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
syn match   mcFilterEqPredicate contained /=/    skipwhite nextgroup=mcNsPredicate
syn match   mcFilterEqSort      contained /=/    skipwhite nextgroup=mcFilterSort
syn match   mcFilterEqScores    contained /=/    skipwhite nextgroup=mcFilterScores
syn match   mcFilterEqAdvances  contained /=/    skipwhite nextgroup=mcFilterAdvancements
syn match   mcFilterEqScore     contained /=/    skipwhite nextgroup=mcFilterIR1,mcFilterIR2
syn match   mcFilterEqAdvance   contained /=/    skipwhite nextgroup=mcFilterAdvancementCriterion,mcBool
syn match   mcFilterEqName      contained /=!\?/ skipwhite nextgroup=mcPlayerName
syn match   mcFilterEqTeam      contained /=!\?/ skipwhite nextgroup=mcTeam
syn match   mcFilterEqType      contained /=!\?/ skipwhite nextgroup=mcNsTEntity
syn match   mcFilterEqTag       contained /=!\?/ skipwhite nextgroup=mcTag
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
syn region  mcFilterScores                      matchgroup=mcOp start=/{/rs=e end=/}/ oneline contained contains=mcObjectiveNameFilter
syn region  mcFilterAdvancements                matchgroup=mcOp start=/{/rs=e end=/}/ oneline contained contains=mcNsAdvancementFilter
call s:addInstance('NsAdvancement','Filter','mcFilterEqAdvance')
syn region  mcFilterAdvancementCriterion        matchgroup=mcOp start=/{/rs=e end=/}/ oneline contained contains=mcAdvancementCriterion


" Links
hi def link mcFilterKeyword             mcKeyword
hi def link mcFilterKeyValue            mcKeyValue
hi def link mcFilterSort                mcKeyValue
hi def link mcFilterValue               mcValue
hi def link mcFilterEq                  mcOp

hi def link mcFilterUI                  mcFilterValue
hi def link mcFilterF                   mcFilterValue
hi def link mcFilterRangeInf            mcFilterValue
hi def link mcFilterComma               mcFilterEq

for x in split('Gamemode NBT Tag Sort Scores Advances Score Advance Name Team Type Tag F UI UFR XR YR', ' ')
        execute 'hi def link mcFilterEq'.x 'mcFilterEq'
endfor
for x in split('IR UIR UFR XR YR', ' ')
        execute 'hi def link mcFilter'.x.'1' 'mcFilterValue'
        execute 'hi def link mcFilter'.x.'2' 'mcFilterValue'
endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data Values
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for s:x in split('Advancement AdvancementCriteria Attribute Block BossbarId CustomCriteria Dimension Effect Enchantment Entity Function Item Slot LocatableStructure Objective Particle Predicate Recipe Sound SoundChannel Storage Structure UUID',' ')
        execute 'syn match mcNs'.s:x '/[^ =,\t\r\n\]]\+/ contained contains=mcNamespace,mc'.s:x
        execute 'syn match mcNamespaced'.s:x '/\w\+:[^ =,\t\r\n\]]\+/ contained contains=mcNamespace,mc'.s:x
        execute 'hi def link mc'.s:x 'mcId'
        execute 'hi def link mcBuiltin'.s:x 'mcKeyId'
        if s:x =~ '\cblock'
                execute 'syn match mc'.s:x '/\w\+/ contained contains=mcBuiltin'.s:x 'nextgroup=mcBlockstate'
        elseif s:x =~ '\cuuid'
                execute 'syn match mc'.s:x '/\v\x{1,8}-(\x{1,4}-){3}\x{1,12}/ contained contains=mcBuiltin'.s:x
        else
                execute 'syn match mc'.s:x '/[^ =,\t\r\n\]]\+/ oneline contained contains=mcBuiltin'.s:x
        endif
endfor

"Tags
for s:x in split('Block Entity Item',' ')
        "TODO mcTNsThing mcTThing mcTNamespacedThing (tags and atoms are both allowed)
        execute 'syn match mcNsT'.s:x '/#\?\(\w\+:\)\?\w\+/ contained contains=mcNsTag'.s:x.',mcNs'.s:x
        execute 'syn match mcNsTag'.s:x '/#\(\w\+:\)\?\w\+/ contained contains=mcNamespace,mcBuiltinTag'.s:x
        execute 'syn match mcNamespacedT'.s:x '/#\?\w\+:\w\+/ contained contains=mcNamespacedTag'.s:x.',mcNamespaced'.s:x
        execute 'syn match mcNamespacedTag'.s:x '/#\w\+:\w\+/ contained contains=mcNamespace,mcBuiltinTag'.s:x
        execute 'hi def link mcTag'.s:x 'mcId'
        execute 'hi def link mcNsTag'.s:x 'mcId'
        execute 'hi def link mcNamespacedTag'.s:x 'mcId'
        execute 'hi def link mcBuiltinTag'.s:x 'mcKeyId'
        if s:x =~ '\cblock'
                syn match mcTagBlock /#\w\+/ contained contains=mcBuiltinTagBlock nextgroup=mcBlockstate
                syn match mcTBlock /#\?\w\+/ contained contains=mcTagBlock,mcBlock nextgroup=mcBlockstate
        else
                execute 'syn match mcTag'.s:x '/#\w\+/ oneline contained contains=mcBuiltinTag'.s:x
                execute 'syn match mcT'.s:x '/#\?\w\+/ oneline contained contains=mcTag'.s:x.',mc'.s:x
        endif
endfor

hi def link mcTagBlock mcId

syn match mcBadWhiteSpaceBlock / \ze[[{]/ contained
hi def link mcBadWhiteSpaceBlock mcBadWhitespace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Namespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match mcNamespace /\w\+:/ contained contains=mcBuiltinNamespace
hi def link mcNamespace mcId
syn match mcBuiltinNamespace contained /minecraft:/
hi def link mcBuiltinNamespace mcKeyId

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Builtins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:addBuiltin(type,match)
        execute 'syn match mcBuiltin'.a:type 'contained `\v(<'.substitute(a:match,'(','%(','g').'>)`'
endfunction
function! s:addBuiltinTag(type,match)
        execute 'syn match mcBuiltinTag'.a:type 'contained `\v(<'.substitute(a:match,'(','%(','g').'>)`'
endfunction
function! s:addGamerule(name, values)
        if a:values != ''
                execute 'syn keyword mcGamerule' a:name 'contained skipwhite nextgroup=mcDoubleSpace,mcGameruleValue'.a:name
                execute 'syn match   mcGameruleValue'.a:name a:values 'contained'
                execute 'hi def link mcGameruleValue'.a:name 'mcValue'
        else
                execute 'syn keyword mcGamerule' a:name 'contained skipwhite nextgroup=mcDoubleSpace,mcBool'
        endif
endfunction

if (!exists('g:mcEnableBuiltinIDs') || g:mcEnableBuiltins)
	let s:files = split(globpath(s:path.'data','*'),'\n')
	for s:file in s:files
		let s:filename = fnamemodify(s:file,':t:r')
		let s:lines = readfile(s:file)
		for s:line in s:lines
			let s:line = substitute(s:line,'".*','','')
			if s:line =~ '^\s*\("\|$\)'
				"just whitespace/comment, skip
			elseif s:line =~ '^!'
				let g:ver = substitute(s:line,'!','','')
				let g:numver = s:toNumericVersion(g:ver)
				if s:toNumericVersion(g:ver) > g:numericVersion
					break
				endif
			elseif s:line =~'!' && s:atLeastVersion(matchstr(s:line,'!\zs.\+$'))
				" the item is no longer part of the game
			elseif s:filename =='things'
				let s:parts = split(s:line, '\s\+')
				" Block
				if s:parts[0] =~ 'b'    | call s:addBuiltin(   'Block', s:parts[1]) | endif
				if s:parts[0] =~ 'B'    | call s:addBuiltinTag('Block', s:parts[1]) | endif
				" Recipe
				if s:parts[0] =~ '[cr]' | call s:addBuiltin('Recipe',   s:parts[1]) | endif
				" Item
				if s:parts[0] =~ '[ci]' | call s:addBuiltin(   'Item',  s:parts[1]) | endif
				if s:parts[0] =~ 'I'    | call s:addBuiltinTag('Item',  s:parts[1]) | endif
				" Spawn Egg
				if s:parts[0] =~ 'm'    | call s:addBuiltin('Item',     s:parts[1].'_spawn_egg') | endif
				" Entity
				if s:parts[0] =~ '[me]' | call s:addBuiltin(   'Entity',s:parts[1]) | endif
				if s:parts[0] =~ 'E'    | call s:addBuiltinTag('Entity',s:parts[1]) | endif
			elseif s:filename == 'Gamerule'
				call s:addGamerule(matchstr(s:line,'^\S\+\>'), matchstr(s:line,'/.\{-}/'))
			elseif s:filename == 'Criteria'
				call s:addBuiltin('CustomCriteria',matchstr(s:line, '^[^!]*'))
			elseif s:filename == 'Structure'
				call s:addBuiltin('Structure',matchstr(s:line,'^\*\?\zs\S*\>'))
				if s:line =~ '^\*'
					if s:atLeastVersion('20w21a')
						call s:addBuiltin('LocatableStructure',matchstr(s:line,'^\*\?\zs\S*\>'))
					else
						" it would be very consistent if it weren't for EndCity
						if s:line=~ 'endcity'
							call s:addBuiltin('LocatableStructure','EndCity')
						else
							call s:addBuiltin('LocatableStructure',substitute(matchstr(s:line,'^\*\?\zs\S*\>'), '\(^\|_\)\zs\a', '\u&', 'g'))
						endif
					endif
				endif
			else
				call s:addBuiltin(s:filename,matchstr(s:line, '^[^!]*'))
			endif
		endfor
	endfor
endif

" literally the only difference in the entire experimental snapshots so far
if s:combatVersion >= 3
        addBuiltin('Enchantment','chopping')
        addBuiltin('Attribute','attack_reach')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selectors and Coordinates
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selector
syn match   mcSelector contained /\w\{3,16}\>-\@1!/
syn match   mcSelector contained /@[eaprs]\>\[\@1!/
syn match   mcSelector contained /\x\{1,8}-\(\x\{1,4}-\)\{3}\x\{1,12}/
syn region  mcSelector contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

"This one requires a special name regex
"Don't touch it just works
syn match   mcSelectorTpTarget contained /\v<(\d+(\s+[0-9~.-]+){1,2}\s*$)\@!\w{3,16}>-\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcSelector
syn match   mcSelectorTpTarget contained /@[eaprs]\>\[\@1!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcSelector
syn match   mcSelectorTpTarget contained /\x\{1,8}-\(\x\{1,4}-\)\{3}\x\{1,12}/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcSelector
syn region  mcSelectorTpTarget contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,mcSelector
hi def link mcSelectorTpTarget mcSelector

" Player Selector
syn match   mcPlayerSelector contained /\w\{3,16}\>-\@1!/
syn match   mcPlayerSelector contained /@[aprs]\>\[\@1!/
syn match   mcPlayerSelector contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn match   mcPlayerSelector contained /\x\{1,8}-\(\x\{1,4}-\)\{3}\x\{1,12}/
syn region  mcPlayerSelector contained matchgroup=mcPlayerSelector start=/@[aprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite
hi def link mcPlayerSelector mcSelector
syn match   mcPlayerName contained /\w\{3,16}\>-\@!/

" Coordinate
syn match mcCoordinate  contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){3}|( *\^-?\d*\.?\d*){3}/  contains=mcDoubleSpace
syn match mcCoordinate2 contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){3}|( *\^-?\d*\.?\d*){3}/  contains=mcDoubleSpace
syn match mcCoordinate3 contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){3}|( *\^-?\d*\.?\d*){3}/  contains=mcDoubleSpace

" Column
syn match mcColumn     contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){2}|( *\^-?\d*\.?\d*){2}/     contains=mcDoubleSpace
syn match mcColumn2    contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){2}|( *\^-?\d*\.?\d*){2}/     contains=mcDoubleSpace
hi def link mcColumn                    mcCoordinate
hi def link mcColumn2                   mcCoordinate2

" Rotation
syn match mcRotation   contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){2}/ contains=mcDoubleSpace
syn match mcRotation2  contained /\v( *(\~[0-9.-]@1!|\~?-?(\d*\.)?\d+)){2}/ contains=mcDoubleSpace
hi def link mcRotation                  mcCoordinate
hi def link mcRotation2                 mcCoordinate2

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NBT Parts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO maybe add pre 18w43a stuff
syn match   mcNBTIndex          /\s*\d\+\s*/                                                            contained
syn match   mcNBTComma          /,/                                                                     contained
syn match   mcNBTColon          /:/                                                                     contained skipwhite nextgroup=@mcNBTValue
syn match   mcNBTTagKey         /\w\+/                                                                  contained skipwhite nextgroup=mcNBTColon
syn region  mcNBTTagKey         matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/            oneline contained skipwhite nextgroup=mcNBTColon
syn keyword mcNBTBool           true false                                                              contained
syn match   mcNBTValue          /-\?\d*\.\?\d\+[bBsSlLfFdD]\?\>/                                        contained
syn match   mcNBTString         /\(\d*\h\)\@=\w*/                                                       contained
if s:atLeastVersion('19w08a')
        syn region  mcNBTString         matchgroup=mcNBTValueQuote   start=/"/ end=/"/ skip=/\\"/       oneline contained
endif
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

hi def link mcNBTIndex          mcNBTPathDot
hi def link mcNBTPath           mcKeyValue
hi def link mcNBTPathDot        mcNBTBracket
hi def link mcNBTQuote          mcNBTPath
hi def link mcNBTString         mcNBTValue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (!exists('g:mcDebugging') || g:mcDebugging)
        syn keyword mcCommand contained skipwhite nextgroup=mcNBTKW    nbt
        syn keyword mcNBTKW   contained skipwhite nextgroup=mcNBTTag   tag
        syn keyword mcNBTKW   contained skipwhite nextgroup=@mcNBTPath path
        hi def link mcNBTKW mcKeyword

        syn keyword mcCommand contained skipwhite nextgroup=mcdbBlockKw,mcNsTBlock block
        syn keyword mcdbBlockKw contained skipwhite nextgroup=mcTBlock N
        syn keyword mcdbBlockKw contained skipwhite nextgroup=mcNamespacedTBlock n

        syn keyword mcCommand contained skipwhite nextgroup=mcCoordinate coord
        syn keyword mcCommand contained skipwhite nextgroup=mcSelector ent
        syn keyword mcCommand contained skipwhite nextgroup=mcColumn col
endif
