local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 600, 450, 440, 730)


function onCastSpell(cid, var)

	return 
doCombat(cid, combat, var)

end
