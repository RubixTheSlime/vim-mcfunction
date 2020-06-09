" Coordinate
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
syn match mcCoordinate                          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcColumn                    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
syn match mcRotation                    contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/

for [type,nexttype,serial] in [["Summon","mcLineEnd,@mcNBT",""],["CloneDest","mcCloneMask","3"], ["CloneFrom","mcCoordinateCloneTo",""], ["CloneTo","mcCoordinateCloneDest","2"], ["DataGet","@mcNBTPathDataGet",""], ["DataMerge","mcNBTTag",""], ["DataModify","@mcNBTPathDataModify",""], ["DataRemove","@mcNBTPath",""], ["Execute","@mcExecuteKeyword",""], ["ExecuteCondBlock","mcBlockNameExecute",""], ["ExecuteCondData","@mcNBTPathExecute",""], ["ExecuteCondDest","mcExecuteCondBlocksMask",""], ["ExecuteCondEnd","mcCoordinateExecuteCondDest","3"], ["ExecuteCondStart","mcCoordinateExecuteCondEnd","2"], ["ExecuteStoreBlock","@mcNBTPathExecuteStore",""], ["FillFrom","mcCoordinateFillTo",""], ["FillTo","mcBlockNameFill","2"], ["Loot","mcLootSourceKeyword",""], ["LootMine","mcExecuteFacingKeyword,mcItem,mcLootHand",""], ["LootReplace","mcItemSlotLoot",""], ["Setblock","mcBlockNameSetblock",""], ["Tp","mcExecuteFacingKeyword,mcRotation",""]]
        execute 'syn match mcCoordinate'.type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'hi def link mcCoordinate'.type 'mcCoordinate'.serial
endfor


" Column
" Same as Coordinate, but 2
for [type,nexttype,serial] in [["ForceloadStart","mcColumnForceloadEnd",""],["ForceloadEnd","mcDoubleSpace","2"]]
        execute 'syn match mcColumn'.type 'contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'hi def link mcColumn'.type 'mcColumn'.serial
endfor

" Rotation
" Same as Column, but no caret allowed
for [type,nexttype,serial] in [["Execute","@mcExecuteKeyword",""]]
        execute 'syn match mcRotation'.type 'contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/ contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'hi def link mcRotation'.type 'mcRotation'.serial
endfor
syn match mcRotationExecute             contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/        skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
