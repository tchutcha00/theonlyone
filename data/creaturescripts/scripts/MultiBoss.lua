local config = {
	playerCount = 2024, -- Global storage for counting the players left/entered in the event
	
	goblet = 5805, -- id of the gold goblet you'll get when finishing the event.
	rewards = {2159}, -- You will get this +  a gold goblet with your name on.
	--		{moneyId, count, using? 1 for using moneyReward, 0 for not using.}
        moneyReward = {0, 0, 0},
	
	-- Should be same as in the globalevent!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1135, y = 1018, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1170, y = 1040, z = 7}, -- bottom right cornor of the playground
	}

local trofeu3lugar = 5807
local trofeu2lugar = 5806
local lvl3 = 1
local lvl2 = 2
local lvl1 = 3

function onStatsChange(cid, attacker, type, combat, value)
    if isPlayer(cid) and isMonster(attacker) then
        if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
            if getGlobalStorageValue(config.playerCount) >= 4 then
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") foi morto pelo Acyd!", MESSAGE_STATUS_CONSOLE_BLUE)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
            elseif getGlobalStorageValue(config.playerCount) == 3 then
                local ab = math.random(5, 10)
                local ba = 3
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'MultiBoss' em terceiro lugar! e ganhou 1 troféu de bronze, " .. ba .. " pontos zumbi e " .. ab .. " event coins.", 22)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                doPlayerAddItem(cid, 2159, ab)
                local trof = doPlayerAddItem(cid, trofeu3lugar, 1)
                local pontos = doPlayerAddPontos(cid, ba)
                doItemSetAttribute(trof, "description", "Ganhador: (" .. getPlayerName(cid) .. ") por vencer em 3º lugar no evento 'MultiBoss'.")
            elseif getGlobalStorageValue(config.playerCount) == 2 then
                local ab = math.random(9, 15)
                local ba = 7
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'MultiBoss' em segundo lugar! e ganhou 1 troféu de prata, " .. ba .. " pontos zumbi e " .. ab .. " event coins.", 22)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                doPlayerAddItem(cid, 2159, ab)
                local trofe = doPlayerAddItem(cid, trofeu2lugar, 1)
                local pontos = doPlayerAddPontos(cid, ba)
                doItemSetAttribute(trofe, "description", "Ganhador: (" .. getPlayerName(cid) .. ") por vencer em 2º lugar no evento 'MultiBoss'.")
            elseif getGlobalStorageValue(config.playerCount) == 1 then
                local ab = math.random(16, 20)
                local ba = 12
                if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                    doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'MultiBoss' em primeiro lugar! e ganhou 1 troféu de ouro, " .. ba .. " pontos zombie e " .. ab .. " event coins.", 22)
                    local goblet = doPlayerAddItem(cid, config.goblet, 1)
              	    local pontos = doPlayerAddPontos(cid, ba)
                    doItemSetAttribute(goblet, "description", "Ganhador: (" .. getPlayerName(cid) .. ") por vencer em 1º lugar no evento 'MultiBoss'.")
                    local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                    doItemSetAttribute(corpse, "description", "Voce conhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                    doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                    doPlayerAddItem(cid, 2159, ab)
                    setGlobalStorageValue(config.playerCount, 0)
                    for _,items in ipairs(config.rewards) do
                        doPlayerAddItem(cid, items, 1)
                    end
                    if config.moneyReward[3] == 1 then
                        doPlayerAddItem(cid, config.moneyReward[1], config.moneyReward[2])
                    end
                end
						
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