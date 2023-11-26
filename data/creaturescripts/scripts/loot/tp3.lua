function onDeath(cid, corpse, deathList)
 
    local itemIds = {2183, 8920, 9778, 9776, 9777, 2471, 2471, 2466, 2470, 2493, 2494, 2495, 2506, 2492, 2469, 2662, 2656, 7730, 7902, 7897, 7896, 6132, 2123, 2138, 7735, 10223, 8901, 4850, 10523, 7839, 7838, 7840, 7850}
    local monsterName = "Bazir"
    local chance = 5
    local item = {10518, 10518, 10518}


    if chance == math.random(1, 100) then 
    if((isMonster(cid)) and (getCreatureName(cid) == monsterName)) then
    local bp = doAddContainerItem(corpse.uid, item[math.random(#item)])
         doAddContainerItem(bp, itemIds[math.random(#itemIds)])
    end
    end
    return true
end