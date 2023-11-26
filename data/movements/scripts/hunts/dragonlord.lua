local pos = {x=821, y=1200, z=6} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 0 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 5 resets + podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end



