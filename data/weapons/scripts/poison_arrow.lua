local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISONARROW)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)



function onUseWeapon(cid, var)
	
return 
doCombat(cid, combat, var)

end
