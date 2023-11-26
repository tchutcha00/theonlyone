local config = {
        playerCount = 2024, -- Global storage for counting the players left/entered in the event
	teleportActionId = 2025, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1143, y = 1054, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1152, y = 1028, z = 7}, -- Where the teleport will take you
        Bossposition = {x = 1152, y = 1028, z = 7}, -- Where the teleport will take you
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 2, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
        timeBetweenSpawns = 5, -- Seconds between each spawn of zombie
	playersNeededToStartEvent = 5, -- Players needed before the zombies can spawn.
        walls = {x = 1189, y = 1044, z = 7,  stackpos = 1},
        boss1 = "Zacklyon",
        boss2 = "Acyd",
        boss3 = "Anomaly",
        boss4 = "Arachir",
        boss5 = "Azariel",
        boss6 = "Hagaragoth",
        boss7 = "Strogonoth",
        boss8 = "Ekatrix",
        boss9 = "Heming",
        boss10 = "Kerberos",
	
	-- Should be the same as in the creaturescript!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1135, y = 1018, z = 7}, {x = 1170, y = 1040, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1170, y = 1040, z = 7}, {x = 1135, y = 1018, z = 7}, -- bottom right cornor of the playground
	}



function onThink()
	local tp = doCreateTeleport(config.teleportId, config.teleportToPosition, config.teleportPosition)
	doItemSetAttribute(tp, "aid", config.teleportActionId)
	doBroadcastMessage("O evento 'Zombie' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_BLUE)
        doRemoveItem(getThingFromPos(config.walls).uid, 1)
	setGlobalStorageValue(config.playerCount, 0)
	setGlobalStorageValue(config.zombieCount, 0)
	addEvent(startEvents, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(2024))
end

function startEvents()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)              
	end
	
	local fromPosition, toPosition = config.fromPosition, config.toPosition

	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
		doBroadcastMessage("Boa sorte no evento 'Zombie' jogadores! O portal foi fechado! E o primeiro zombie aparecerá em 5 segundos.")
                doCreateItem(9486, 9532, 1, config.walls)

		
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
                doCreateItem(9486, 9532, 1, config.walls)
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
	if getGlobalStorageValue(config.playerCount) >= 2 then
		pos = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}
		doSummonCreature(config.zombieName, pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		setGlobalStorageValue(config.zombieCount, getGlobalStorageValue(config.zombieCount)+1)
		doBroadcastMessage("EVENTO ZOMBIE MENSAGEM: Um novo zombie apareceu! Agora temos: " .. getGlobalStorageValue(config.zombieCount) .. " zombies no evento!", MESSAGE_STATUS_CONSOLE_BLUE)
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
	end
end
















local monster = Dragon Lord

local bossname= "Demodras"

local bossgo = {x=930,y=907,z=7} -- Coordenas de a onde o monstro irá aparecer! (Demodras)

 

function onDeath(cid)

local monsters = monster[getCreatureName(cid)]

if monsters then

actionstatus = getPlayerStorageValue(cid,6666)

if actionstatus == -1 then

if doCreatureSay(cid,"You went in the wrong place, beware!",TALKTYPE_ORANGE_1) then

setPlayerStorageValue(cid,6666,1)

 

function Summon()

doSummonCreature(bossname,bossgo)

doSendMagicEffect(bossname,36)

 

addEvent(Summon,100)

 

end

end?

















function evento(i)
        if #getPlayersInArena() == 0 then
         doBroadcastMessage("[unicos Sobrevivente] Ninguém sobreviveu, Evento finalizado.")
         HaveCreatureArena({config.posicaoArena[1],config.posicaoArena[2]}, true, true)
         resetEvento()
         return true
        end
  
        if i == (#leveis +1) then
        HaveCreatureArena({config.posicaoArena[1],config.posicaoArena[2]}, true, true)
          doBroadcastMessage("[unicos Sobrevivente] Apenas " .. #getPlayersInArena() .. " ficaram vivos no evento. ")
         for _, pid in ipairs(getPlayersInArena()) do
          doPlayerSendTextMessage(pid,22,"[unicos Sobrevivente] Parabéns você ficou vivo.")
          addItens(pid)
          doTeleportThing(pid,getTownTemplePosition(getPlayerTown(pid)))
         end
          resetEvento()
          return true
        end
         for _, pid  in ipairs(getPlayersInArena()) do
        doBroadcastMessage("[unicos Sobrevivente] Está na " .. i .. " wave está começando ficar mais dificil.")
         end
        criarMonstros(i)
        addEvent(evento,config.delay*60*1000,i+1)
   end
   function addItens(pid)
        for i=1,#config.premio do
         doPlayerAddItem(pid,config.premio[1],config.premio[2])
        end
        doPlayerSendTextMessage(pid,22,"[unicos Sobrevivente], Parabéns você ganhou e recebeu seu premio.")
   end