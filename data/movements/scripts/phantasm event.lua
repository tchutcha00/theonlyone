local config = {
	playerCount = 5011, -- Global storage for counting the players in the event
	maxPlayers = 8, -- Max players who can participate
        pos2 = {x = 1139, y = 1058, z = 6}, --Coordenada para onde o jogador será teleportado caso player não tenha o item.
        posi = {x = 1203, y = 1017, z = 7}, --Coordenada para onde o jogador será teleportado caso player não tenha o item.
}


	
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if getPlayerStorageValue(cid, 789153) >= os.time() then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Desculpe, mas o item ainda está ativo e você continua protegido!") return true
end
	if getGlobalStorageValue(config.playerCount) < config.maxPlayers then
		setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)+1)
		doTeleportThing(cid, config.posi)
		if getGlobalStorageValue(config.playerCount) == config.maxPlayers then
			doBroadcastMessage("O evento 'Last Man Standing' foi lotado! E começerá em alguns instantes.", MESSAGE_STATUS_CONSOLE_BLUE)
		else	
			doBroadcastMessage("O jogador (" .. getPlayerName(cid) .. ") entrou no evento 'Last Man Standing'! Atualmente " .. getGlobalStorageValue(config.playerCount) .. " jogadores entraram!", MESSAGE_STATUS_CONSOLE_BLUE)
                        doBroadcastMessage("Restando "..config.maxPlayers - getGlobalStorageValue(config.playerCount).." jogadores para entrar!", MESSAGE_STATUS_CONSOLE_BLUE)
		end	
	else
                addEvent(tpBack, 1000, cid, config.pos2)
		doPlayerSendCancel(cid, "")
                doBroadcastMessage("[EVENT LAST MENSAGEM] está cheio. Já existem " .. config.maxPlayers .. " jogadores participando.", MESSAGE_STATUS_CONSOLE_ORANGE)
		return false
end		
        print(getStorage(config.playerCount) .. " Players no Last Man Standing Event.")
	return true
end

function tpBack(cid, fromPosition)
	doTeleportThing(cid, config.pos2)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
end