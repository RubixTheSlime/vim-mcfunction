syn keyword mcCommand datapack                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackKeyword

syn keyword mcDatapackKeyword           disable                 contained skipwhite nextgroup=mcDoubleSpace,mcDatapackName
syn keyword mcDatapackKeyword           enable                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnable
syn keyword mcDatapackKeyword           list                    contained skipwhite nextgroup=mcDoubleSpace,mcDatapackListKeyword
syn match   mcDatapackName              /\w\+/                  contained
syn match   mcDatapackNameEnable        /\w\+/                  contained skipwhite nextgroup=mcDoubleSpace,mcDatapackEnableKeyword
syn match   mcDatapackNameEnableRel     /\w\+/                  contained
syn keyword mcDatapackEnableKeyword     first last              contained
syn keyword mcDatapackEnableKeyword     before after            contained skipwhite nextgroup=mcDoubleSpace,mcDatapackNameEnableRel
syn keyword mcDatapackListKeyword       enabled available       contained
hi def link mcDatapackNameEnable        mcDatapackName
hi def link mcDatapackNameEnableRel     mcDatapackName
hi def link mcDatapackEnableKeyword     mcDatapackKeyword
hi def link mcDatapackListKeyword       mcDatapackKeyword
hi def link mcDatapackKeyword           mcKeyword
