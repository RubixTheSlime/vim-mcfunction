" Data Values
syn match   mcBlockName                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock
syn match   mcBlockNameExecute                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock       skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcBlockNameSetblock                 /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateSetblock,mcNBTTagSetblock,mcSetblockPad
syn match   mcBlockNameFill                     /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFill,mcNBTTagFill,mcFillPad
syn match   mcBlockNameFillReplace              /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateFillReplace,mcNBTTagFillReplace
syn match   mcBlockNameClone                    /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinBlock                 nextgroup=mcAnySpace,mcBlockStateClone,mcNBTTagClone,mcClonePad
syn match   mcDimensionExecute                  /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinDimension   skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcEffect                            /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect
syn match   mcEffectGive                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEffect      skipwhite nextgroup=mcDoubleSpace,mcEffectSeconds
syn match   mcEnchantment                       /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEnchantment skipwhite nextgroup=mcDoubleSpace,mcEnchantmentLevel
syn match   mcEntityType                        /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEntity
syn match   mcItem                              /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem
syn match   mcItemGive                          /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        nextgroup=mcAnySpace,mcNBTTagGive
syn match   mcItemClear                         /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinItem        skipwhite nextgroup=mcDoubleSpace,mcUInt
" Data Value Instance Links
hi def link mcBlockNameSetblock                 mcBlockName
hi def link mcBlockNameFill                     mcBlockName
hi def link mcBlockNameFillReplace              mcBlockName
hi def link mcBlockNameClone                    mcBlockName
hi def link mcBlockNameExecute                  mcBlockName
hi def link mcItemGive                          mcItem
hi def link mcItemClear                         mcItem
hi def link mcEffectGive                        mcEffect

" Block States
syn region  mcBlockState                matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained skipwhite contains=mcBlockStateKeyword
syn region  mcBlockStateSetblock        matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagSetblock,mcSetblockPad
syn region  mcBlockStateFill            matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFill,mcFillPad
syn region  mcBlockStateFillReplace     matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagFillReplace,mcFillReplacePad
syn region  mcBlockStateClone           matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained contains=mcBlockStateKeyword nextgroup=mcAnySpace,mcNBTTagClone,mcClonePad
" keywords
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqUI          age bites delay distance eggs hatch layers level moisture note pickles power rotation stage
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqBool        attached bottom conditional disarmed down drag enabled extended eye hanging has_book has_bottle_0 has_bottle_1 has_bottle_2 has_record in_wall inverted lit locked note occupied open persistent powered short signal_fire snowy triggered unstable up waterlogged
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqAttachment  attachment
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqAxis        axis
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqCardinal    north east south west
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqFace        face
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqFacing      facing
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqHalf        half
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqHinge       hinge
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqInstrument  instrument
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqLeaves      leaves
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqMode        mode
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqPart        part
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqShape       shape
syn keyword mcBlockStateKeyword         contained skipwhite nextgroup=mcBlockStateEqType        type
" ...=...
syn match   mcBlockStateEqUI            contained skipwhite nextgroup=mcBlockStateValueUI               /=/
syn match   mcBlockStateEqBool          contained skipwhite nextgroup=mcBlockStateValueBool             /=/
syn match   mcBlockStateEqAttachment    contained skipwhite nextgroup=mcBlockStateValueAttachment       /=/
syn match   mcBlockStateEqAxis          contained skipwhite nextgroup=mcBlockStateValueAxis             /=/
syn match   mcBlockStateEqCardinal      contained skipwhite nextgroup=mcBlockStateValueCardinal         /=/
syn match   mcBlockStateEqFace          contained skipwhite nextgroup=mcBlockStateValueFace             /=/
syn match   mcBlockStateEqFacing        contained skipwhite nextgroup=mcBlockStateValueFacing           /=/
syn match   mcBlockStateEqHalf          contained skipwhite nextgroup=mcBlockStateValueHalf             /=/
syn match   mcBlockStateEqHinge         contained skipwhite nextgroup=mcBlockStateValueHinge            /=/
syn match   mcBlockStateEqInstrument    contained skipwhite nextgroup=mcBlockStateValueInstrument       /=/
syn match   mcBlockStateEqLeaves        contained skipwhite nextgroup=mcBlockStateValueLeaves           /=/
syn match   mcBlockStateEqMode          contained skipwhite nextgroup=mcBlockStateValueMode             /=/
syn match   mcBlockStateEqPart          contained skipwhite nextgroup=mcBlockStateValuePart             /=/
syn match   mcBlockStateEqShape         contained skipwhite nextgroup=mcBlockStateValueShape            /=/
syn match   mcBlockStateEqType          contained skipwhite nextgroup=mcBlockStateValueType             /=/
" values
syn match   mcBlockStateValueUI         contained skipwhite     /\d\+/
syn match   mcBlockStateValueShape      contained skipwhite     /ascending_\(north\|east\|south\|west\)\|east_west\|north_south\|\(inner\|outer\)_\(left\|right\)\|\(nort\|south\)_\(east\|west\)\|straight/
syn keyword mcBlockStateValueBool       contained skipwhite     true false
syn keyword mcBlockStateValueAttachment contained skipwhite     ceiling double_wall floor single_wall
syn keyword mcBlockStateValueAxis       contained skipwhite     x y z
syn keyword mcBlockStateValueCardinal   contained skipwhite     true false none syde up
syn keyword mcBlockStateValueFace       contained skipwhite     ceiling floor wall
syn keyword mcBlockStateValueFacing     contained skipwhite     up down north east south west
syn keyword mcBlockStateValueHalf       contained skipwhite     lower upper bottom top
syn keyword mcBlockStateValueHinge      contained skipwhite     left right
syn keyword mcBlockStateValueInstrument contained skipwhite     basedrum bass bell chime flute guitar harp hat snare xylophone
syn keyword mcBlockStateValueLeaves     contained skipwhite     large none small
syn keyword mcBlockStateValueMode       contained skipwhite     compare subtract corner data load save
syn keyword mcBlockStateValuePart       contained skipwhite     foot head
syn keyword mcBlockStateValueType       contained skipwhite     normal sticky left right single bottom double top
" Block State Links
hi def link mcBlockStateEqUI            mcBlockStateEq
hi def link mcBlockStateEqBool          mcBlockStateEq
hi def link mcBlockStateEqAttachment    mcBlockStateEq
hi def link mcBlockStateEqAxis          mcBlockStateEq
hi def link mcBlockStateEqCardinal      mcBlockStateEq
hi def link mcBlockStateEqFace          mcBlockStateEq
hi def link mcBlockStateEqFacing        mcBlockStateEq
hi def link mcBlockStateEqHalf          mcBlockStateEq
hi def link mcBlockStateEqHinge         mcBlockStateEq
hi def link mcBlockStateEqInstrument    mcBlockStateEq
hi def link mcBlockStateEqLeaves        mcBlockStateEq
hi def link mcBlockStateEqMode          mcBlockStateEq
hi def link mcBlockStateEqPart          mcBlockStateEq
hi def link mcBlockStateEqShape         mcBlockStateEq
hi def link mcBlockStateEqType          mcBlockStateEq

hi def link mcBlockStateValueUI         mcBlockStateValue
hi def link mcBlockStateValueBool       mcBlockStateValue
hi def link mcBlockStateValueAttachment mcBlockStateValue
hi def link mcBlockStateValueAxis       mcBlockStateValue
hi def link mcBlockStateValueCardinal   mcBlockStateValue
hi def link mcBlockStateValueFace       mcBlockStateValue
hi def link mcBlockStateValueFacing     mcBlockStateValue
hi def link mcBlockStateValueHalf       mcBlockStateValue
hi def link mcBlockStateValueHinge      mcBlockStateValue
hi def link mcBlockStateValueInstrument mcBlockStateValue
hi def link mcBlockStateValueLeaves     mcBlockStateValue
hi def link mcBlockStateValueMode       mcBlockStateValue
hi def link mcBlockStateValuePart       mcBlockStateValue
hi def link mcBlockStateValueShape      mcBlockStateValue
hi def link mcBlockStateValueType       mcBlockStateValue
