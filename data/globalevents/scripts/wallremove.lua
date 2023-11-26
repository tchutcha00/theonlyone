local timeToCreate = 1 -- minutes
local walls = {x = 1143, y = 1055, z = 7,  stackpos = 1}

function removeWalls()
                doRemoveItem(getThingFromPos(walls).uid, 1)
end
 
function onThink(interval, lastExecution)
addEvent(removeWalls, 60*60*1000)
return TRUE
end 