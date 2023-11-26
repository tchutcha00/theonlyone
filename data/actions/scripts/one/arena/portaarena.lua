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

function clearArea280(middlePos, rangex, rangey)
local configure = {
        fromPos = {x=1148, y=1187, z=7}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1156, y=1195, z=7}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
        boss = "Arenator" -- Aqui você bota o nome do monstro que você quer remover
    }
    local final = {x=1098, y=1063, z=7} -- Posição onde será teleportado quando acabar o tempo   
    for i = -rangex, rangex do
        for j = -rangey, rangey do
            pos = {x = middlePos.x + i, y = middlePos.y + j, z = middlePos.z}
            creature = getTopCreature(pos).uid
			   
            if isMonster(creature) then
                doSendMagicEffect(getThingPos(creature), 14)
                doRemoveCreature(creature)
            elseif isPlayer(creature) then
                doBroadcastMessage("O jogador (".. getPlayerName(creature) .. ") completou a Arena Quest e teve como recompensa 2 angel tokens.", MESSAGE_STATUS_CONSOLE_ORANGE)
	            doPlayerAddItem(creature, 6527, 2)			
                doSendMagicEffect(getThingPos(creature), 10)
                doTeleportThing(creature, final)
            end
        end
    end
    
    setGlobalStorageValue(sto, -9)
    return true
end

local t = {
{"Arenator",{x= 1152, y= 1192, z= 7}}
}
    


function onUse(cid, item, fromPosition, itemEx, toPosition)
    local configure = {
        fromPos = {x=1148, y=1187, z=7}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1156, y=1195, z=7}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
        boss = "Arenator" -- Aqui você bota o nome do monstro que você quer remover
    }
    
    local config = {
        hnitem = "Você precisa de 1 Arena Key para entrar.", --Mensagem que o player receberá caso não tenha o item.
        hitem = "Você entrou na Arena Quest.", --Mensagem que o player receberá caso tenha o item.
        item = 2092, --ID do item.
        qnt = 1, --Quantidade.
		arena = {x=1152, y=1193, z=7},
        position = {x=1116, y=1187, z=8}, -- Contagem
        position2 = {x=1152, y=1191, z=7}, -- Contagem
        fromPosition = {x=1148, y=1187, z=7},
        toPosition = {x=1156, y=1195, z=7},
        id = 1498,
        time = 1
    }


    local time = 300
    
            if getGlobalStorageValue(sto) == 9 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde até que a Arena seja liberada.")
                return true
            end

        if getPlayerItemCount (cid, config.item) >= config.qnt then
		doPlayerRemoveItem(cid, config.item, config.qnt)
                doPlayerSendTextMessage(cid, 19, config.hitem) -- Caso não queira que receba mensagem, apague essa linha.
        else
		doPlayerSendTextMessage(cid, 19, config.hnitem) -- Caso não queira que receba mensagem, apague essa linha.
return true
end
    
    doTeleportThing(cid, config.arena)       
       
                    for i = 1, #t do
			        pid = doCreateMonster(t[i][1], t[i][2])
		            end
                        
                     
                 
                    
              for i = 1,time do
                formula = time - 1*i
                addEvent(doSendAnimatedText, i*1000, config.position, formula, TEXTCOLOR_LIGHTGREEN)
                addEvent(doSendAnimatedText, i*1000, config.position2, formula, TEXTCOLOR_LIGHTGREEN)
            end
    
    setGlobalStorageValue(sto, 9)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea280, 1 * 300 * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end