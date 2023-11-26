local coin = 5954 -- sua moeda vip
local lever = {
[1004] = {1,7958},
[1005] = {1,7366},
[1006] = {1,2400},
[1007] = {1,2431},
[1008] = {1,2452},
[1009] = {1,1990}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa de 1 annihilion horn.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doPlayerSendTextMessage(cid,28,"TRADE")
                                                                doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
                                return true
end