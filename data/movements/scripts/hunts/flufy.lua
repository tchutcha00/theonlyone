local pos = {x=1574, y=1074, z=7} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 30 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 30 resets ou mais podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end




