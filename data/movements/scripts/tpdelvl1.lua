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
    local final = {x=1098, y=1063, z=7} -- Posição onde será teleportado quando acabar o tempo
    
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
    
    setGlobalStorageValue(sto, -24)
    return true
end


local t = {
    monstro = {
        {{x = 1085, y = 1290, z = 7}, "Pickrodor"}, -- defina pos dos montros e nomes
    }
}

local time = 120
local posi = {x=1085, y=1294, z=7} 
local contagem = {x=1093, y=1059, z=7} 
local volta = {x=1098, y=1063, z=7} 
local tp = {x=1091, y=1058, z=7} 
local contagem2 = {x=1085, y=1291, z=7} 

local configure = {
        fromPos = {x=1082, y=1288, z=7}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
        toPos = {x=1090, y=1294, z=7}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
    }

function onStepIn(cid, item, position, lastPosition, fromPosition)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode entrar no momento em que você estiver com algum anjo ativo.")
doTeleportThing(cid, volta)
return doPlayerSendCancel(cid,  "")
end

if getGlobalStorageValue(sto) == 24 then
			doPlayerSendTextMessage(cid, 19, "Aguarde até que a quest seja liberada.")
			doTeleportThing(cid, volta)
			return true
end
if getPlayerStorageValue(cid,8749) == 1 then
			doPlayerSendTextMessage(cid, 19, "Você já completou a quest da fishing rod e picareta.")
		else
if getPlayerLevel(cid) <= 129 then
doTeleportThing(cid, volta)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas níveis 130+ podem acessar a Picareta & Old Fishing Quest.")
return true
end
                        doTeleportThing(cid, posi)
			doPlayerSendTextMessage(cid, 19, "Boa sorte você acabou de entra na Picareta & Old Fishing Quest!.")



	
	for _, summon in pairs(t.monstro) do
                    local creature = getTopCreature(summon[1]).uid
                    doCreateMonster(summon[2], summon[1])
                end

 for i = 1,time do
                formula = time - 1*i
                addEvent(doSendAnimatedText, i*1000, contagem, formula, TEXTCOLOR_PINK)
				addEvent(doSendAnimatedText, i*1000, contagem2, formula, TEXTCOLOR_PINK)
            end

setGlobalStorageValue(sto, 24)
    local rx = getDistanceRadius(configure.fromPos, configure.toPos)
    addEvent(clearArea, time * 1000, getMiddlePos(configure.fromPos, configure.toPos), rx, rx)
    return true
end
return TRUE
		end






