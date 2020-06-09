" Scoreboard

syn match   mcTeamName                    /\(\w\|[.+-]\)\+/       contained
syn match   mcTagName                     /\(\w\|[.+-]\)\+/       contained

syn match   mcObjectiveName                             /\(\w\|[.+-]\)\+/       contained
syn match   mcObjectiveNameExecuteStore                 /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
syn match   mcObjectiveNameFilter                       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcFilterEqScore
syn match   mcObjectiveNameExecuteCondScoreTarget       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,mcExecuteCondScoreMatch,mcExecuteCondScoreOp
syn match   mcObjectiveNameExecuteCondScoreSource       /\(\w\|[.+-]\)\+/       contained skipwhite nextgroup=mcDoubleSpace,@mcExecuteKeyword
hi def link mcObjectiveNameExecuteStore                 mcObjectiveName
hi def link mcObjectiveNameFilter                       mcObjectiveName
hi def link mcObjectiveNameExecuteCondScoreTarget       mcObjectiveName
hi def link mcObjectiveNameExecuteCondScoreSource       mcObjectiveName
