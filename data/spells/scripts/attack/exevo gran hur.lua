local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)


function onGetFormulaValues(cid, level, skill, attack, factor)
	
local skillTotal, levelTotal = skill + attack * 15, level / 15
	
return
 -(skillTotal * 20 + levelTotal), -(skillTotal * 25 + levelTotal)

end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	
return 
doCombat(cid, combat, var)

end
