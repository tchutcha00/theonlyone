local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)



function onGetFormulaValues(cid, level, skill, attack, factor)
	
local skillTotal, levelTotal = skill + attack * 20, level / 20
	
return
 -(skillTotal * 25 + levelTotal), -(skillTotal * 30 + levelTotal)

end



setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	
return 
doCombat(cid, combat, var)

end
