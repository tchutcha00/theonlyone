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

function clearArea(middlePos, rangex, rangey)
    local final = {x=1031, y=1085, z=7} -- Posição onde será teleportado quando acabar o tempo
    
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
    
    setGlobalStorageValue(sto, -123)
    return true
end
    
local t = {
    lvl = 150,
    lvl2 = 200,
    entrada = {
        {x = 1067, y = 1067, z = 9}, -- pos players
        {x = 1067, y = 1068, z = 9}, -- pos players
        {x = 1067, y = 1069, z = 9}, -- pos players
        {x = 1067, y = 1070, z = 9}, -- pos players
        {x = 1067, y = 1071, z = 9}, -- pos players
    },
    saida = {
        {x = 935, y = 1078, z = 9}, -- pos para onde eles irão
        {x = 935, y = 1078, z = 9}, -- pos para onde eles irão
        {x = 935, y = 1078, z = 9}, -- pos para onde eles irão
        {x = 935, y = 1078, z = 9}, -- pos para onde eles irão
        {x = 935, y = 1078, z = 9}, -- pos para onde eles irão
    },    
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local configure = {
        fromPos = {x=920, y=1060, z=9}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=993, y=1148, z=9}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
    }
    
    local config = {
        position = {x=1067, y=1066, z=9}, -- Contagem
        fromPosition = {x=920, y=1060, z=9},
        toPosition = {x=993, y=1148, z=9},
        id = 1498,
        time = 1
    }

    local time = 1800
    local check = {}
    
    for _, k in ipairs(t.entrada) do
         local x = getTopCreature(k).uid  
            if getPlayerLevel(cid) <= 149 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa estar entre os níveis 150 á 200 para poder entrar.")
            return true
        end

  for _, k in ipairs(t.entrada) do
         local x = getTopCreature(k).uid  
            if getPlayerLevel(cid) >= 200 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa estar entre os níveis 150 á 200 para poder entrar.")
            return true
        end


   
             
            if getGlobalStorageValue(sto) == 123 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde até que a sala seja liberada.")
                return true
            end
            
        table.insert(check, x)
    end
                                    
                    for i, tid in ipairs(check) do
                        doTeleportThing(tid, t.saida[i], false)
                        doSendMagicEffect(t.saida[i], 10)
                        doTransformItem(item.uid, item.itemid == 1810 and 1810 or 1810)
                    end
                    
            for i = 1,time do
                formula = time - 1*i
                addEvent(doSendAnimatedText, i*1000, config.position, formula, TEXTCOLOR_GREY)                
            end
    
    setGlobalStorageValue(sto, 123)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea, config.time * 1800 * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end
end