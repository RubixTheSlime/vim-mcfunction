" Repeat all 8 fields present when making a new instance of NBT Path
" Repeat only mcNBTTagP and mcNBT for a new instance of NBT Tag

syn region  mcNBTTag            matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline          contained contains=mcNBTTagKey

function! s:mcNBTPath(type)
        execute 'syn match   mcNBTPath'.a:type           '/\w\+/                                                          contained                               nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTPath'.a:type           'matchgroup=mcNBTQuote   start=/"/ end=/"/ skip=/\\"/ oneline    contained                               nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTArray'.a:type          'matchgroup=mcNBTBracket start=/\[/rs=e end=/]/ oneline          contained contains=mcNBTIndex,mcNBTTagP nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn region  mcNBTTagP'.a:type           'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline           contained contains=mcNBTTagKey          nextgroup=@mcNBTContinue'.a:type ',mc'.a:type.'Pad'
        execute 'syn match   mcNBTPathDot'.a:type        '/\./                                                            contained                               nextgroup=mcNBTPath'.a:type ',mc'.a:type.'Pad'
        execute 'syn cluster mcNBTPath'.a:type           'contains=mcNBTPath'.a:type.',mcNBTTagP'.a:type
        execute 'syn cluster mcNBTContinue'.a:type       'contains=mcNBTTagP'.a:type.',mcNBTArray'.a:type.',mcNBTPathDot'.a:type
        execute 'syn cluster mcNBT'.a:type               'add=mcNBTPath'.a:type.',mcNBTArray'.a:type.',mcNBTTagP'.a:type.',mcNBTPathDot'.a:type.',mcNBTTag'.a:type
        execute 'hi def link mcNBTPath'.a:type 'mcNBTPath'
        execute 'hi def link mcNBTPathDot'.a:type 'mcNBTPathDot'
endfunction

function! s:mcNBTTag(type,nexttype)
        execute 'syn region  mcNBTTag'.a:type 'matchgroup=mcNBTBracket start=/{/rs=e end=/}/ oneline contained contains=mcNBTTagKey skipwhite nextgroup=mcDoubleSpace,'.a:nexttype
        execute 'syn cluster mcNBT add=mcNBTTag'.a:type
endfunction

" NBT Paths
for type in ["","ExecuteStore","Execute","DataGet","DataModify"]
        call s:mcNBTPath(type)
endfor

" NBT Tags
for [type,nexttype] in [["Give","mcUInt"],["Setblock","mcSetblockPad"],["Fill","mcFillPad"],["FillReplace",""],["Clone","mcClonePad"]]
        call s:mcNBTTag(type,nexttype)
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
syn keyword mcCommand nbt skipwhite contained nextgroup=@mcNBTPath
