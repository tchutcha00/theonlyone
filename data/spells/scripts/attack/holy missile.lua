local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50, 20, -50, -30, 65, 65, 43.85, 31.95, -30, -60)


function onCastSpell(cid, var)
	
return 
doCombat(cid, combat, var)

end
