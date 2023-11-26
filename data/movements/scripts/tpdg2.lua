local posi = {x=1071, y=1071, z=9} -- Posicao pra onde vai o player
local volta = {x=1071, y=1072, z=9} -- Posicao pra onde o player vai se teleportado caso nao tenha lvl ou seja maior
local level1 = 249
local level2 = 300
function onStepIn(cid, item, position, lastPosition, fromPosition)


if isPlayer(cid) then
if getPlayerLevel(cid) <= level1 then
doTeleportThing(cid, volta)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa estar nível 250+ para poder entrar.")
return true
end
end
                       doTeleportThing(cid, posi)
			
		
	return TRUE
end



