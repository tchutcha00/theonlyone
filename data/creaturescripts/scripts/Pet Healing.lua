
local config = {
storage = 489061567,
bonus_rate = 2,
tempo = 12000, -- tempo, em segundos que o efeito demorará para sair.
}

local eggo = {
["Holy Angel"] = {id = 6541, mon = "Holy", cor = TEXTCOLOR_YELLOW},
["Fire Angel"] = {id = 6542, mon = "Fire", cor = TEXTCOLOR_RED},
["Ice Angel"] = {id = 6543, mon = "Ice", cor = TEXTCOLOR_BLUE},
["Earth Angel"] = {id = 6544, mon = "Earth", cor = TEXTCOLOR_GREEN},
["Energy Angel"] = {id = 6545, mon = "Energy", cor = TEXTCOLOR_PURPLE}
}


function onLogin(cid)
Macabroa(cid)
return true
end


local function Macabroa(cid) 
for k, v in pairs(eggo) do
if isCreature(cid) and getCreatureName(cid) == k then
	local hpAdd = math.random(10,15)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd / 1000))
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
	addEvent(Macabroa, 6 * 1000, cid)
	end
	end
	end
	


function onThink(cid, interval)
if (getPlayerStorageValue(cid, 70076)) <= 0 then -- storage que guarda o tempo do efeito.
Macabroa(cid)
setPlayerStorageValue(cid, 70076, config.tempo + os.time())
else
return true
end
return TRUE
end




