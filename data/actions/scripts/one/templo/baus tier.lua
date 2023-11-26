local coin = 2160 -- sua moeda vip
local lever = {
[6110] = {10,7528},
[6111] = {50,7529},
[6112] = {100,7530},
[6113] = {250,7531},
}
local arrows = {2158,2154,2156} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa de 2 crystal coins = 2000 gold coins = 200 platinum coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doSendAnimatedText(toPosition,'TRADE', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end