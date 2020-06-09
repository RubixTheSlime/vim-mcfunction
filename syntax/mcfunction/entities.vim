" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry
" Latest Revision: 14 August 2019

" Entity file
" - link Player names, selectors, and UUIDs to their respective universal
"   counterparts
" - cluster player names, selectors, and UUIDs into entities
" - match each group

"Most types
for [type, nexttype] in [ ["Title","mcTitleKeyword"],["Advancement", "mcAdvancementWhich"], ["Clear", "mcItemClear"], ["DataGet", "@mcNBTPathDataGet"], ["DataMerge", "mcNBTTag"], ["DataModify", "@mcNBTPathDataModify"], ["DataRemove", "@mcNBTPath"], ["EffectClear", "mcEffect"], ["EffectGive", "mcEffectGive"], ["Enchant", "mcEnchantment"], ["Execute", "@mcExecuteKeyword"], ["ExecuteCond", "@mcExecuteKeyword"], ["ExecuteCondData", "@mcNBTPathExecute"], ["ExecuteCondScoreSource", "mcObjectiveNameExecuteCondScoreSource"], ["ExecuteCondScoreTarget", "mcObjectiveNameExecuteCondScoreTarget"], ["ExecuteFacing", "mcExecuteAnchoredValue"], ["ExecuteStore", "@mcNBTPathExecuteStore"], ["ExecuteStoreScore", "mcObjectiveNameExecuteStore"], ["Give", "mcItemGive"], ["Loot", "mcLootSourceKeyword"], ["LootReplace", "mcItemSlotLoot"], ["Msg", "mcChatMessage"], ["SpawnPos","mcCoordinate"], ["TpFacing", "mcTpAnchoredValue"], ["XpQuery", "mcXpUnit"], ["XpSet", "mcXpAmount"], ]
        execute 'hi def link mcPlayerName'.type 'mcPlayerName'
        execute 'hi def link mcSelector'.type 'mcSelector'
        execute 'hi def link mcUUID'.type 'mcUUID'
        execute 'syn cluster mcEntity'.type 'add=mcSelector'.type.',mcPlayerName'.type.',mcUUID'.type.',mcSelectorFilter'.type
        execute 'syn match mcPlayerName'.type 'contained /\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'syn match mcSelector'.type 'contained /@[eaprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'syn match mcUUID'.type 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'syn region mcSelectorFilter'.type 'contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'syn cluster mcFilter add='.type
endfor

"Base case
syn cluster mcEntity add=mcSelector add=mcPlayerName add=mcUUID add=mcSelectorFilter
syn match mcPlayerName contained /\w\{3,16}\>-\@!/
syn match mcSelector contained /@[eaprs]\>\[\@!/
syn match mcUUID contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/
syn region mcSelectorFilter contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite

"This one requires a special name regex
syn cluster mcEntityTpTarget add=mcSelectorTpTarget add=mcPlayerNameTpTarget add=mcUUIDTpTarget add=mcSelectorFilterTpTarget
hi def link mcUUIDTpTarget mcUUID
hi def link mcSelectorTpTarget mcSelector
hi def link mcPlayerNameTpTarget mcPlayerName
syn match mcPlayerNameTpTarget contained /\<\(\d\+\(\s\+[0-9~.-]\+\)\{1,2}\s*$\)\@!\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn match mcSelectorTpTarget contained /@[eaprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn match mcUUIDTpTarget contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity
syn region mcSelectorFilterTpTarget contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,mcCoordinateTp,@mcEntity

