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
