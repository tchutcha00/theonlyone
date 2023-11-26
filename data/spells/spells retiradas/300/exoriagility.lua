local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 2500, 1500, 1900, 2300)


function onCastSpell(cid, var)

	return 
doCombat(cid, combat, var)

end
