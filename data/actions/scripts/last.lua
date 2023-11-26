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
	playerCount = 5011, -- Global storage for counting the players left/entered in the event
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
if getPlayerStorageValue(cid, 125) < 1 then 
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa ser o unico sobrevivente do Last Man Standing.') and true
    else 

    local configure = {
        fromPos = {x = 1195, y = 1028, z = 7}, -- top left cornor of the playground
	toPos = {x = 1208, y = 1036, z = 7}, -- bottom right cornor of the playground
    }
    
    local config = {
        time = 1
    }

            setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)+25)
local bp = doPlayerAddItem(cid,5801,1)
                setPlayerStorageValue(cid, 125, getPlayerStorageValue(cid, 125)-1)
            doAddContainerItem(bp, 2159, 50)
			doAddContainerItem(bp, 2160, 25)
			doAddContainerItem(bp, 2090, 1)
	setGlobalStorageValue(5011, 0)		
    doTeleportThing(cid, {x=1095, y=1063, z=7})
    doBroadcastMessage(""..getPlayerSex(cid) == 0 and "A jogadora " or "O jogador "..""..getCreatureName(cid).." Venceu o Last Man Standing Event e recebeu 50 event coins, 25 crystal coins, 25 event points e 1 chave de addons", MESSAGE_STATUS_CONSOLE_BLUE)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea2, config.time * 1 * 2000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end
end