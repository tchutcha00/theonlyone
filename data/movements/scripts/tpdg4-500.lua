local posi = {x=1079, y=1071, z=9} -- Posicao pra onde vai o player
local volta = {x=1079, y=1072, z=9} -- Posicao pra onde o player vai se teleportado caso nao tenha lvl ou seja maior

function onStepIn(cid, item, position, lastPosition, fromPosition)

if isPlayer(cid) then
if getPlayerLevel(cid) > 501 then

            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "")

            

         else

             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa estar entre o nível 450 á 500 para poder entrar.")

             doTeleportThing(cid, volta)
             

         end
end
end



