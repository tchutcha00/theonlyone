local config = {
	playerCount = 3915, -- Global storage for counting the players left/entered in the event
	teleportActionId = 3200, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1143, y = 1062, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1174, y = 1069, z = 7}, -- Where the teleport will take you
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 2, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
	timeBetweenSpawns = 10, -- Seconds between each spawn of zombie
	zombieName = "Agorak", -- Name of the zombie that should be summoned
	playersNeededToStartEvent = 2, -- Players needed before the zombies can spawn.
	
	-- Should be the same as in the creaturescript!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1163, y = 1056, z = 7}, {x = 1187, y = 1083, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1187, y = 1083, z = 7}, {x = 1163, y = 1056, z = 7}, -- bottom right cornor of the playground
	}


function onTime()
	local tp = doCreateTeleport(config.teleportId, config.teleportToPosition, config.teleportPosition)
	doItemSetAttribute(tp, "aid", config.teleportActionId)
	doBroadcastMessage("O evento 'World Boss Event' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_RED)
	setGlobalStorageValue(config.playerCount, 0)
	addEvent(World, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(2001))
end

function World()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)              
	end
	
	local fromPosition, toPosition = config.fromPosition, config.toPosition

	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then
		addEvent(spawnWorld, config.timeBetweenSpawns * 1000)
		doBroadcastMessage("Boa sorte no 'World Boss Event' jogadores! O portal foi fechado! E o primeiro boss aparecerá em 10 segundos.")

		
		
					
					if isPlayer(getPlayers.uid) then
						doBroadcastMessage(getPlayers.uid, "EVENTO WORLD BOSS MENSAGEM: O primeiro boss vai aparecer em " .. config.timeBetweenSpawns .. " segundos. Boa sorte!", MESSAGE_STATUS_CONSOLE_RED)
					end				
	else
		doBroadcastMessage("EVENTO WORLD BOSS MENSAGEM: O evento 'World Boss' não pode ser iniciado pelo pequeno número de jogadores participando. No mínimo " .. config.playersNeededToStartEvent .. " jogadores é necessário!", MESSAGE_STATUS_CONSOLE_RED)
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

function spawnWorld()
	if getGlobalStorageValue(config.playerCount) >= 2 then
		pos = {x = 1174, y = 1069, z = 7}
		doSummonCreature(config.zombieName, pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
	end
end