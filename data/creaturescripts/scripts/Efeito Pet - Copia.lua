local level = 0
local eggo = {
["Holy Pet"] = {id = 6541, mon = "Holy Pet", cor = TEXTCOLOR_YELLOW},
["Fire Pet"] = {id = 6542, mon = "Fire Pet", cor = TEXTCOLOR_RED},
["Ice Pet"] = {id = 6543, mon = "Ice Pet", cor = TEXTCOLOR_BLUE},
["Terra Pet"] = {id = 6544, mon = "Terra Pet", cor = TEXTCOLOR_LIGHTGREEN},
["Phoenix Pet"] = {id = 2695, mon = "Phoenix Pet", cor = TEXTCOLOR_GREY},
["Draug Pet"] = {id = 6544, mon = "Draug Pet", cor = TEXTCOLOR_BROWN},
["Many Pet"] = {id = 2695, mon = "Many Pet", cor = TEXTCOLOR_TEAL},
["Energy Pet"] = {id = 6545, mon = "Energy Pet", cor = TEXTCOLOR_PURPLE}
}


local config = {
tempo = 3, -- tempo, em segundos que o efeito demorará para sair.
}
function Macabro(cid) 
for k, v in pairs(eggo) do
if isCreature and getCreatureName(cid) == v.mon then
doSendMagicEffect(getThingPos(cid), 37)
doSendAnimatedText(getThingPos(cid), "level: ".. level .. "", v.cor)
return addEvent(Macabro, 3000, cid)
end
end
end
function onThink(cid, interval)
if (getPlayerStorageValue(cid, 70071)) <= 0 then
Macabro(cid)
setPlayerStorageValue(cid, 70071, config.tempo + os.time())
else
return true
end
return TRUE
end