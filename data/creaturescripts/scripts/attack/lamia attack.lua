local lvlcrit = 7655
local multiplier = 0


function onStatsChange(cid, attacker, type, combat, value)
if isMonster(attacker) and (not (attacker == cid)) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS)  then
dano = math.ceil(value*10)
doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 255)
doSendAnimatedText(getCreaturePos(attacker), "CRITICAL!!", 144)
return true
end
end