function onThink(interval, lastExecution)
pos1 = { x = 1066, y = 1068, z = 9 }
pos2 = { x = 1068, y = 1068, z = 9 }
pos3 = { x = 1066, y = 1070, z = 9 }
pos4 = { x = 1068, y = 1070, z = 9 }
pos5 = { x = 1075, y = 1068, z = 9 }
pos6 = { x = 1075, y = 1070, z = 9 }
pos7 = { x = 409, y = 805, z = 7 }
pos8 = { x = 344, y = 740, z = 6 }
pos9 = { x = 598, y = 569, z = 7 }
pos10 = { x = 797, y = 357, z = 6 }
pos11 = { x = 796, y = 704, z = 7 }
pos12 = { x = 803, y = 559, z = 6 }
pos13 = { x = 1019, y = 712, z = 6 }
pos14 = { x = 1037, y = 560, z = 6 }
pos15 = { x = 485, y = 554, z = 6 }
pos16 = { x = 515, y = 185, z = 7 }
pos17 = { x = 548, y = 225, z = 7 }
pos18 = { x = 797, y = 427, z = 6 }


doSendMagicEffect(pos1, 36)
doSendMagicEffect(pos1, 39)
doSendMagicEffect(pos2, 36)
doSendMagicEffect(pos2, 39)
doSendMagicEffect(pos3, 36)
doSendMagicEffect(pos3, 39)
doSendMagicEffect(pos4, 36)
doSendMagicEffect(pos4, 39)
doSendMagicEffect(pos5, 41)
doSendMagicEffect(pos5, 48)
doSendMagicEffect(pos6, 41)
doSendMagicEffect(pos6, 48)
doSendMagicEffect(pos7, 37)
doSendMagicEffect(pos7, 6)
doSendMagicEffect(pos8, 37)
doSendMagicEffect(pos8, 6)
doSendMagicEffect(pos9, 37)
doSendMagicEffect(pos9, 6)
doSendMagicEffect(pos10, 37)
doSendMagicEffect(pos10, 6)
doSendMagicEffect(pos11, 37)
doSendMagicEffect(pos11, 6)
doSendMagicEffect(pos12, 37)
doSendMagicEffect(pos12, 6)
doSendMagicEffect(pos13, 37)
doSendMagicEffect(pos13, 6)
doSendMagicEffect(pos14, 37)
doSendMagicEffect(pos14, 6)
doSendMagicEffect(pos15, 37)
doSendMagicEffect(pos15, 6)
doSendMagicEffect(pos16, 37)
doSendMagicEffect(pos16, 6)
doSendMagicEffect(pos17, 37)
doSendMagicEffect(pos17, 6)
doSendMagicEffect(pos18, 37)
doSendMagicEffect(pos18, 6)
if getThingFromPos(pos1, pos18).itemid > 0 then
for _, name in pairs(getOnlinePlayers()) do
local player = getPlayerByName(name)
end
end
return TRUE
end      

