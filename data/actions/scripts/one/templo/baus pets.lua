local coin = 2160 -- sua moeda vip
local lever = {
[6011] = {3,6541},
[6012] = {3,6542},
[6013] = {3,6543},
[6014] = {3,6544},
[6015] = {3,6545},
}
local arrows = {6541,6542,6543,6544,6545} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente (3000 gold coins = 30k = 3 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doSendAnimatedText(toPosition,'TRADE', TEXTCOLOR_RED)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end