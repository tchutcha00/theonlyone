local t = {
{"Exterminador",{x= 1053, y= 1104, z= 8}},
{"Exterminador",{x= 1070, y= 1108, z= 8}},
{"Exterminador",{x= 1110, y= 1091, z= 8}},
{"Exterminador",{x= 1102, y= 1042, z= 8}},
{"Exterminador",{x= 1061, y= 1052, z= 8}},
{"Exterminador",{x= 1028, y= 1063, z= 8}},
}

function onThink(interval, lastExecution, thinkInterval)

local tempo = 1 -- tempo para remover o monstro

doBroadcastMessage("EXTERMINADORES EM CARLIN !",22)

for i = 1, #t do
pid = doCreateMonster(t[i][1], t[i][2])
addEvent(remove, tempo*6000*100000, pid)
end
return TRUE
end

function remove(pid)
if (isMonster(pid) == true) then
doRemoveCreature(pid)
end
end