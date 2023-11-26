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

function clearArea13(middlePos, rangex, rangey)
    local final = {x=1082, y=1081, z=9} -- Posição onde será teleportado quando acabar o tempo
    
    for i = -rangex, rangex do
        for j = -rangey, rangey do
            pos = {x = middlePos.x + i, y = middlePos.y + j, z = middlePos.z}
            creature = getTopCreature(pos).uid
            
            if isMonster(creature) then
                doSendMagicEffect(getThingPos(creature), 14)
                doRemoveCreature(creature)
            elseif isPlayer(creature) then
                doSendMagicEffect(getThingPos(creature), 10)
                doTeleportThing(creature, final)
            end
        end
    end
    
    setGlobalStorageValue(sto, -17)
    return true
end

local t = {
    lvl = 120,
    entrada = {
        {x = 1082, y = 1081, z = 9},
    },
    saida = {
        {x = 1082, y = 1084, z = 9}, -- pos para onde eles irão
    }
}

    


function onUse(cid, item, fromPosition, itemEx, toPosition)
    local configure = {
        fromPos = {x=1081, y=1083, z=9}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1083, y=1085, z=9}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
    }
    
    local config = {
        position = {x=1083, y=1083, z=9}, -- Contagem
        fromPosition = {x=1081, y=1083, z=9},
        toPosition = {x=1083, y=1085, z=9},
        id = 1498,
        time = 1
    }

    local time = 120
    local check = {}


for _, k in ipairs(t.entrada) do
         local x = getTopCreature(k).uid  
            if(x == 0 or not isPlayer(x)) then  
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Fique na frente da porta para entrar na aréa de fusão.")
            return true
        end    


            if getGlobalStorageValue(sto) == 17 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde até que a sala seja liberada.")
                return true
            end
    
            
        table.insert(check, x)
    end
                
                    for i, tid in ipairs(check) do
                        doTeleportThing(tid, t.saida[i], false)
                        doSendMagicEffect(t.saida[i], 10)
                        doTransformItem(item.uid, item.itemid == 10473 and 10473 or 10473)
                    end
                    
            for i = 1,time do
                formula = time - 1*i
                addEvent(doSendAnimatedText, i*1000, config.position, formula, TEXTCOLOR_RED)
            end
    
    setGlobalStorageValue(sto, 17)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea13, config.time * 120 * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end