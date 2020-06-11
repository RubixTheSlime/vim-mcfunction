" Data Values
syn match   mcAdvancement                       /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinAdvancement
syn match   mcBlock                             /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinItemBlock,mcBuiltinBlock nextgroup=mcBlockstate
syn match   mcDimension                         /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinDimension
syn match   mcEffect                            /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEffect
syn match   mcEntityType                        /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEntity
syn match   mcItem                              /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinItemBlock,mcBuiltinItem
syn match   mcEnchantment                       /\(\w\+:\)*\w\+/        contained contains=mcNamespace,mcBuiltinEnchantment
syn match   mcNamespace         /\w\+:/ contained contains=mcBuiltinNamespace
hi def link mcAdvancement   mcValue
hi def link mcBlock         mcValue
hi def link mcDimension     mcValue
hi def link mcEffect        mcValue
hi def link mcEntityType    mcValue
hi def link mcItem          mcValue
hi def link mcEnchantment   mcValue
hi def link mcNamespace     mcValue

syn match mcBadWhiteSpaceBlock / \ze[[{]/ contained
hi def link mcBadWhiteSpaceBlock mcBadWhitespace

" Block States
syn region  mcBlockState                matchgroup=mcBlockStateBracket start=/\[/rs=e end=/]/ contained skipwhite contains=mcBlockStateKeyword

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
