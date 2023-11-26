local posi = {x=1089, y=1074, z=7} -- Posicao pra onde vai o player
local volta = {x=1099, y=1062, z=6}

function onStepIn(cid, item, position, lastPosition, fromPosition)

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode entrar no momento em que você estiver com algum pet ou anjo ativo.")
doTeleportThing(cid, volta)
return doPlayerSendCancel(cid,  "")
end
            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na area de Angels.")

         end



