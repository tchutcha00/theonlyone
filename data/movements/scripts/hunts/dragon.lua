local pos = {x=1647, y=768, z=7}
function onStepIn(cid, item, position, lastPosition, fromPosition)
if getResets(cid) >= 0 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 19, "Bem Vindo!")
else
doTeleportThing(cid, fromPosition)
end
end





