function onStepIn(cid, item, position, fromPosition)
location = {
{x=1133, y=1156, z=8}, -- Adicione uma coordenada
}

if isPlayer(cid) then
return doTeleportThing(cid, location[math.random(#location)])
end
end