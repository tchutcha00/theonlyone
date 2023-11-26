local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 10, 15, 350.4, 390.8, 50, 60)


local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
