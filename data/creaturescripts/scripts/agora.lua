function onDeath(cid, corpse, killer, frompos)
local monster = "Agorak" 
if isMonster and getCreatureName(cid) == monster then
if getGlobalStorageValue(config.playerCount) >= 1 then
 doBroadcastMessage("O boss (".. boss1 .. ") foi morto e os jogadores dentro do World Boss Event foram recompensados com 10 event coins, 10 crystal coins e 5 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
                doPlayerAddItem(cid, 2159, 10)
				doPlayerAddItem(cid, 2160, 10)
				doPlayerAddPontos(cid, 5)
end
end
end

