local config = {
	playerCount = 5011, -- Global storage for counting the players left/entered in the event
	teleportActionId = 1905, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1086, y = 1055, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 2, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
	timeBetweenSpawns = 2, -- Seconds between each spawn of zombie
	phantasmName = "Phantasm", -- Name of the zombie that should be summoned
	playersNeededToStartEvent = 2, -- Players needed before the zombies can spawn.
	fromPosition = {x = 1195, y = 1028, z = 7}, {x = 1208, y = 1036, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1208, y = 1036, z = 7}, {x = 1195, y = 1028, z = 7}, -- bottom right cornor of the playground
	}
	
	

function isOnSameFloor(fromPos, toPos)
    return fromPos.z == toPos.z and true or false
end

function isEven(arg)
    return arg % 2 == 0 and true or false
end

function getMiddlePos(fromPos, toPos)
    if not isOnSameFloor(fromPos, toPos) then
        return false
    end
    
    local middle = {x = 0, y = 0, z = 0}    
        middle.x = isEven(fromPos.x + toPos.x) and (fromPos.x + toPos.x)/2 or math.floor((fromPos.x + toPos.x)/2) + 1
        middle.y = isEven(fromPos.y + toPos.y) and (fromPos.y + toPos.y)/2 or math.floor((fromPos.y + toPos.y)/2) + 1
        middle.z = fromPos.z or toPos.z
    return middle
end

function getDistanceRadius(fromPos, toPos)
    if not isOnSameFloor(fromPos, toPos) then
        return false
    end
    
    local distance = getDistanceBetween(fromPos, toPos)
    return isEven(distance) and (distance/2) or math.floor(distance/2) + 1
end



function clearArea200(middlePos, rangex, rangey) 
    for i = -rangex, rangex do
        for j = -rangey, rangey do
            pos = {x = middlePos.x + i, y = middlePos.y + j, z = middlePos.z}
			getPlayers = getTopCreature(pos).uid
            if isPlayer(getPlayers) then
               guerra = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}			
                doSendMagicEffect(getPlayerPosition(getPlayers), CONST_ME_TELEPORT)
                doTeleportThing(getPlayers, guerra)
            end
        end
    end
    return true
end

               
                    


	
function onTime()
doItemSetAttribute(doCreateItem(1387, 1, config.teleportPosition), "aid", config.teleportActionId)
	doBroadcastMessage("O evento 'Last Man Standing' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_BLUE)
	setGlobalStorageValue(config.playerCount, 0)
	setGlobalStorageValue(config.phantasmCount, 0)
	addEvent(startEvento, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(5011))
end

function startEvento()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)                
	end

 local configure = {
        fromPos = {x=1201, y=1015, z=7}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1205, y=1019, z=7}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
    }
	
	local fromPosition, toPosition = configure.fromPos, configure.toPos
	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then    
          		
		doBroadcastMessage("Boa sorte no evento 'Last Man Standing' jogadores! O portal foi fechado.") 
		local rx = getDistanceRadius(configure.fromPos, configure.toPos)
        addEvent(clearArea200, 1 * 1 * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)

		
		for x = fromPosition.x, toPosition.x do
			for y = fromPosition.y, toPosition.y do
				for z = fromPosition.z, toPosition.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then						
					end
				end
			end
		end
	else
		doBroadcastMessage("EVENTO LAST MAN STANDING: não pode ser iniciado pelo pequeno número de jogadores participando. No mínimo " .. config.playersNeededToStartEvent .. " jogadores é necessário!", MESSAGE_STATUS_CONSOLE_BLUE)                
		for x = fromPosition.x, toPosition.x do
			for y = fromPosition.y, toPosition.y do
				for z = fromPosition.z, toPosition.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then
                                            doRemoveCreature(pid)
						doTeleportThing(getPlayers.uid, getTownTemplePosition(getPlayerTown(getPlayers.uid)), true)
						doSendMagicEffect(getPlayerPosition(getPlayers.uid), CONST_ME_TELEPORT)
					end
				end
			end
		end
	end
end