" Coordinate
" ~|~?-?\d*\.?\d+ *3 OR ^[n][.n] *3
syn match mcCoordinate                          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\?\)\{3} *$\|\(\^-\?\d*\.\?\d* \?\)\{3}/  contains=mcDoubleSpace
syn match mcCoordinateCloneDest                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCloneMask
syn match mcCoordinateCloneFrom                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneTo
syn match mcCoordinateCloneTo                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateCloneDest
syn match mcCoordinateDataGet                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataGet
syn match mcCoordinateDataMerge                 contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcNBTTag
syn match mcCoordinateDataModify                contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathDataModify
syn match mcCoordinateDataRemove                contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPath
syn match mcCoordinateExecute                   contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match mcCoordinateExecuteCondBlock          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameExecute
syn match mcCoordinateExecuteCondData           contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecute
syn match mcCoordinateExecuteCondDest           contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteCondBlocksMask
syn match mcCoordinateExecuteCondEnd            contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondDest
syn match mcCoordinateExecuteCondStart          contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateExecuteCondEnd
syn match mcCoordinateExecuteStoreBlock         contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,@mcNBTPathExecuteStore
syn match mcCoordinateFillFrom                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcCoordinateFillTo
syn match mcCoordinateFillTo                    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameFill
syn match mcCoordinateLoot                      contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcLootSourceKeyword
syn match mcCoordinateLootMine                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingKeyword,mcItem,mcLootHand
syn match mcCoordinateLootReplace               contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcItemSlotLoot
syn match mcCoordinateSetblock                  contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcBlockNameSetblock
syn match mcCoordinateTp                        contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@!\_[ ]\)\{3}\|\(\^-\?\d*\.\?\d* \?\)\{3}/       contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcExecuteFacingKeyword,mcRotation
hi def link mcCoordinateCloneDest               mcCoordinate3
hi def link mcCoordinateCloneFrom               mcCoordinate
hi def link mcCoordinateCloneTo                 mcCoordinate2
hi def link mcCoordinateDataGet                 mcCoordinate
hi def link mcCoordinateDataMerge               mcCoordinate
hi def link mcCoordinateDataModify              mcCoordinate
hi def link mcCoordinateDataRemove              mcCoordinate
hi def link mcCoordinateExecute                 mcCoordinate
hi def link mcCoordinateExecuteCondBlock        mcCoordinate
hi def link mcCoordinateExecuteCondDest         mcCoordinate3
hi def link mcCoordinateExecuteCondEnd          mcCoordinate2
hi def link mcCoordinateExecuteCondStart        mcCoordinate
hi def link mcCoordinateExecuteStoreBlock       mcCoordinate
hi def link mcCoordinateFillFrom                mcCoordinate
hi def link mcCoordinateFillTo                  mcCoordinate2
hi def link mcCoordinateLoot                    mcCoordinate
hi def link mcCoordinateLootMine                mcCoordinate
hi def link mcCoordinateLootReplace             mcCoordinate
hi def link mcCoordinateSetblock                mcCoordinate
hi def link mcCoordinateTp                      mcCoordinate

" Column
" Same as Coordinate, but 2
syn match   mcColumn                    contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
syn match   mcColumnForceloadStart      contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadEnd
syn match   mcColumnForceloadEnd        contained /\(\(\~\|\~\?-\?\d*\.\?\d\+\)[0-9.-]\@![ \n]\)\{2\}\|\(\^-\?\d*\.\?\d* \?\)\{2\}/     contains=mcDoubleSpace skipwhite
hi def link mcColumnForceloadStart      mcColumn
hi def link mcColumnForceloadEnd        mcColumn2


" Rotation
" Same as Column, but no caret allowed
syn match mcRotation                    contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/
syn match mcRotationExecute             contained /\(\(\~\?-\?\d*\.\?\d\+\)[0-9.-]\@! \?\)\{2\}/        skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
