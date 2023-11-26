function onSay(cid, words, param)
local pos = {x=1095,y=1062,z=7}
	local from = {x = 1032, y = 980, z = 7} -- canto superior esquerdo.
	local to = {x = 1094, y = 994, z = 7} -- canto inferior direito.
	
	if isInRange (getThingPos (cid), from, to) then
		if getCreatureCondition(cid, CONDITION_INFIGHT) then
  doPlayerSendCancel(cid, "Voce nao pode sair enquanto estiver com battle")

 else 
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
doPlayerSendCancel(cid,"Voce foi teleportado para o templo")
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
		end
	end
return true
end