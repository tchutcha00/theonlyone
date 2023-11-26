function onAdvance(cid, skill, oldLevel, newLevel)
	local lvl, pos = 141, {x=1031,y=1085,z=7}
	local from = {x = 1074, y = 1156, z = 8} -- canto superior esquerdo.
	local to = {x = 1118, y = 1189, z = 8} -- canto inferior direito.
	
	if isInRange (getThingPos (cid), from, to) then
		if skill == SKILL__LEVEL and newLevel >= lvl then
			doTeleportThing(cid, pos)
			doPlayerSendTextMessage(cid,19,"Você foi teleportado por ter atingido o level 141.")
		end
	end
return true
end