local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)



local xCombat = createCombatObject()

setCombatParam(xCombat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)



function onUseWeapon(cid, var)
	
local ret = doCombat(cid, combat, var)
	
if(ret == false) then
		
return false
	
end

	
local target = variantToNumber(var)
	
if(target ~= 0) then
		-- chance to poison the enemy
		
local chance = math.random(0, 100)
		
if(chance > 50) then
			
ret = doCombat(cid, xCombat, var)
		
end
	
end
	
return ret
end

