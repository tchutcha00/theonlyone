local posi = {x=1119, y=1248, z=6} -- Posicao pra onde vai o player
local volta = {x=1093, y=1061, z=7}


function onStepIn(cid, item, position, lastPosition, fromPosition, middlePos, rangex, rangey)
	
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
	fromPosition = {x = 1103, y = 1055, z = 7}, {x = 1108, y = 1058, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1108, y = 1058, z = 7}, {x = 1103, y = 1055, z = 7}, -- bottom right cornor of the playground
	}
 

               guerra = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}

            doTeleportThing(cid, guerra)
            doPlayerSendTextMessage(cid, 19, "Você entrou na Arena!")

	       

return true

end