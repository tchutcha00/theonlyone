local posi = {x=830, y=1162, z=2} -- Posicao pra onde vai o player

function onStepIn(cid, item, position, lastPosition, fromPosition)
            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Infernum Master!!!")
            doSendMagicEffect(getThingPos(cid), 10)
         end



