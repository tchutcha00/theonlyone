local pos = {x=1333, y=990, z=8} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 0 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 10 resets + podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end




