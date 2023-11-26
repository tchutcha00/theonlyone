local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 9)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack * 2320, level / 1000 * 1600
	return -(skillTotal / 1020 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end