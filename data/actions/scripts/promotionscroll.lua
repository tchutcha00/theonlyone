local mageffect = 55 -- choose an effect to use (you can change this look in lib for magic effects)
local level = 1 -- level needed to use the script.

function onUse(cid, item, fromPosition, itemEX, toPosition)
local voc = getPlayerVocation(cid)
local vocname = getPlayerVocationName(cid)
if(getPlayerVocation(cid) >= 5 and getPlayerVocation(cid) <= 8 and getPlayerLevel(cid) >= level) then
setPlayerPromotionLevel(cid, 2)
local vocnamenew = getPlayerVocationName(cid)
doSendAnimatedText(getPlayerPosition(cid), "PROMOVIDO!", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
doSendMagicEffect(getPlayerPosition(cid), 29)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns, você foi promovido para " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
doRemoveItem(item.uid,1)

else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você já foi promovido!")
end
return TRUE
end