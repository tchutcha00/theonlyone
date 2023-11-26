local coin = 2159 -- sua moeda vip
local lever = {
[6020] = {10,2214,"Voce precisa de 10 Event Coins para comprar a Life Ring."},
[6021] = {10,2168,"Voce precisa de 10 Event Coins para comprar a Mana Ring."},
[6022] = {10,9933,"Voce precisa de 10 Event Coins para comprar a Firewalker Boots."},
[6023] = {10,11737"Voce precisa de 10 Event Coins para comprar o Phoenix Pet."},
[6024] = {10,1990,"Voce precisa de 10 Event Coins para comprar a Present."},
[6026] = {10,2169,"Voce precisa de 10 Event Coins para comprar a Time Ring."},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"" .. lever[item.actionid][3] .."")
                end
                         doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                         doPlayerSendTextMessage(cid,28,"Item Comprado! ")
                         doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
      return true
end