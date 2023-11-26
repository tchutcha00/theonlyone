function onSay(cid, words, param)
local waittime = 20 -- Tempo de exhaustion
local level = 100 -- Level necessário
local effra = 40 -- Efeito
-------------------------------------------------------
local storage = 5560
local ppos = getCreaturePosition(cid)
local from = {x=ppos.x, y=ppos.y, z=ppos.z}
local level = 100 -- Level necessário
local posr1 = {x=ppos.x-2, y=ppos.y, z=ppos.z}
local posr2 = {x=ppos.x-2, y=ppos.y-2, z=ppos.z}
local posr3 = {x=ppos.x, y=ppos.y-2, z=ppos.z}
local posr4 = {x=ppos.x+2, y=ppos.y-2, z=ppos.z}
local posr5 = {x=ppos.x+2, y=ppos.y, z=ppos.z}
local posr6 = {x=ppos.x+2, y=ppos.y+2, z=ppos.z}
local posr7 = {x=ppos.x, y=ppos.y+2, z=ppos.z}
local posr8 = {x=ppos.x-2, y=ppos.y+2, z=ppos.z}
local eff1 = {x=ppos.x-2, y=ppos.y+2, z=ppos.z}
local eff2 = {x=ppos.x+2, y=ppos.y-2, z=ppos.z}
local eff3 = {x=ppos.x+2, y=ppos.y+2, z=ppos.z}
local eff4 = {x=ppos.x-2, y=ppos.y-2, z=ppos.z}
local eff5 = {x=ppos.x, y=ppos.y+2, z=ppos.z}
local eff6 = {x=ppos.x, y=ppos.y-2, z=ppos.z}
local eff7 = {x=ppos.x-2, y=ppos.y, z=ppos.z}
local eff8 = {x=ppos.x+2, y=ppos.y, z=ppos.z}
local arear1 = {x=ppos.x+7, y=ppos.y+5, z=ppos.z}
local arear2 = {x=ppos.x-7, y=ppos.y-5, z=ppos.z}

if getPlayerLevel(cid) < level then
doPlayerSendCancel(cid, "Você precisa de level "..level.." para usar essa magia.")
return true
end

function walk1(cid)
if isInArea(getCreaturePosition(cid), from, from) then
doTeleportThing(cid, posr1)
end
end

function walk2(cid)
if isInArea(getCreaturePosition(cid), posr1, posr1) then
doTeleportThing(cid, posr2)
doCreatureSay(cid,'COME ON BOOS!') -- Sua frase
end
end

function walk3(cid)
if isInArea(getCreaturePosition(cid), posr2, posr2) then
doTeleportThing(cid, posr3)
end
end

function walk4(cid)
if isInArea(getCreaturePosition(cid), posr3, posr3) then
doTeleportThing(cid, posr4)
doCreatureSay(cid,'WANT MORE SPEED?!') -- Sua frase
end
end

function walk5(cid)
if isInArea(getCreaturePosition(cid), posr4, posr4) then
doTeleportThing(cid, posr5)
end
end

function walk6(cid)
if isInArea(getCreaturePosition(cid), posr5, posr5) then
doTeleportThing(cid, posr6)
end
end

function walk7(cid)
if isInArea(getCreaturePosition(cid), posr6, posr6) then
doTeleportThing(cid, posr7)
doCreatureSay(cid,'MUHAHA!') -- Sua frase
end
end

function walk8(cid)
if isInArea(getCreaturePosition(cid), posr7, posr7) then
doTeleportThing(cid, posr8)
end
end

function walk9(cid)
if isInArea(getCreaturePosition(cid), posr8, posr8) then
doTeleportThing(cid, posr1)
doCreatureSay(cid,'TOO SLOW!') -- Sua frase
end
end

function walk10(cid)
if isInArea(getCreaturePosition(cid), posr1, posr1) then
doTeleportThing(cid, from)
doCreatureSay(cid,'SUMMON ULTIMATE BOSS!') -- Frase final
doSummonMonster(cid, "Holy Pet") 
end
end

if exhaustion.check(cid, storage) == false then
for _, pid in ipairs(getPlayersOnline()) do
addEvent(walk1, 1, pid)
addEvent(walk2, 500, pid)
addEvent(walk3, 1000, pid)
addEvent(walk4, 1500, pid)
addEvent(walk5, 2000, pid)
addEvent(walk6, 2500, pid)
addEvent(walk7, 3000, pid)
addEvent(walk8, 3500, pid)
addEvent(walk9, 3750, pid)
addEvent(walk1, 4000, pid)
addEvent(walk2, 4250, pid)
addEvent(walk3, 4500, pid)
addEvent(walk4, 4750, pid)
addEvent(walk5, 5000, pid)
addEvent(walk6, 5250, pid)
addEvent(walk7, 5500, pid)
addEvent(walk8, 5750, pid)
addEvent(walk9, 5850, pid)
addEvent(walk1, 5950, pid)
addEvent(walk2, 6050, pid)
addEvent(walk3, 6150, pid)
addEvent(walk4, 6250, pid)
addEvent(walk5, 6350, pid)
addEvent(walk6, 6450, pid)
addEvent(walk7, 6550, pid)
addEvent(walk8, 6650, pid)
addEvent(walk9, 6700, pid)
addEvent(walk1, 6750, pid)
addEvent(walk2, 6800, pid)
addEvent(walk3, 6850, pid)
addEvent(walk4, 6900, pid)
addEvent(walk5, 6950, pid)
addEvent(walk6, 7000, pid)
addEvent(walk7, 7050, pid)
addEvent(walk8, 7100, pid)
addEvent(walk9, 7125, pid)
addEvent(walk1, 7150, pid)
addEvent(walk2, 7175, pid)
addEvent(walk3, 7200, pid)
addEvent(walk4, 7225, pid)
addEvent(walk5, 7250, pid)
addEvent(walk6, 7275, pid)
addEvent(walk7, 7300, pid)
addEvent(walk8, 7325, pid)
addEvent(walk9, 7335, pid)
addEvent(walk1, 7150, pid)
addEvent(walk2, 7175, pid)
addEvent(walk3, 7200, pid)
addEvent(walk4, 7225, pid)
addEvent(walk5, 7250, pid)
addEvent(walk6, 7275, pid)
addEvent(walk7, 7300, pid)
addEvent(walk8, 7325, pid)
addEvent(walk9, 7335, pid)
addEvent(walk1, 7150, pid)
addEvent(walk2, 7175, pid)
addEvent(walk3, 7200, pid)
addEvent(walk4, 7225, pid)
addEvent(walk5, 7250, pid)
addEvent(walk6, 7275, pid)
addEvent(walk7, 7300, pid)
addEvent(walk8, 7325, pid)
addEvent(walk9, 7335, pid)
addEvent(walk1, 7150, pid)
addEvent(walk2, 7175, pid)
addEvent(walk3, 7200, pid)
addEvent(walk4, 7225, pid)
addEvent(walk5, 7250, pid)
addEvent(walk6, 7275, pid)
addEvent(walk7, 7300, pid)
addEvent(walk8, 7325, pid)
addEvent(walk9, 7335, pid)
addEvent(walk1, 7345, pid)
addEvent(walk2, 7355, pid)
addEvent(walk3, 7365, pid)
addEvent(walk4, 7375, pid)
addEvent(walk5, 7385, pid)
addEvent(walk6, 7395, pid)
addEvent(walk7, 7405, pid)
addEvent(walk8, 7415, pid)
addEvent(walk9, 7425, pid)
addEvent(walk1, 7435, pid)
addEvent(walk2, 7445, pid)
addEvent(walk3, 7455, pid)
addEvent(walk4, 7465, pid)
addEvent(walk5, 7475, pid)
addEvent(walk6, 7485, pid)
addEvent(walk7, 7495, pid)
addEvent(walk8, 7505, pid)
addEvent(walk9, 7510, pid)
addEvent(walk10, 7520, pid)

doSendMagicEffect(getCreaturePosition(pid), 28)
doCreatureSay(pid, "I GO SUMMON A BOSS", TALKTYPE_MONSTER) -- Frase inicial aquela que fala tipo um monstro
addEvent(setPlayerStorageValue, 10000, pid, 1634, -1) 
addEvent(doSendMagicEffect,7600,from,3)
addEvent(doSendMagicEffect,7600,posr4,3) 
addEvent(doSendMagicEffect,7600,posr6,3)	
addEvent(doSendMagicEffect,7600,posr8,3)	
addEvent(doSendMagicEffect,7600,posr2,3) 
addEvent(doSendMagicEffect,7800,eff1,effra) 
addEvent(doSendMagicEffect,7800,eff2,effra) 
addEvent(doSendMagicEffect,7800,eff3,effra) 
addEvent(doSendMagicEffect,7800,eff4,effra) 
addEvent(doSendMagicEffect,7800,eff5,effra) 
addEvent(doSendMagicEffect,7800,eff6,effra) 
addEvent(doSendMagicEffect,7800,eff7,effra) 
addEvent(doSendMagicEffect,7800,eff8,effra) 
end

exhaustion.set(cid, storage, waittime)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
end
return true
end