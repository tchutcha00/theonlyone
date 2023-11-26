function onStepIn(cid, item, position, lastPosition, fromPosition)

         if getPlayerLevel(cid) > 141 then

            doTeleportThing(cid, posi)

            doSendMagicEffect(getThingPos(cid), 10)

         else

             doPlayerSendTextMessage(cid, 19, "Apenas níveis (120-141) podem acessar essa área.")

         end

end