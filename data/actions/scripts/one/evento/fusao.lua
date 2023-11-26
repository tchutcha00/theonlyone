function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=1082, y=1084, z=9} -- lugar
local time = 60

if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas níveis 130+ podem acessar a quest da fishing rod e picareta.")
end
for i = 1,time do
formula = time - 1*i
addEvent(doSendAnimatedText,i*1000, config.position, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position1, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position2, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position3, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position4, formula, math.random(1, 255))
end
function removeWall()
setGlobalStorageValue(sto, -1)
return true
end
addEvent(removeWall, config.time*60*1000)
for x = config.fromPosition.x, config.toPosition.x do
for y = config.fromPosition.y, config.toPosition.y do
for z = config.fromPosition.z, config.toPosition.z do
areapos = {x = x, y = y, z = z, stackpos = 253}
getMonsters = getThingfromPos(areapos)
if isMonster(getMonsters.uid) then
doRemoveCreature(getMonsters.uid)
end
end
end
end
function removePlayer()
if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
end
end
addEvent(removePlayer, config.time*60*1000)
end
                        doTeleportThing(cid, position)
			doPlayerSendTextMessage(cid, 19, "Boa sorte você acabou de entra na quest da fishing rod e picareta.")
	return TRUE
end