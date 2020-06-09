syn keyword mcCommand enchant                   contained skipwhite nextgroup=mcDoubleSpace,@mcEntityEnchant


syn match   mcEnchantment                       /\(\w\|:\)\+/   contained contains=mcNamespace,mcBuiltinEnchantment skipwhite nextgroup=mcDoubleSpace,mcEnchantmentLevel
syn match   mcEnchantmentLevel  /[0-5]/ contained
