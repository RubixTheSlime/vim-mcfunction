syn keyword mcCommand forceload                 contained skipwhite nextgroup=mcDoubleSpace,mcForceloadKeyword

syn keyword mcForceloadKeyword          add     contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart
syn keyword mcForceloadKeyword          remove  contained skipwhite nextgroup=mcDoubleSpace,mcColumnForceloadStart,mcForceloadRemKeyword
syn keyword mcForceloadKeyword          query   contained skipwhite nextgroup=mcDoubleSpace,mcColumn
syn keyword mcForceloadRemKeyword       all contained
hi def link mcForceloadRemKeyword       mcForceloadKeyword
hi def link mcForceloadKeyword          mcKeyword
