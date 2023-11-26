local pos = {x=1012, y=1120, z=7} -- Posicao pra onde vai o player

function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 15 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doPlayerSendTextMessage(cid, 19, "Apenas players com 15 resets + podem passar!")
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getPlayerPosition(cid), 14)
end
end



