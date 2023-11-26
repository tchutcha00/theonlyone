local coin = 9020 -- sua moeda vip
local lever = {
[7653] = {100,8979},
}

function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa de 100 Kronos tokens.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doSendAnimatedText(toPosition,'TRADE', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end