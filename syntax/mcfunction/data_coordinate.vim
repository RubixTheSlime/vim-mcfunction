syn match mcCoordinate contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcColumn     contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
syn match mcRotation   contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/

" Coordinate
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
function! s:mcCoordinate(type,nexttype,serial)
        execute 'syn match mcCoordinate'.a:type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcCoordinate'.a:type 'mcCoordinate'.a:serial
endfunction

" Column
" Same as Coordinate, but 2
function! s:mcColumn(type,nexttype,serial)
        execute 'syn match mcColumn'.a:type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcColumn'.a:type 'mcColumn'.a:serial
endfunction

" Rotation
" Same as Column, but no caret allowed
function! s:mcRotation(type,nexttype,serial)
        execute 'syn match mcRotation'.a:type 'contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'hi def link mcRotation'.a:type 'mcRotation'.a:serial
endfunction

for [type,nexttype,serial] in [["Summon","mcLineEnd,@mcNBT",""],["CloneDest","mcCloneMask","3"], ["CloneFrom","mcCoordinateCloneTo",""], ["CloneTo","mcCoordinateCloneDest","2"], ["DataGet","@mcNBTPathDataGet",""], ["DataMerge","mcNBTTag",""], ["DataModify","@mcNBTPathDataModify",""], ["DataRemove","@mcNBTPath",""], ["Execute","@mcExecuteKeyword",""], ["ExecuteCondBlock","mcBlockNameExecute",""], ["ExecuteCondData","@mcNBTPathExecute",""], ["ExecuteCondDest","mcExecuteCondBlocksMask",""], ["ExecuteCondEnd","mcCoordinateExecuteCondDest","3"], ["ExecuteCondStart","mcCoordinateExecuteCondEnd","2"], ["ExecuteStoreBlock","@mcNBTPathExecuteStore",""], ["FillFrom","mcCoordinateFillTo",""], ["FillTo","mcBlockNameFill","2"], ["Loot","mcLootSourceKeyword",""], ["LootMine","mcExecuteFacingKeyword,mcItem,mcLootHand",""], ["LootReplace","mcItemSlotLoot",""], ["Setblock","mcBlockNameSetblock",""], ["Tp","mcExecuteFacingKeyword,mcRotation",""]]
        call s:mcCoordinate(type,nexttype,serial)
endfor


for [type,nexttype,serial] in [["ForceloadStart","mcColumnForceloadEnd",""],["ForceloadEnd","mcDoubleSpace","2"]]
        call s:mcColumn(type,nexttype,serial)
endfor

for [type,nexttype,serial] in [["Execute","@mcExecuteKeyword",""]]
        call s:mcRotation(type,nexttype,serial)
endfor
