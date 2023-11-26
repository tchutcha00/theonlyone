local mageffect = 55 -- choose an effect to use (you can change this look in lib for magic effects)
local level = 1 -- level needed to use the script.

function onUse(cid, item, fromPosition, itemEX, toPosition)
local voc = getPlayerVocation(cid)
local vocname = getPlayerVocationName(cid)
if(getPlayerVocation(cid) >= 5 and getPlayerVocation(cid) <= 8 and getPlayerLevel(cid) >= level) then
setPlayerPromotionLevel(cid, 2)
local vocnamenew = getPlayerVocationName(cid)
doSendAnimatedText(getPlayerPosition(cid), "PROMOVIDO!", TEXTCOLOR_YELLOW)
doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
doSendMagicEffect(getPlayerPosition(cid), 30)
doRemoveItem(item.uid,1)

else
doPlayerSendCancel(cid, "Você Já é Promovido.")
end
return TRUE
end