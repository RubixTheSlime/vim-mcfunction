
normal stuff: /\(\w\|\.\)*/
quoted thing: /"/ .. /"/ (/\\"/)
thing in braces: /{/ .. /}\./
thing in brackets: /\[/ .. /\]\./
bracket&brace may contain any NBT Tag information


After Big Confusion (Things got really confusing and I had to rethink a
lot):

Path may be of form {Attr1:val}.Attr2, Tag may not
Tag does not support Attr1.Attr2, must be Attr1:{Attr2}
Path must use Array[], Tag must use Array:[]
Tag cannot index arrays, may only be attr:[{attr:val}]
Anything inside a Path's {} follows Tag properties

Path:
{Tag} -> . -> Path
"" -> . -> Path
""[0] -> . -> Path
""[{Tag}] -> . -> Path

may start with name, "name", or {Tag}

Tag:
"": -> # ,]}
"": -> {Tag} ,]}
"": -> [{Tag},{Tag}] ,]}
