syn keyword mcCommand weather                   contained skipwhite nextgroup=mcDoubleSpace,mcWeather

syn keyword mcWeather           contained clear rain thunder skipwhite nextgroup=mcDoubleSpace,mcWeatherDuration
syn match   mcWeatherDuration   /\d\{0,6\}/ contained
hi def link mcWeather           mcKeyword
hi def link mcWeatherDuration   mcValue
