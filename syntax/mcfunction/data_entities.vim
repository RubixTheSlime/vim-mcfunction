" Vim syntax file
" Language: Minecraft 1.14 Command
" Maintainer: Lyle Lowry
" Latest Revision: 14 August 2019

" Entity file
" - link Player names, selectors, and UUIDs to their respective universal
"   counterparts
" - cluster player names, selectors, and UUIDs into entities
" - match each group

function! s:mcEntity(type, nexttype)
        execute 'hi def link mcEntity'.a:type 'mcEntity'
        execute 'syn cluster mcEntity'.a:type 'add=mcEntity'.a:type
        execute 'syn match   mcEntity'.a:type 'contained /\w\{3,16}\>-\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'syn match   mcEntity'.a:type 'contained /@[eaprs]\>\[\@!/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'syn match   mcEntity'.a:type 'contained /\x\{8}-\x\{4}-\x\{4}-\x\{12}/ skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'syn region  mcEntity'.a:type 'contained matchgroup=mcSelector start=/@[eaprs]\[/rs=e end=/]/ contains=mcFilterKeyword,mcFilterComma oneline skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'syn cluster mcFilter add='.a:type
endfunction

"Most types
for [type, nexttype] in [["Title","mcTitleKeyword"],["Advancement", "mcAdvancementWhich"], ["Clear", "mcItemClear"], ["DataGet", "@mcNBTPathDataGet"], ["DataMerge", "mcNBTTag"], ["DataModify", "@mcNBTPathDataModify"], ["DataRemove", "@mcNBTPath"], ["EffectClear", "mcEffect"], ["EffectGive", "mcEffectGive"], ["Enchant", "mcEnchantment"], ["Execute", "@mcExecuteKeyword"], ["ExecuteCond", "@mcExecuteKeyword"], ["ExecuteCondData", "@mcNBTPathExecute"], ["ExecuteCondScoreSource", "mcObjectiveNameExecuteCondScoreSource"], ["ExecuteCondScoreTarget", "mcObjectiveNameExecuteCondScoreTarget"], ["ExecuteFacing", "mcExecuteAnchoredValue"], ["ExecuteStore", "@mcNBTPathExecuteStore"], ["ExecuteStoreScore", "mcObjectiveNameExecuteStore"], ["Give", "mcItemGive"], ["Loot", "mcLootSourceKeyword"], ["LootReplace", "mcItemSlotLoot"], ["Msg", "mcChatMessage"], ["SpawnPos","mcCoordinate"], ["TpFacing", "mcTpAnchoredValue"], ["XpQuery", "mcXpUnit"], ["XpSet", "mcXpAmount"], ]
        call s:mcEntity(type,nexttype)
endfor

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

