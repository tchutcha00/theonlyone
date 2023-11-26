local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 2.0, 0)



local xCombat = createCombatObject()

setCombatParam(xCombat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)



function onUseWeapon(cid, var)
	
local ret = doCombat(cid, combat, var)
	
if(ret == false) then
		
return false
	
end

	
local target = variantToNumber(var)
	
if(target ~= 0) then
		-- chance to poison the enemy
		
local chance = math.random(0, 100)
		
if(chance < 7) then
			
ret = doCombat(cid, xCombat, var)

end
	
end
	
return ret
end


