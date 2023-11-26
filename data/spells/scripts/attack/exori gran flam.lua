local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 6)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 4)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -160, -20, -185, -30, 1, 1, 1.4, 1.1)


function onCastSpell(cid, var)

	return 
doCombat(cid, combat, var)

end
