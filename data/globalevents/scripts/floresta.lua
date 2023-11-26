local config = {
	playerCount = 2915, -- Global storage for counting the players left/entered in the event
        hauntedCount = 2012, -- Global storage for counting the zombies in the event
	teleportActionId = 2060, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1092, y = 1055, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1266, y = 776, z = 7}, -- Where the teleport will take you
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 2, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
	tempo = 3, -- Seconds between each spawn of zombie
	hauntedName = "Haunted Treeling", -- Name of the zombie that should be summoned
	playersNeededToStartEvent = 2, -- Players needed before the zombies can spawn.
	fromPosition = {x = 1246, y = 770, z = 7}, {x = 1287, y = 1049, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1287, y = 1049, z = 7}, {x = 1246, y = 770, z = 7}, -- bottom right cornor of the playground
	}


function onTime()
	local tp = doCreateTeleport(config.teleportId, config.teleportToPosition, config.teleportPosition)
	doItemSetAttribute(tp, "aid", config.teleportActionId)
        local rx = getDistanceRadius(config.fromPosition, config.toPosition)
	doBroadcastMessage("O evento 'Floresta Encantada' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_BLUE)
	setGlobalStorageValue(config.playerCount, 0)
        setGlobalStorageValue(config.hauntedCount, 0) 
        addEvent(clearArea3, 720 * 1000, getMiddlePos(config.fromPosition, config.toPosition), rx, rx)     
	addEvent(startEventh, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(2915))
end

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


function clearArea3(middlePos, rangex, rangey)
    local final = {x=1098, y=1063, z=7} -- Posição onde será teleportado quando acabar o tempo
    
    for i = -rangex, rangex do
        for j = -rangey, rangey do
            pos = {x = middlePos.x + i, y = middlePos.y + j, z = middlePos.z}
            creature = getTopCreature(pos).uid
 
       
           
            if isMonster(creature) then
                doSendMagicEffect(getThingPos(creature), 14)
                doRemoveCreature(creature)
            elseif isPlayer(creature) then
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                doBroadcastMessage("EVENTO FLORESTA ENCANTADA MENSAGEM: O tempo acabou e não temos nenhum vencedor, aguarde o proximo evento!", MESSAGE_STATUS_CONSOLE_BLUE)
                doSendMagicEffect(getThingPos(creature), 10)
                doTeleportThing(creature, {x=1098, y=1063, z=7})
            end
        end
    end
    return true
end

function startEventh()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)              
	end
	
	local fromPosition, toPosition = config.fromPosition, config.toPosition
	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then
       addEvent(spawnFloresta, config.tempo * 1000) 
      doBroadcastMessage("EVENTO FLORESTA ENCANTADA MENSAGEM: O portal foi fechado! E os jogadores participantes tem 10 minutos para chegar ao final e clicar na estatua, caso contrario todos são teleportados para o templo!.", MESSAGE_STATUS_CONSOLE_BLUE)
               

		
		for x = fromPosition.x, toPosition.x do
			for y = fromPosition.y, toPosition.y do
				for z = fromPosition.z, toPosition.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then
						doBroadcastMessage(getPlayers.uid, "EVENTO FLORESTA ENCANTADA MENSAGEM: Boa sorte!", MESSAGE_STATUS_CONSOLE_BLUE)
					end
				end
			end
		end
	else
		doBroadcastMessage("EVENTO FLORESTA ENCANTADA MENSAGEM: O evento 'Floresta Encantada' não pode ser iniciado pelo pequeno número de jogadores participando. No mínimo " .. config.playersNeededToStartEvent .. " jogador é necessário!", MESSAGE_STATUS_CONSOLE_ORANGE)                
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

function spawnFloresta()
	if getGlobalStorageValue(config.playerCount) >= 2 then
		pos = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}
		doSummonCreature(config.hauntedName, pos)               
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		setGlobalStorageValue(config.hauntedCount, getGlobalStorageValue(config.hauntedCount)+1)
		addEvent(spawnFloresta, 1 * 1000)
	end
end


