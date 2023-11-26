local lvlcrit = 21600
local multiplier = 2




function onCombat(cid, target)
if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isMonster(attacker) and isCreature(cid) and getCreatureName(cid) then
if (getPlayerStorageValue(attacker, lvlcrit)*2) >= math.random (1000,1000) then
value = math.ceil(value*(multiplier))
doTargetCombatHealth(attacker, cid, combat, -value, -value, 255)


return false
end
end
return true
end