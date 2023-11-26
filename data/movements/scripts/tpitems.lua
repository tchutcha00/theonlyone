local posi = {x=999, y=1266, z=7} -- Posicao pra onde vai o player
local volta = {x=1091, y=1061, z=7}

function onStepIn(cid, item, position, lastPosition, fromPosition)

            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na area de Hunts!")

         end



