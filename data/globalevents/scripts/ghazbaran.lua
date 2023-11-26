local t = {
{"Ghazbaran",{x= 1274, y= 1063, z= 7}}
}

function onTime(interval, lastExecution, thinkInterval)
	local chance = math.random(1, 100)
	
	if chance <= 99 then
		local tempo = 30 -- tempo para remover o monstro
		doBroadcastMessage("GHAZBARAN ON RAIDS, em 30 minutos ele vai desaparecer!",22)
		
		for i = 1, #t do
			pid = doCreateMonster(t[i][1], t[i][2])
			addEvent(remove, tempo*60*1000, pid)
		end
	end
return TRUE
end

function remove(pid)
	if (isMonster(pid) == true) then
		doRemoveCreature(pid)
	end
end