local lvl = 99
local multiplier = 20000
local effect = 61
 

function onStatsChange(cid, attacker, type, combat, value)



local summons = getCreatureSummons(cid)
	
	if summons and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) then

		for i=1, #summons do 
             dano = math.ceil(value*(multiplier))
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 255)
		end
		return true
	end
	return false
end
