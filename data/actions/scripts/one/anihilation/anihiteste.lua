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

function Vai(middlePos, rangex, rangey)
    local final = {x=1072, y=1164, z=6} -- Posição onde será teleportado quando acabar o tempo
    
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
    
    setGlobalStorageValue(sto, -1)
    return true
end
    
local t = {
    lvl = 120,
    entrada = {
        {x = 1125, y = 1152, z = 7}, -- pos players
        {x = 1124, y = 1152, z = 7}, -- pos players
        {x = 1123, y = 1152, z = 7}, -- pos players
        {x = 1122, y = 1152, z = 7}, -- pos players
        {x = 1121, y = 1152, z = 7}, -- pos players
    },
    saida = {
        {x = 1127, y = 1153, z = 8}, -- pos para onde eles irão
        {x = 1126, y = 1153, z = 8}, -- pos para onde eles irão
        {x = 1125, y = 1153, z = 8}, -- pos para onde eles irão
        {x = 1124, y = 1153, z = 8}, -- pos para onde eles irão
        {x = 1123, y = 1153, z = 8}, -- pos para onde eles irão
    },
    monstros = {
        {{x = 1122, y = 1153, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
        {{x = 1121, y = 1151, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
        {{x = 1121, y = 1155, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
        {{x = 1128, y = 1153, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
        {{x = 1129, y = 1151, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
        {{x = 1129, y = 1155, z = 8}, "Annihilion"}, -- defina pos dos montros e nomes
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local configure = {
        fromPos = {x=1121, y=1150, z=8}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1129, y=1156, z=8}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
        boss = "Annihilion" -- Aqui você bota o nome do monstro que você quer remover
    }
    
    local config = {
        position = {x=1126, y=1152, z=7}, -- Contagem
        position1 = {x=1121, y=1150, z=8}, -- Contagem
        position2 = {x=1121, y=1156, z=8}, -- Contagem
        position3 = {x=1129, y=1150, z=8}, -- Contagem
        position4 = {x=1129, y=1156, z=8}, -- Contagem
        fromPosition = {x=1121, y=1150, z=8},
        toPosition = {x=1129, y=1156, z=8},
        id = 1498,
        time = 1
    }

    local time = 120
    local check = {}
    
    for _, k in ipairs(t.entrada) do
          local x = getTopCreature(k).uid
              
             
            if getGlobalStorageValue(sto) == 4 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde até que a quest seja liberada.")
                return true
            end
            
        table.insert(check, x)
  end 
    
                for _, summon in pairs(t.monstros) do
                    local creature = getTopCreature(summon[1]).uid
                    doCreateMonster(summon[2], summon[1])
                end
                
                    for i, tid in ipairs(check) do
                        doTeleportThing(tid, t.saida[i], false)
                        doSendMagicEffect(t.saida[i], 10)
                        doTransformItem(item.uid, item.itemid == 9893 and 9893 or 9893)
                    end
                    
            for i = 1,time do
                formula = time - 1*i
                addEvent(doSendAnimatedText, i*1000, config.position, formula, TEXTCOLOR_RED)
                addEvent(doSendAnimatedText, i*1000, config.position1, formula, TEXTCOLOR_RED)
                addEvent(doSendAnimatedText, i*1000, config.position2, formula, TEXTCOLOR_RED)
                addEvent(doSendAnimatedText, i*1000, config.position3, formula, TEXTCOLOR_RED)
                addEvent(doSendAnimatedText, i*1000, config.position4, formula, TEXTCOLOR_RED)
            end
    
    setGlobalStorageValue(sto, 4)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(Vai, config.time * 120 * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end