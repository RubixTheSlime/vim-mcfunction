" Repeat all 8 fields present when making a new instance of NBT Path
" Repeat only mcNBTTagP and mcNBT for a new instance of NBT Tag

syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

" NBT Paths
for type in ["","ExecuteStore","Execute","DataGet","DataModify"]
        execute 'syn match   mcNBTPath'.type           '/\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.type ',mc'.type.'Pad'
        execute 'syn region  mcNBTPath'.type           'matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.type ',mc'.type.'Pad'
        execute 'syn region  mcNBTArray'.type          'matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.type ',mc'.type.'Pad'
        execute 'syn region  mcNBTTagP'.type           'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.type ',mc'.type.'Pad'
        execute 'syn match   mcNBTPathDot'.type        '/\./                                                            contained                               nextgroup=mcNBTPath'.type ',mc'.type.'Pad'
        execute 'syn cluster mcNBTPath'.type           'contains=mcNBTPath'.type.',mcNBTTagP'.type
        execute 'syn cluster mcNBTContinue'.type       'contains=mcNBTTagP'.type.',mcNBTArray'.type.',mcNBTPathDot'.type
        execute 'syn cluster mcNBT'.type               'add=mcNBTPath'.type.',mcNBTArray'.type.',mcNBTTagP'.type.',mcNBTPathDot'.type.',mcNBTTag'.type
        execute 'hi def link mcNBTPath'.type 'mcNBTPath'
        execute 'hi def link mcNBTPathDot'.type 'mcNBTPathDot'
endfor

" NBT Tags
for [type,nexttype] in [["Give","mcUInt"],["Setblock","mcSetblockPad"],["Fill","mcFillPad"],["FillReplace",""],["Clone","mcClonePad"]]
        execute 'syn region  mcNBTTag'.type 'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,'.nexttype
        execute 'syn cluster mcNBT add=mcNBTTag'.type
endfor

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
syn region  mcNBTValue          matchgroup=mcNBTBracket start=/\[\([BIL];\)\?/rs=e end=/]/      oneline contained contains=@mcNBTValue,mcNBTComma
syn cluster mcNBTValue          contains=mcNBTValue,mcNBTString,mcNBTBool
syn cluster mcNBT               add=mcNBTIndex,mcNBTComma,mcNBTColon,mcNBTTagKey,mcNBTValue,mcNBTString,mcNBTBool
hi def link mcNBTBool           mcBool
hi def link mcNBTTagKey         mcNBTPath
hi def link mcNBTComma          mcNBTPathDot
hi def link mcNBTColon          mcNBTPathDot
hi def link mcNBTValueQuote     mcNBTValue

" For debugging purposes
"syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath
