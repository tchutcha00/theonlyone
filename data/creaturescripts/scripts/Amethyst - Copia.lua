function onThink(cid)
local config = {
    tempo = 1 -- tempo em segundos
   }
local storage = 789159
if isPlayer(cid) then
addEvent(doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.02, config.tempo*1000, cid)
addEvent(doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.02, tempo*1000, cid)
if getPlayerStorageValue(cid, storage) >= os.time() or getPlayerStorageValue(cid, storage) >= os.time() then
return false
end
return true
end
return true
end


