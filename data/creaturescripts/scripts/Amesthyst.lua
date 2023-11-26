local config = {
storage = 789159,
bonus_rate = 2,
tempo = 12000, -- tempo, em segundos que o efeito demorará para sair.
}




function onLogin(cid)
pot(cid)
return true
end


local function pot(cid) 
if isPlayer(cid) then
 if getPlayerStorageValue(cid, config.storage) > os.time() then
  doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.02)
   doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.02)
   doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
addEvent(pot, 6 * 1000, cid)
end
end
end


function onThink(cid, interval)
if (getPlayerStorageValue(cid, 7076)) <= 0 then -- storage que guarda o tempo do efeito.
pot(cid)
setPlayerStorageValue(cid, 7076, config.tempo + os.time())
else
return true
end
return TRUE
end




