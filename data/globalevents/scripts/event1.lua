function doSummonMonsterInEvent(cid)
     summonMonster = getGlobalStorageValue(29474) 
     summonMonsterInPos = math.random(arenaPositionInitial, arenaPositionEnd)
     for g = 1, #monstersPositions do
         monster = doSummonCreature(levels[summonMonster][g], monstersPositions[g])
         doSendMagicEffect(getThingPos(monster), 21)
         local sto = getGlobalStorageValue(29474) == -1 and 0 or getGlobalStorageValue(29474)
          setGlobalStorageValue(29474, sto+1) 
   for _, sid in ipairs(getPlayersOnline()) do
       if getPlayerStorageValue(sid, playerstoragewararena) == 1 then
          doPlayerSendTextMessage(sid, 21, "The "..summonMonster.." level monsters appeared.")   
          doPlayerSendTextMessage(sid, 28, "The "..summonMonster.." level monsters appeared.")
       end
   end
     end
addEvent(doSummonMonsterInEvent, 30000, cid)
end

function getPlayerInEvent(cid)
         if getGlobalStorageValue(wararenastor) >= minPLayers then
            for _, poid in ipairs(getPlayersOnline()) do
                if getPlayerStorageValue(poid, playerstoragewararena) == 1 then
                   doPlayerSendTextMessage(poid, 25, "Prepare your weapons warrior. The monsters will spawn in 30 seconds.")
                   doTeleportThing(poid, math.random(arenaPositionInitial, arenaPositionEnd), false)
                   addEvent(doSummonMonsterInEvent, 30 * 1000, cid) 
                end
            end
         end
end
function onTimer(cid, interval, lastExecution) 
         setGlobalStorageValue(29474, 1)
         doBroadcastMessage("The Monster War Arena will start 5 minuts.")
         addEvent(getPlayerInEvent, 5 * 1000 * 60, cid) 
end