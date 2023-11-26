local pos = {x=1799, y=961, z=8} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 20 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 20 resets ou mais podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end




