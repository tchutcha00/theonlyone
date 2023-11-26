local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 26, 23, 30, 27)



local area = createCombatArea(AREA_BEAM7)

setCombatArea(combat, area)


function onCastSpell(cid, var)

	return doCombat(cid, combat, var)

end
