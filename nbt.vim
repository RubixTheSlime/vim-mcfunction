" Repeat all 8 fields present when making a new instance of NBT Path
" Repeat only mcNBTTagP and mcNBT for a new instance of NBT Tag
syn match   mcNBTPath           /\w\+/                                                          contained                               nextgroup=@mcNBTContinue
syn region  mcNBTPath           matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue
syn region  mcNBTArray          matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue
syn region  mcNBTTagP           matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue
syn match   mcNBTPathDot        /\./                                                            contained                               nextgroup=mcNBTPath
syn cluster mcNBTPath           contains=mcNBTPath,mcNBTTagP
syn cluster mcNBTContinue       contains=mcNBTTagP,mcNBTArray,mcNBTPathDot
syn cluster mcNBT               add=mcNBTPath,mcNBTArray,mcNBTTagP,mcNBTPathDot,mcNBTTag
syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

" Execute store
syn match   mcNBTPathExecuteStore       /\w\+/                                                          contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTPathExecuteStore       matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTArrayExecuteStore      matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn region  mcNBTTagExecuteStore        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueExecuteStore,mcExecuteStoreTypePad
syn match   mcNBTPathDotExecuteStore    /\./                                                            contained                               nextgroup=mcNBTPathExecuteStore
syn cluster mcNBTPathExecuteStore       contains=mcNBTPathExecuteStore,mcNBTTagExecuteStore
syn cluster mcNBTContinueExecuteStore   contains=mcNBTTagExecuteStore,mcNBTArrayExecuteStore,mcNBTPathDotExecuteStore
syn cluster mcNBT                       add=mcNBTPathExecuteStore,mcNBTArrayExecuteStore,mcNBTTagExecuteStore,mcNBTPathDotExecuteStore
hi def link mcNBTPathExecuteStore       mcNBTPath
hi def link mcNBTPathDotExecuteStore    mcNBTPathDot

" Execute [condition]
syn match   mcNBTPathExecute            /\w\+/                                                          contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTPathExecute            matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTArrayExecute           matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn region  mcNBTTagExecute             matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueExecuteStore,mcExecutePad
syn match   mcNBTPathDotExecute         /\./                                                            contained                               nextgroup=mcNBTPathExecuteStore
syn cluster mcNBTPathExecute            contains=mcNBTPathExecute,mcNBTTagExecute
syn cluster mcNBTContinueExecute        contains=mcNBTTagExecute,mcNBTArrayExecute,mcNBTPathDotExecute
syn cluster mcNBT                       add=mcNBTPathExecute,mcNBTArrayExecute,mcNBTTagExecute,mcNBTPathDotExecute
hi def link mcNBTPathExecute            mcNBTPath
hi def link mcNBTPathDotExecute         mcNBTPathDot

" Data get
syn match   mcNBTPathDataGet            /\w\+/                                                          contained                               nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTPathDataGet            matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTArrayDataGet           matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn region  mcNBTTagDataGet             matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueDataGet,mcDataGetPad
syn match   mcNBTPathDotDataGet         /\./                                                            contained                               nextgroup=mcNBTPathDataGet
syn cluster mcNBTPathDataGet            contains=mcNBTPathDataGet,mcNBTTagDataGet
syn cluster mcNBTContinueDataGet        contains=mcNBTTagDataGet,mcNBTArrayDataGet,mcNBTPathDotDataGet
syn cluster mcNBT                       add=mcNBTPathDataGet,mcNBTArrayDataGet,mcNBTTagDataGet,mcNBTPathDotDataGet
hi def link mcNBTPathDataGet            mcNBTPath
hi def link mcNBTPathDotDataGet         mcNBTPathDot

" Data Modify
syn match   mcNBTPathDataModify         /\w\+/                                                          contained                               nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTPathDataModify         matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTArrayDataModify        matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn region  mcNBTTagDataModify          matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinueDataModify,mcDataModifyPad
syn match   mcNBTPathDotDataModify      /\./                                                            contained                               nextgroup=mcNBTPathDataModify
syn cluster mcNBTPathDataModify         contains=mcNBTPathDataModify,mcNBTTagDataModify
syn cluster mcNBTContinueDataModify     contains=mcNBTTagDataModify,mcNBTArrayDataModify,mcNBTPathDotDataModify
syn cluster mcNBT                       add=mcNBTPathDataModify,mcNBTArrayDataModify,mcNBTTagDataModify,mcNBTPathDotDataModify
hi def link mcNBTPathDataModify         mcNBTPath
hi def link mcNBTPathDotDataModify      mcNBTPathDot

" Tag instances
syn region  mcNBTTagGive        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,mcUInt
syn region  mcNBTTagSetblock    matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcSetblockPad
syn region  mcNBTTagFill        matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcFillPad
syn region  mcNBTTagFillReplace matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey
syn region  mcNBTTagClone       matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey nextgroup=mcClonePad
syn cluster mcNBT               add=mcNBTTagGive,mcNBTTagSetblock,mcNBTTagFill,mcNBTTagFillReplace,mcNBTTagClone

" These never need to be redefined as they will always be found inside
" something, thus they don't need a custom nextgroup
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
syn region  mcNBTValue          matchgroup=mcNBTBracket start=/\[\([BIL];\)\?/rs=e end=/]/       oneline contained contains=@mcNBTValue,mcNBTComma
syn cluster mcNBTValue          contains=mcNBTValue,mcNBTString,mcNBTBool
syn cluster mcNBT               add=mcNBTIndex,mcNBTComma,mcNBTColon,mcNBTTagKey,mcNBTValue,mcNBTString,mcNBTBool
hi def link mcNBTBool           mcBool
hi def link mcNBTTagKey         mcNBTPath
hi def link mcNBTComma          mcNBTPathDot
hi def link mcNBTColon          mcNBTPathDot
hi def link mcNBTValueQuote     mcNBTValue

" For debugging purposes
syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath
