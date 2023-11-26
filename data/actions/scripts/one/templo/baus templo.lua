local coin = 2000 -- sua moeda vip
local lever = {
[6002] = {20,9931},
[6003] = {20,2184},
[6004] = {20,7438},
[6005] = {20,2352},
[6007] = {20,2197},
[6008] = {20,8929},
[6009] = {20,8925},
[6010] = {20,8932}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                 
                                  if doPlayerRemoveMoney(cid, 2000) then
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doSendAnimatedText(toPosition,'TRADE', TEXTCOLOR_RED)
                                                                doSendMagicEffect(toPosition,12)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisa de 2000 gold coins para comprar este item.")
end
return true
end