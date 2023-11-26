local volta = {x=1143, y=1032, z=7}
function onStepIn(cid, item, position, lastPosition, fromPosition)
         if isMonster(cid) then
         else
         if isPlayer(cid) then
             doTeleportThing(cid, fromPosition)
	     doPlayerSendCancel(cid, 'Players nao podem passar aqui.')
         end
	 end
end