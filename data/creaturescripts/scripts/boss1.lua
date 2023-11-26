function onDeath(cid, corpse, killer, frompos)
local pipo = {2154, 2156, 2158}
local bp = doPlayerAddItem(cid,5801,1)
local monster = "pickrodor" 
if isMonster and getCreatureName(cid) == monster then
doCreatureSay(cid, "Demon", TALKTYPE_ORANGE_1)
if isPlayer(killer[1]) == TRUE then

 
             
                        for i = 1, 25 do                  
                        doAddContainerItem(bp, pipo[math.random(#pipo)], 1)
end   
                  

doPlayerSendTextMessage(killer[1], 22, "Voce matou o "..getCreatureName(cid).." .")
end
end
end
