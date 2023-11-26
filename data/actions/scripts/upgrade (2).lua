function onUse(cid, item, fromPosition, itemEx, toPosition)
local obj = Refine:load(itemEx)
if obj and obj:upgrade(cid, item) then
doSendAnimatedText(toPosition, "Success!", COLOR_GREEN)
doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
else
doSendAnimatedText(toPosition, "Fail!", COLOR_RED)
doSendMagicEffect(toPosition, CONST_ME_POFF)
return false
end
return true
end