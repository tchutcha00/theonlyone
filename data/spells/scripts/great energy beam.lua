local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4, 7)


local area = createCombatArea(AREA_BEAM5, AREADIAGONAL_BEAM5)

setCombatArea(combat, area)


function onCastSpell(cid, var)

	return doCombat(cid, combat, var)

end
