local pos = {x=1394, y=1023, z=8} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 10 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 10 resets + podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end




