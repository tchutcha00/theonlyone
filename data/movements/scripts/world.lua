local config = {
	playerCount = 3915, -- Global storage for counting the players in the event
	maxPlayers = 25, -- Max players who can participate
        pos2 = {x = 1095, y = 1063, z = 7}, --Coordenada para onde o jogador será teleportado caso player não tenha o item.
}
	
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getGlobalStorageValue(config.playerCount) < config.maxPlayers then
		setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)+1)
		setPlayerStorageValue(cid, 3920, getPlayerStorageValue(cid, 3920)+1)
		if getGlobalStorageValue(config.playerCount) == config.maxPlayers then
			doBroadcastMessage("O evento 'World Boss' foi lotado! E começerá em alguns instantes.", MESSAGE_STATUS_CONSOLE_BLUE)
		else	
			doBroadcastMessage("O jogador (" .. getPlayerName(cid) .. ") entrou no evento 'World Boss'! Atualmente " .. getGlobalStorageValue(config.playerCount) .. " jogadores entraram!", MESSAGE_STATUS_CONSOLE_BLUE)
                        doBroadcastMessage("Restando "..config.maxPlayers - getGlobalStorageValue(config.playerCount).." jogadores para entrar!", MESSAGE_STATUS_CONSOLE_BLUE)
		end	
	else
                addEvent(tpBack, 1000, cid, config.pos2)
		doPlayerSendCancel(cid, "")
                doBroadcastMessage("[EVENTO WORLD BOSS MENSAGEM] está cheio. Já existem " .. config.maxPlayers .. " jogadores participando.", MESSAGE_STATUS_CONSOLE_BLUE)
		return false
	end
        print(getStorage(config.playerCount) .. " Players no World Boss Event.")
	return true
end

function tpBack(cid, fromPosition)
	doTeleportThing(cid, config.pos2)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
end