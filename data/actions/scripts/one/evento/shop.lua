local coin = 2159 -- sua moeda vip
local lever = {
[6020] = {20,2214,"Voce precisa de 20 Event Coins para comprar um Life Ring."},
[6021] = {20,2168,"Voce precisa de 20 Event Coins para comprar um Mana Ring."},
[6022] = {20,9933,"Voce precisa de 20 Event Coins para comprar uma Firewalker Boots."},
[6023] = {10,2092,"Voce precisa de 10 Event Coins para comprar 1 Arena Key."},
[6024] = {150,9020,"Voce precisa de 150 Event Coins para comprar 10 Onlyone Token."},
[6026] = {20,2169,"Voce precisa de 20 Event Coins para comprar um Speed Ring."},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"" .. lever[item.actionid][3] .."")
                end
                         doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 10 or 1)
                         doPlayerSendTextMessage(cid,28,"Item Comprado! ")
                         doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
      return true
end