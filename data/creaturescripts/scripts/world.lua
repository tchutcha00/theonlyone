local config = {
	playerCount = 3915, -- Global storage for counting the players left/entered in the event
        fromPosition = {x = 1246, y = 770, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1287, y = 1049, z = 7}, -- bottom right cornor of the playground
	}

function onDeath(cid)
if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
if getGlobalStorageValue(config.playerCount) >= 1 then

local pos = {x=1152, y=1192, z=7}
return doCreateMonster('Arenator', pos)
end