local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 43)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -150, -20, -175, -30, 1, 1, 1.4, 1.1)


function onCastSpell(cid, var)

	return 
doCombat(cid, combat, var)

end
