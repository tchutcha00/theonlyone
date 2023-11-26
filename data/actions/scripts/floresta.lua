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

local config = {
	playerCount = 2915, -- Global storage for counting the players left/entered in the event
}
function clearArea2(middlePos, rangex, rangey)
    local final = {x=1095, y=1063, z=7} -- Posição onde será teleportado quando acabar o tempo
    
    for i = -rangex, rangex do
        for j = -rangey, rangey do
            pos = {x = middlePos.x + i, y = middlePos.y + j, z = middlePos.z}
            creature = getTopCreature(pos).uid
            
            if isMonster(creature) then
                doSendMagicEffect(getThingPos(creature), 14)
                doRemoveCreature(creature)
            elseif isPlayer(creature) then
                
                doSendMagicEffect(getThingPos(creature), 10)
                doTeleportThing(creature, {x=1095, y=1063, z=7})
            end
        end
    end
    return true
end





function onUse(cid, item, fromPosition, itemEx, toPosition)
local gema = {2154, 2156, 2158}
local bp = doPlayerAddItem(cid,5801,1)
    local configure = {
        fromPos = {x=1246, y=770, z=7}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1287, y=1049, z=7}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
    }
    
    local config = {
        time = 1
    }

                        doAddContainerItem(bp, 2159, 30)
			doAddContainerItem(bp, 2090, 1)
			setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)+25)
    for i = 1, 5 do                  
                        doAddContainerItem(bp, gema[math.random(#gema)], 1)
    end
    doTeleportThing(cid, {x=1095, y=1063, z=7})
    doBroadcastMessage(""..getPlayerSex(cid) == 0 and "A jogadora " or "O jogador "..""..getCreatureName(cid).." Chegou ao final da Floresta Encantada e recebeu 30 event coins, 5 gemas aleatorias, 25 event points e 1 chave de addons! Parabens!",21)
    setGlobalStorageValue(2915, 0)
	local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea2, config.time * 1 * 2000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end