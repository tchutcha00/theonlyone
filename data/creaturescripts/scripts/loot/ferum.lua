function onKill(cid, corpse, deathList)
 
    local itemIds = {7410, 7410}
    local monsterName = "Ferumbras"
    local bp = doAddContainerItem(corpse.uid, 1988)
    local chance = 90
    
    local item = {1988, 1988, 1988}
if not isMonster(target) then return true end
if math.random(1,200) <= 199 then
local bp = doAddContainerItem(corpse.uid, item[math.random(#item)])
doAddContainerItem(bp, itemIds[math.random(#itemIds)])
end
return true
end



