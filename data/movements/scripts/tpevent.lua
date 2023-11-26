local posi = {x=1139, y=1058, z=6} -- Posicao pra onde vai o player
local volta = {x=1095, y=1061, z=6}

function onStepIn(cid, item, position, lastPosition, fromPosition)


            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na area de Cassino e Troca de event coins!")

         end



