local timeToCreate = 2 -- minutes
local walls = {x = 1143, y = 1055, z = 7,  stackpos = 1}

function createWalls()
                doCreateItem(9486, 1, walls)
end
 
function onThink(interval, lastExecution)
addEvent(createWalls, 2*60*1000)
return TRUE
end 