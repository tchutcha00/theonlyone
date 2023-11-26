local posi = {x=1068, y=1073, z=9} -- Posicao pra onde vai o player
local volta = {x=1099, y=1058, z=7} -- Posicao pra onde vai o player

function onStepIn(cid, item, position, lastPosition, fromPosition)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode entrar no momento em que você estiver com algum pet ou anjo ativo.")
doTeleportThing(cid, volta)

return doPlayerSendCancel(cid,  "")
end
         if getPlayerStorageValue(cid, 14424) < os.time() then
            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na sala de Dungeons!")

         else
             doPlayerSendTextMessage(cid, 19, "Você completou um dos Dungeons e agora sua entrada sera permitida apos 4 horas.")
             doTeleportThing(cid, volta)


         end

end






