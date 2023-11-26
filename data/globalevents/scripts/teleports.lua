local positions = {
pos1 = {pos = {x = 1094, y = 1056, z = 7}, msg = "Castle"},
pos2 = {pos = {x = 1096, y = 1056, z = 7}, msg = "Trainers"},
pos3 = {pos = {x = 1095, y = 1062, z = 6}, msg = "Eventos"},
pos4 = {pos = {x = 1143, y = 1054, z = 7}, msg = "Zombie"},
pos5 = {pos = {x = 1147, y = 1049, z = 7}, msg = "Evento DTG"},
pos6 = {pos = {x = 1139, y = 1055, z = 6}, msg = "Cassino"},
pos7 = {pos = {x = 1139, y = 1061, z = 6}, msg = "Shop"},
}
 
 
function onThink(interval)
for _, b in pairs(positions) do
doSendAnimatedText(b.pos, b.msg, math.random(1, 255))
end
return true
end