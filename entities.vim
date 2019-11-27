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

"hi def link mcPlayerNameAdvancement                     mcPlayerName
"hi def link mcPlayerNameClear                           mcPlayerName
"hi def link mcPlayerNameDataGet                         mcPlayerName
"hi def link mcPlayerNameDataMerge                       mcPlayerName
"hi def link mcPlayerNameDataModify                      mcPlayerName
"hi def link mcPlayerNameDataRemove                      mcPlayerName
"hi def link mcPlayerNameEffectClear                     mcPlayerName
"hi def link mcPlayerNameEffectGive                      mcPlayerName
"hi def link mcPlayerNameEnchant                         mcPlayerName
"hi def link mcPlayerNameExecute                         mcPlayerName
"hi def link mcPlayerNameExecuteCond                     mcPlayerName
"hi def link mcPlayerNameExecuteCondData                 mcPlayerName
"hi def link mcPlayerNameExecuteCondScoreSource          mcPlayerName
"hi def link mcPlayerNameExecuteCondScoreTarget          mcPlayerName
"hi def link mcPlayerNameExecuteFacing                   mcPlayerName
"hi def link mcPlayerNameExecuteStore                    mcPlayerName
"hi def link mcPlayerNameExecuteStoreScore               mcPlayerName
"hi def link mcPlayerNameGive                            mcPlayerName
"hi def link mcPlayerNameLoot                            mcPlayerName
"hi def link mcPlayerNameLootReplace                     mcPlayerName
"hi def link mcPlayerNameMsg                             mcPlayerName
"hi def link mcPlayerNameTpFacing                        mcPlayerName
"hi def link mcPlayerNameTpTarget                        mcPlayerName
"hi def link mcPlayerNameXpQuery                         mcPlayerName
"hi def link mcPlayerNameXpSet                           mcPlayerName
hi def link mcSelectorAdvancement                       mcSelector
hi def link mcSelectorClear                             mcSelector
hi def link mcSelectorDataGet                           mcSelector
hi def link mcSelectorDataMerge                         mcSelector
hi def link mcSelectorDataModify                        mcSelector
hi def link mcSelectorDataRemove                        mcSelector
hi def link mcSelectorEffectClear                       mcSelector
hi def link mcSelectorEffectGive                        mcSelector
hi def link mcSelectorEnchant                           mcSelector
hi def link mcSelectorExecute                           mcSelector
hi def link mcSelectorExecuteCond                       mcSelector
hi def link mcSelectorExecuteCondData                   mcSelector
hi def link mcSelectorExecuteCondScoreSource            mcSelector
hi def link mcSelectorExecuteCondScoreTarget            mcSelector
hi def link mcSelectorExecuteFacing                     mcSelector
hi def link mcSelectorExecuteStore                      mcSelector
hi def link mcSelectorExecuteStoreScore                 mcSelector
hi def link mcSelectorGive                              mcSelector
hi def link mcSelectorLoot                              mcSelector
hi def link mcSelectorLootReplace                       mcSelector
hi def link mcSelectorMsg                               mcSelector
hi def link mcSelectorTpFacing                          mcSelector
hi def link mcSelectorTpTarget                          mcSelector
hi def link mcSelectorXpQuery                           mcSelector
hi def link mcSelectorXpSet                             mcSelector
hi def link mcUUIDAdvancement                           mcUUID
hi def link mcUUIDClear                                 mcUUID
hi def link mcUUIDDataGet                               mcUUID
hi def link mcUUIDDataMerge                             mcUUID
hi def link mcUUIDDataModify                            mcUUID
hi def link mcUUIDDataRemove                            mcUUID
hi def link mcUUIDEffectClear                           mcUUID
hi def link mcUUIDEffectGive                            mcUUID
hi def link mcUUIDEnchant                               mcUUID
hi def link mcUUIDExecute                               mcUUID
hi def link mcUUIDExecuteCond                           mcUUID
hi def link mcUUIDExecuteCondData                       mcUUID
hi def link mcUUIDExecuteCondScoreSource                mcUUID
hi def link mcUUIDExecuteCondScoreTarget                mcUUID
hi def link mcUUIDExecuteFacing                         mcUUID
hi def link mcUUIDExecuteStore                          mcUUID
hi def link mcUUIDExecuteStoreScore                     mcUUID
hi def link mcUUIDGive                                  mcUUID
hi def link mcUUIDLoot                                  mcUUID
hi def link mcUUIDLootReplace                           mcUUID
hi def link mcUUIDMsg                                   mcUUID
hi def link mcUUIDTpFacing                              mcUUID
hi def link mcUUIDTpTarget                              mcUUID
hi def link mcUUIDXpQuery                               mcUUID
hi def link mcUUIDXpSet                                 mcUUID
syn cluster mcEntity                                    add=mcSelector                                  add=mcPlayerName                                add=mcUUID                              add=mcSelectorFilter
syn cluster mcEntityAdvancement                         add=mcSelectorAdvancement                       add=mcPlayerNameAdvancement                     add=mcUUIDAdvancement                   add=mcSelectorFilterAdvancement
syn cluster mcEntityClear                               add=mcSelectorClear                             add=mcPlayerNameClear                           add=mcUUIDClear                         add=mcSelectorFilterClear
syn cluster mcEntityDataGet                             add=mcSelectorDataGet                           add=mcPlayerNameDataGet                         add=mcUUIDDataGet                       add=mcSelectorFilterDataGet
syn cluster mcEntityDataMerge                           add=mcSelectorDataMerge                         add=mcPlayerNameDataMerge                       add=mcUUIDDataMerge                     add=mcSelectorFilterDataMerge
syn cluster mcEntityDataModify                          add=mcSelectorDataModify                        add=mcPlayerNameDataModify                      add=mcUUIDDataModify                    add=mcSelectorFilterDataModify
syn cluster mcEntityDataRemove                          add=mcSelectorDataRemove                        add=mcPlayerNameDataRemove                      add=mcUUIDDataRemove                    add=mcSelectorFilterDataRemove
syn cluster mcEntityEffectClear                         add=mcSelectorEffectClear                       add=mcPlayerNameEffectClear                     add=mcUUIDEffectClear                   add=mcSelectorFilterEffectClear
syn cluster mcEntityEffectGive                          add=mcSelectorEffectGive                        add=mcPlayerNameEffectGive                      add=mcUUIDEffectGive                    add=mcSelectorFilterEffectGive
syn cluster mcEntityEnchant                             add=mcSelectorEnchant                           add=mcPlayerNameEnchant                         add=mcUUIDEnchant                       add=mcSelectorFilterEnchant
syn cluster mcEntityExecute                             add=mcSelectorExecute                           add=mcPlayerNameExecute                         add=mcUUIDExecute                       add=mcSelectorFilterExecute
syn cluster mcEntityExecuteCond                         add=mcSelectorExecuteCond                       add=mcPlayerNameExecuteCond                     add=mcUUIDExecuteCond                   add=mcSelectorFilterExecuteCond
syn cluster mcEntityExecuteCondData                     add=mcSelectorExecuteCondData                   add=mcPlayerNameExecuteCondData                 add=mcUUIDExecuteCondData               add=mcSelectorFilterExecuteCondData
syn cluster mcEntityExecuteCondScoreSource              add=mcSelectorExecuteCondScoreSource            add=mcPlayerNameExecuteCondScoreSource          add=mcUUIDExecuteCondScoreSource        add=mcSelectorFilterExecuteCondScoreSource
syn cluster mcEntityExecuteCondScoreTarget              add=mcSelectorExecuteCondScoreTarget            add=mcPlayerNameExecuteCondScoreTarget          add=mcUUIDExecuteCondScoreTarget        add=mcSelectorFilterExecuteCondScoreTarget
syn cluster mcEntityExecuteFacing                       add=mcSelectorExecuteFacing                     add=mcPlayerNameExecuteFacing                   add=mcUUIDExecuteFacin                  add=mcSelectorFilterExecuteFacing
syn cluster mcEntityExecuteStore                        add=mcSelectorExecuteStore                      add=mcPlayerNameExecuteStore                    add=mcUUIDExecuteStore                  add=mcSelectorFilterExecuteStore
syn cluster mcEntityExecuteStoreScore                   add=mcSelectorExecuteStoreScore                 add=mcPlayerNameExecuteStoreScore               add=mcUUIDExecuteStoreScore             add=mcSelectorFilterExecuteStoreScore
syn cluster mcEntityGive                                add=mcSelectorGive                              add=mcPlayerNameGive                            add=mcUUIDGive                          add=mcSelectorFilterGive
syn cluster mcEntityLoot                                add=mcSelectorLoot                              add=mcPlayerNameLoot                            add=mcUUIDLoot                          add=mcSelectorFilterLoot
syn cluster mcEntityLootReplace                         add=mcSelectorLootReplace                       add=mcPlayerNameLootReplace                     add=mcUUIDLootReplace                   add=mcSelectorFilterLootReplace
syn cluster mcEntityMsg                                 add=mcSelectorMsg                               add=mcPlayerNameMsg                             add=mcUUIDMsg                           add=mcSelectorFilterMsg
syn cluster mcEntityTpFacing                            add=mcSelectorTpFacing                          add=mcPlayerNameTpFacing                        add=mcUUIDTpFacing                      add=mcSelectorFilterTpFacing
syn cluster mcEntityTpTarget                            add=mcSelectorTpTarget                          add=mcPlayerNameTpTarget                        add=mcUUIDTpTarget                      add=mcSelectorFilterTpTarget
syn cluster mcEntityXpQuery                             add=mcSelectorXpQuery                           add=mcPlayerNameXpQuery                         add=mcUUIDXpQuery                       add=mcSelectorFilterXpQuery
syn cluster mcEntityXpSet                               add=mcSelectorXpSet                             add=mcPlayerNameXpSet                           add=mcUUIDXpSet                         add=mcSelectorFilterXpSet
syn match   mcPlayerName                                contained /\w\{3,16}\>-\@!/
syn match   mcPlayerNameAdvancement                     contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcAdvancementWhich
syn match   mcPlayerNameClear                           contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemClear
syn match   mcPlayerNameDataGet                         contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn match   mcPlayerNameDataMerge                       contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn match   mcPlayerNameDataModify                      contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn match   mcPlayerNameDataRemove                      contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn match   mcPlayerNameEffectClear                     contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEffect
syn match   mcPlayerNameEffectGive                      contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEffectGive
syn match   mcPlayerNameEnchant                         contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEnchantment
syn match   mcPlayerNameExecute                         contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcPlayerNameExecuteCond                     contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcPlayerNameExecuteCondData                 contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn match   mcPlayerNameExecuteCondScoreSource          contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreSource
syn match   mcPlayerNameExecuteCondScoreTarget          contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreTarget
syn match   mcPlayerNameExecuteFacing                   contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn match   mcPlayerNameExecuteStore                    contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn match   mcPlayerNameExecuteStoreScore               contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteStore
syn match   mcPlayerNameGive                            contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemGive
syn match   mcPlayerNameLoot                            contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn match   mcPlayerNameLootReplace                     contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn match   mcPlayerNameMsg                             contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcChatMessage
syn match   mcPlayerNameTpFacing                        contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcTpAnchoredValue
syn match   mcPlayerNameTpTarget                        contained /\<\(\d\+\(\s\+[0-9~.-]\+\)\{1,2}\s*$\)\@!\w\{3,16}\>-\@!/    skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn match   mcPlayerNameXpQuery                         contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn match   mcPlayerNameXpSet                           contained /\w\{3,16}\>-\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcXpAmount
syn match   mcSelector                                  contained /@[eaprs]\>\[\@!/
syn match   mcSelectorAdvancement                       contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcAdvancementWhich
syn match   mcSelectorClear                             contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemClear
syn match   mcSelectorDataGet                           contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn match   mcSelectorDataMerge                         contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn match   mcSelectorDataModify                        contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn match   mcSelectorDataRemove                        contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn match   mcSelectorEffectClear                       contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEffect
syn match   mcSelectorEffectGive                        contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEffectGive
syn match   mcSelectorEnchant                           contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcEnchantment
syn match   mcSelectorExecute                           contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcSelectorExecuteCond                       contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcSelectorExecuteCondData                   contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn match   mcSelectorExecuteCondScoreSource            contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreSource
syn match   mcSelectorExecuteCondScoreTarget            contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreTarget
syn match   mcSelectorExecuteFacing                     contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn match   mcSelectorExecuteStore                      contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn match   mcSelectorExecuteStoreScore                 contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteStore
syn match   mcSelectorGive                              contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemGive
syn match   mcSelectorLoot                              contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn match   mcSelectorLootReplace                       contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn match   mcSelectorMsg                               contained /@[asrp]\>\[\@!/                                              skipwhite nextgroup=mcDoubleSpace,mcChatMessage
syn match   mcSelectorTpFacing                          contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcTpAnchoredValue
syn match   mcSelectorTpTarget                          contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn match   mcSelectorXpQuery                           contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn match   mcSelectorXpSet                             contained /@[eaprs]\>\[\@!/                                             skipwhite nextgroup=mcDoubleSpace,mcXpAmount
syn match   mcUUID                                      contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn match   mcUUIDAdvancement                           contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcAdvancementWhich
syn match   mcUUIDClear                                 contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcItemClear
syn match   mcUUIDDataGet                               contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn match   mcUUIDDataMerge                             contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn match   mcUUIDDataModify                            contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn match   mcUUIDDataRemove                            contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn match   mcUUIDEffectClear                           contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcEffect
syn match   mcUUIDEffectGive                            contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcEffectGive
syn match   mcUUIDEnchant                               contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcEnchantment
syn match   mcUUIDExecute                               contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcUUIDExecuteCond                           contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcUUIDExecuteCondData                       contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn match   mcUUIDExecuteCondScoreSource                contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreSource
syn match   mcUUIDExecuteCondScoreTarget                contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreTarget
syn match   mcUUIDExecuteFacing                         contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn match   mcUUIDExecuteStore                          contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn match   mcUUIDExecuteStoreScore                     contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteStore
syn match   mcUUIDGive                                  contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcItemGive
syn match   mcUUIDLoot                                  contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn match   mcUUIDLootReplace                           contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn match   mcUUIDMsg                                   contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcChatMessage
syn match   mcUUIDTpFacing                              contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcTpAnchoredValue
syn match   mcUUIDTpTarget                              contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn match   mcUUIDXpQuery                               contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn match   mcUUIDXpSet                                 contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/                                skipwhite nextgroup=mcDoubleSpace,mcXpAmount
syn region  mcSelectorFilter                            contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite
syn region  mcSelectorFilterAdvancement                 contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcAdvancementWhich
syn region  mcSelectorFilterClear                       contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcItemClear
syn region  mcSelectorFilterDataGet                     contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn region  mcSelectorFilterDataMerge                   contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn region  mcSelectorFilterDataModify                  contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn region  mcSelectorFilterDataRemove                  contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn region  mcSelectorFilterEffectClear                 contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcEffect
syn region  mcSelectorFilterEffectGive                  contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcEffectGive
syn region  mcSelectorFilterEnchant                     contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcEnchantment
syn region  mcSelectorFilterExecute                     contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn region  mcSelectorFilterExecuteCond                 contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn region  mcSelectorFilterExecuteCondData             contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn region  mcSelectorFilterExecuteCondScoreSource      contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreSource
syn region  mcSelectorFilterExecuteCondScoreTarget      contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteCondScoreTarget
syn region  mcSelectorFilterExecuteFacing               contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcExecuteAnchoredValue
syn region  mcSelectorFilterExecuteStore                contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn region  mcSelectorFilterExecuteStoreScore           contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcObjectiveNameExecuteStore
syn region  mcSelectorFilterGive                        contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcItemGive
syn region  mcSelectorFilterLoot                        contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn region  mcSelectorFilterLootReplace                 contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn region  mcSelectorFilterMsg                         contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcChatMessage
syn region  mcSelectorFilterTpFacing                    contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcTpAnchoredValue
syn region  mcSelectorFilterTpTarget                    contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn region  mcSelectorFilterXpQuery                     contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcXpUnit
syn region  mcSelectorFilterXpSet                       contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcXpAmount
synt cluster mcFilter add=mcSelectorFilter,mcSelectorFilterEnchant,mcSelectorFilterExecute,mcSelectorFacingFilterExecute,mcSelectorFilterExecuteStore,mcSelectorFilterExecuteStoreScore,msSelectorFilterMsg,mcSelectorFilterTpFacing
