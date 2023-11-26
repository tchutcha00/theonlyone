local posi = {x=830, y=1163, z=7} -- Posicao pra onde vai o player

function onStepIn(cid, item, position, lastPosition, fromPosition)
            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na masmora do infernum!")
            doSendMagicEffect(getThingPos(cid), 10)
         end



