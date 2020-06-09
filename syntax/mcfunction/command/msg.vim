syn keyword mcCommand msg w tell teammsg tm me  contained skipwhite nextgroup=mcDoubleSpace,@mcEntityMsg
syn keyword mcCommand say                       contained skipwhite nextgroup=mcDoubleSpace,mcChatMessage 

syn match   mcChatMessage       /.*/    contained
