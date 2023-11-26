local coin = 2159 -- sua moeda vip
local lever = {
[6026] = {10,2169},
[6020] = {10,2214},
[6021] = {10,2168},
[6022] = {10,9933},
[6024] = {10,1990},
[6008] = {1,8929},
[6009] = {1,8925},
[6010] = {1,8932}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doPlayerSendTextMessage(cid,28,"Item Comprado! ")
                                                                doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
                                return true
end