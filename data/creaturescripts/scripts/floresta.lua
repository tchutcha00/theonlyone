local config = {
	playerCount = 2915, -- Global storage for counting the players left/entered in the event
	inicio = {x = 1266, y = 776, z = 7},
        fromPosition = {x = 1246, y = 770, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1287, y = 1049, z = 7}, -- bottom right cornor of the playground
	}

function onStatsChange(cid, attacker, type, combat, value)
    if isPlayer(cid) and isMonster(attacker) then
        if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
            if getGlobalStorageValue(config.playerCount) >= 1 then
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") foi pego pelos Haunted Treeling, e voltou para o inicio!", MESSAGE_STATUS_CONSOLE_ORANGE)                                
                doTeleportThing(cid, config.inicio) 
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
				
                              
                
						
                for x = config.fromPosition.x, config.toPosition.x do
                    for y = config.fromPosition.y, config.toPosition.y do
                        for z = config.fromPosition.z, config.toPosition.z do
                            areapos = {x = x, y = y, z = z, stackpos = 253}
                            getMonsters = getThingfromPos(areapos)
                            if isMonster(getMonsters.uid) then
                                doRemoveCreature(getMonsters.uid)
                            end
                        end
                    end
                end
            end
            return false
        end
    end
    return true
end