local maxSummons = 2
local summons = {
    ["wizard"] = { monsters = {"Bruxo", "Cave Rat"}, mana = 200},
    ["noble"] = { monsters = {"Dragon", "Dragon Lord"}, mana = 300},
}
 
function onSay(cid, words, param, channel)
    param = string.lower(tostring(param))
    if(param == "") then
        return true
    end
    if not summons[param] then 
        doPlayerSendCancel(cid, "This doesn't exists!")
        return true
    end
    if #getCreatureSummons(cid) >= maxSummons then
        doPlayerSendCancel(cid, "You cant have more than "..maxSummons.." summons!")
        return true
    end
    for _, monster in pairs(summons[param].monsters) do
        local creature = doSummonCreature(monster, getThingPos(cid))
        if not creature or not isCreature(creature) then
             doPlayerSendCancel(cid, "There is no space for summoning monsters!")
             return true 
        end
        doConvinceCreature(cid, creature)
    end
    doCreatureAddMana(cid,-summons[param].mana)
    return true
end