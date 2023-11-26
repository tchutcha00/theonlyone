local positions = {
pos1 = {pos = {x = 1094, y = 1056, z = 7}, eff = "1"},
pos2 = {pos = {x = 1096, y = 1056, z = 7}, eff = "2"},
pos3 = {pos = {x = 1095, y = 1062, z = 6}, eff = "3"},
pos4 = {pos = {x = 1143, y = 1054, z = 7}, eff = "4"},
pos5 = {pos = {x = 1147, y = 1049, z = 7}, eff = "5"},
pos6 = {pos = {x = 1139, y = 1055, z = 6}, eff = "6"},
pos7 = {pos = {x = 1139, y = 1061, z = 6}, eff = "7"},
}
 
 
function onThink(interval)
for _, b in pairs(positions) do
doSendMagicEffect(b.pos, math.random(1 ,56))
end
return true
end