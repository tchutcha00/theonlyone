local t = {
{"Saqueador",{x= 1072, y= 1069, z= 7}},
{"Saqueadora",{x= 1075, y= 1038, z= 7}},
{"Saqueador",{x= 1046, y= 1054, z= 7}},
{"Saqueadora",{x= 1049, y= 1090, z= 7}},
{"Saqueador",{x= 1050, y= 1111, z= 7}},
{"Saqueadora",{x= 1081, y= 1101, z= 7}},
{"Saqueador",{x= 1132, y= 1076, z= 7}},
{"Saqueadora",{x= 1117, y= 1091, z= 7}},
{"Saqueador",{x= 1099, y= 1054, z= 7}}
}

function onThink(interval, lastExecution, thinkInterval)
	local percent = math.random(1, 100)
	
	if percent <= 15 then
		local tempo = 1 -- tempo para remover o monstro
		doBroadcastMessage("SAQUEADORES EM CARLIN!",22)
		
		for i = 1, #t do
			pid = doCreateMonster(t[i][1], t[i][2])
			addEvent(remove, tempo*600*10000, pid)
		end
	end
return TRUE
end

function remove(pid)
	if (isMonster(pid) == true) then
		doRemoveCreature(pid)
	end
end