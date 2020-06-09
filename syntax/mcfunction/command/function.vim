syn keyword mcCommand function                  contained skipwhite nextgroup=mcDoubleSpace,mcFunction

syn match   mcFunction          /#?[a-z0-9_-]\+:[a-z0-9./_-]*/ contained
