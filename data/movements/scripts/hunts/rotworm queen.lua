local pos = {x=1172, y=1064, z=8} -- Posicao pra onde vai o player


function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 0 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doTeleportThing(cid, fromPosition)
end
end

