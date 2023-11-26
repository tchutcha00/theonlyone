function onThink(interval, lastExecution, thinkInterval)
local tabla = {}
local maxDistance = 6
for _, pid in ipairs(getPlayersOnline()) do
local summons = getCreatureSummons(pid)
if #summons > 0 then
table.insert(tabla, pid)
end
end
for _, t in ipairs(tabla) do
local summ = getCreatureSummons(t)
if getThingPos(t).z ~= getThingPos(summ[1]).z or getDistanceBetween(getThingPos(t), getThingPos(summ[1])) > maxDistance then
doTeleportThing(summ[1], getThingPos(t))
doSendMagicEffect(getThingPos(t), 12)
end
end
return true
end