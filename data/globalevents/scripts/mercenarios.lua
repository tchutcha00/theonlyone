local t = {
{"Mercenaria",{x= 1077, y= 1070, z= 7}},
{"Mercenario",{x= 1091, y= 1086, z= 7}},
{"Mercenaria",{x= 1113, y= 1092, z= 7}},
{"Mercenario",{x= 1102, y= 1097, z= 7}},
{"Mercenaria",{x= 1106, y= 1115, z= 7}},
{"Mercenario",{x= 1081, y= 1099, z= 7}},
{"Mercenaria",{x= 1070, y= 1116, z= 7}},
{"Mercenario",{x= 1047, y= 1113, z= 7}},
{"Mercenaria",{x= 1052, y= 1088, z= 7}},
{"Mercenario",{x= 1032, y= 1069, z= 7}},
{"Mercenaria",{x= 1041, y= 1050, z= 7}},
{"Mercenario",{x= 1076, y= 1032, z= 7}},
{"Mercenaria",{x= 1098, y= 1047, z= 7}},
{"Mercenario",{x= 1075, y= 1051, z= 7}},
{"Mercenaria",{x= 1118, y= 1066, z= 7}},
{"Mercenario",{x= 1103, y= 1070, z= 7}},
{"Mercenaria",{x= 1065, y= 1077, z= 7}}
}

function onThink(interval, lastExecution, thinkInterval)
	local percent = math.random(1, 100)
	
	if percent <= 20 then
		local tempo = 1 -- tempo para remover o monstro
		doBroadcastMessage("MERCENARIOS EM CARLIN !",22)
		
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