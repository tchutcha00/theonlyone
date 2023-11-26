local config = {
storage = 489061564,
tempo = 12000, -- tempo, em segundos que o efeito demorará para sair.
}

local eggo = {
["Holy Angel"] = {id = 6541, mon = "Holy", cor = TEXTCOLOR_YELLOW, efeito = 21},
["Fire Angel"] = {id = 6542, mon = "Fire", cor = TEXTCOLOR_RED, efeito = 6},
["Ice Angel"] = {id = 6543, mon = "Ice", cor = TEXTCOLOR_TEAL, efeito = 43},
["Terra Angel"] = {id = 6544, mon = "Terra", cor = TEXTCOLOR_LIGHTGREEN, efeito = 45},
["Phoenix Angel"] = {id = 2695, mon = "Phoenix", cor = TEXTCOLOR_GREY, efeito = 17},
["Draug Angel"] = {id = 6544, mon = "Draug", cor = TEXTCOLOR_BROWN, efeito = 37},
["Many Angel"] = {id = 2695, mon = "Many", cor = TEXTCOLOR_TEAL, efeito = 37},
["Energy Angel"] = {id = 6545, mon = "Energy", cor = TEXTCOLOR_PURPLE, efeito = 22},
["Frozen Angel"] = {id = 9693, mon = "Frozen", cor = TEXTCOLOR_TEAL, efeito = 31},
["Ferumbras Angel"] = {id = 11715, mon = "Ferumbras", cor = TEXTCOLOR_DARKRED, efeito = 29}
}

function onLogin(cid)
Macabro(cid)
return true
end

local function Macabro(cid) 
for k, v in pairs(eggo) do
if isCreature(cid) and getCreatureName(cid) == k then
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (2 / 1000))
doSendMagicEffect(getThingPos(cid), v.efeito)
addEvent(Macabro, 6 * 1000, cid)
end
end
end


function onThink(cid, interval)
if (getPlayerStorageValue(cid, 70079)) <= 0 then -- storage que guarda o tempo do efeito.
Macabro(cid)
setPlayerStorageValue(cid, 70079, config.tempo + os.time())
else
return true
end
return TRUE
end




