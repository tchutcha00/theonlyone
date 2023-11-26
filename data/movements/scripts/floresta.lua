local config = {
	playerCount = 2915, -- Global storage for counting the players in the event
	maxPlayers = 30, -- Max players who can participate
        pos2 = {x = 1095, y = 1063, z = 7}, --Coordenada para onde o jogador será teleportado caso player não tenha o item.
}
	
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getGlobalStorageValue(config.playerCount) < config.maxPlayers then
		setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)+1)
		if getGlobalStorageValue(config.playerCount) == config.maxPlayers then
			doBroadcastMessage("O evento 'Floresta Encantada' foi lotado! E começerá em alguns instantes.", MESSAGE_STATUS_CONSOLE_BLUE)
		else	
			doBroadcastMessage("O jogador (" .. getPlayerName(cid) .. ") entrou no evento 'Floresta Encantada'! Atualmente " .. getGlobalStorageValue(config.playerCount) .. " jogadores entraram!", MESSAGE_STATUS_CONSOLE_BLUE)
                        doBroadcastMessage("Restando "..config.maxPlayers - getGlobalStorageValue(config.playerCount).." jogadores para entrar!", MESSAGE_STATUS_CONSOLE_BLUE)
		end	
	else
                addEvent(tpBack, 1000, cid, config.pos2)
		doPlayerSendCancel(cid, "")
                doBroadcastMessage("[EVENTO FLORESTA ENCANTADA MENSAGEM] está cheio. Já existem " .. config.maxPlayers .. " jogadores participando.", MESSAGE_STATUS_CONSOLE_ORANGE)
		return false
	end
        print(getStorage(config.playerCount) .. " Players no forest event.")
	return true
end

function tpBack(cid, fromPosition)
	doTeleportThing(cid, config.pos2)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
end