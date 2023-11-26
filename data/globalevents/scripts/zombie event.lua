local config = {
	playerCount = 2001, -- Global storage for counting the players left/entered in the event
	zombieCount = 2002, -- Global storage for counting the zombies in the event
	teleportActionId = 2000, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1089, y = 1055, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1152, y = 1028, z = 7}, -- Where the teleport will take you
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 2, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
	timeBetweenSpawns = 5, -- Seconds between each spawn of zombie
	zombieName = "Zombie", -- Name of the zombie that should be summoned
	playersNeededToStartEvent = 3, -- Players needed before the zombies can spawn.
	
	-- Should be the same as in the creaturescript!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1135, y = 1018, z = 7}, {x = 1170, y = 1040, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1170, y = 1040, z = 7}, {x = 1135, y = 1018, z = 7}, -- bottom right cornor of the playground
	}


function onTime()
	local tp = doCreateTeleport(config.teleportId, config.teleportToPosition, config.teleportPosition)
	doItemSetAttribute(tp, "aid", config.teleportActionId)
	doBroadcastMessage("O evento 'Zombie' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_RED)
	setGlobalStorageValue(config.playerCount, 0)
	setGlobalStorageValue(config.zombieCount, 0)
	addEvent(startEvent, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(2001))
end

function startEvent()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)              
	end
	
	local fromPosition, toPosition = config.fromPosition, config.toPosition

	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
		doBroadcastMessage("Boa sorte no evento 'Zombie' jogadores! O portal foi fechado! E o primeiro zombie aparecerá em 5 segundos.")

		
		for x = fromp.x, top.x do
			for y = fromp.y, top.y do
				for z = fromp.z, top.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then
						doBroadcastMessage(getPlayers.uid, "EVENTO ZOMBIE MENSAGEM: O primeiro zombie vai aparecer em " .. config.timeBetweenSpawns .. " segundos. Boa sorte!", MESSAGE_STATUS_CONSOLE_BLUE)
					end
				end
			end
		end
	else
		doBroadcastMessage("EVENTO ZOMBIE MENSAGEM: O evento 'Zombie' não pode ser iniciado pelo pequeno número de jogadores participando. No mínimo " .. config.playersNeededToStartEvent .. " jogadores é necessário!", MESSAGE_STATUS_CONSOLE_BLUE)
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

function spawnZombie()
	if getGlobalStorageValue(config.playerCount) >= 1 then
		pos = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}
		doSummonCreature(config.zombieName, pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		setGlobalStorageValue(config.zombieCount, getGlobalStorageValue(config.zombieCount)+1)
		doBroadcastMessage("EVENTO ZOMBIE MENSAGEM: Um novo zombie apareceu! Agora temos: " .. getGlobalStorageValue(config.zombieCount) .. " zombies no evento!", MESSAGE_STATUS_CONSOLE_BLUE)
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
	end
end