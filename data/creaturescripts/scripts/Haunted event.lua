local config = {
	playerCount = 2002, -- Global storage for counting the players left/entered in the event
	
	goblet = 2090, -- id of the gold goblet you'll get when finishing the event.
	rewards = {2159}, -- You will get this +  a gold goblet with your name on.
	--		{moneyId, count, using? 1 for using moneyReward, 0 for not using.}
        moneyReward = {0, 0, 0},
	
	-- Should be same as in the globalevent!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1135, y = 1018, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1170, y = 1040, z = 7}, -- bottom right cornor of the playground
	}

local trofeu3lugar = 2090
local trofeu2lugar = 2090
local lvl3 = 1
local lvl2 = 2
local lvl1 = 3

function onStatsChange(cid, attacker, type, combat, value)
    if isPlayer(cid) and isMonster(attacker) then
        if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
            if getGlobalStorageValue(config.playerCount) >= 4 then
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") foi morto pelos Haunted Treeling!", MESSAGE_STATUS_CONSOLE_BLUE)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
            elseif getGlobalStorageValue(config.playerCount) == 3 then
                local ab = math.random(9, 15)
                local ba = 5
                local q = 1
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'Haunted' em terceiro lugar! e ganhou 1 chave de addons, " .. ba .. " event points e " .. ab .. " event coins.", 22)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                doPlayerAddItem(cid, 2159, ab)
                doPlayerAddItem(cid, 2090, q)
                local pontos = doPlayerAddPontos(cid, ba)
                
            elseif getGlobalStorageValue(config.playerCount) == 2 then
                local ab = math.random(16, 21)
                local ba = 10
                local q = 2
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'Haunted' em segundo lugar! e ganhou 2 chaves de addons, " .. ba .. " event points e " .. ab .. " event coins.", 22)
                local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                doItemSetAttribute(corpse, "description", "Voce reconhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
                doPlayerAddItem(cid, 2159, ab)
                doPlayerAddItem(cid, 2090, q)
                local pontos = doPlayerAddPontos(cid, ba)
                
            elseif getGlobalStorageValue(config.playerCount) == 1 then
                local ab = math.random(24, 31)
                local ba = 15
                local q = 3
                if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                    doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") venceu o evento 'Haunted' em primeiro lugar! e ganhou 3 chaves de addons, " .. ba .. " event points e " .. ab .. " event coins.", 22)
                    local goblet = doPlayerAddItem(cid, config.goblet, 3)
              	    local pontos = doPlayerAddPontos(cid, ba)
                    doItemSetAttribute(goblet, "description", "Ganhador: (" .. getPlayerName(cid) .. ") por vencer em 1º lugar no evento 'Haunted'.")
                    local corpse = doCreateItem(3058, 1, getPlayerPosition(cid))
                    doItemSetAttribute(corpse, "description", "Voce conhece " .. getCreatureName(cid) .. ". Ele foi morto por "..(isMonster(attacker) and "a "..string.lower(getCreatureName(attacker)) or isCreature(attacker) and getCreatureName(attacker) or "a field item")..".")
                    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
                    doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                    doPlayerAddItem(cid, 2159, ab)
                    setGlobalStorageValue(config.playerCount, 0)
                    for _,items in ipairs(config.rewards) do
                        doPlayerAddItem(cid, 2090, q)
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