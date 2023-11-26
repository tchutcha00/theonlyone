local coin = 2160 -- sua moeda vip
local lever = {
[6001] = {1,8306,"Voce precisa de 10k = 1 crystal coin = 100000 Gps para comprar a Refine Stone."},
[6002] = {10,9931,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar a Coconut Shoes."},
[6003] = {10,2184,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar a Crystal Wand."},
[6004] = {10,7438,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar o Elvish Bow."},
[6005] = {10,2352,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar a Crystal Arrow."},
[6006] = {10,8932,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar a The Calamity."},
[6007] = {10,2197,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar o Stone Skin Amulet."},
[6008] = {10,8929,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar o The Stomper."},
[6009] = {10,8925,"Voce precisa de 100k = 10 crystal coin = 100000 Gps para comprar o Solar Axe."},
[6011] = {10,8305,"Voce precisa de 3kk = 300 crystal coin = 3000000 Gps para comprar a master upgrade stone."},
[6059] = {30,6541,"Voce precisa de 300k = 30 crystal coin = 300000 Gps para comprar o Holy Pet."},
[6051] = {30,6542,"Voce precisa de 300k = 30 crystal coin = 300000 Gps para comprar o Fire Pet."},
[6052] = {30,6543,"Voce precisa de 300k = 30 crystal coin = 300000 Gps para comprar o Ice Pet."},
[6053] = {30,6544,"Voce precisa de 300k = 30 crystal coin = 300000 Gps para comprar o Terra Pet."},
[6054] = {30,6545,"Voce precisa de 300k = 30 crystal coin = 300000 Gps para comprar o Energy Pet."},
[6055] = {1000,2154,"Voce precisa de 10kk = 1000 crystal coin = 10000000 Gps para comprar a Spirit Gem."},
[6056] = {1000,2156,"Voce precisa de 10kk = 1000 crystal coin = 10000000 Gps para comprar a Health Gem."},
[6057] = {1000,2158,"Voce precisa de 10kk = 1000 crystal coin = 10000000 Gps para comprar a Mana Gem."},
[6058] = {100,8305,"Voce precisa de 1kk = 100 crystal coin = 1000000 para comprar a Master Refine Stone."}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"" .. lever[item.actionid][3] .."")
                end
                         doPlayerAddItem(cid,lever[item.actionid][2], 1)
                         doPlayerSendTextMessage(cid,28,"Item Comprado! ")
                         doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
      return true
end