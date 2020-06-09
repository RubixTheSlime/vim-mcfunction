syn keyword mcCommand defaultgamemode           contained skipwhite nextgroup=mcDoubleSpace,mcGamemode
syn keyword mcCommand gamemode                  contained skipwhite nextgroup=mcDoubleSpace,mcGamemodeSet

syn keyword mcGamemode          contained survival creative adventure spectator
syn keyword mcGamemodeSet       contained survival creative adventure spectator skipwhite nextgroup=mcDoubleSpace,@mcEntity
hi def link mcGamemodeSet       mcGamemode
hi def link mcGamemode          mcKeyValue
