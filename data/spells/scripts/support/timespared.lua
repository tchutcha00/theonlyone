local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 33000)
setConditionFormula(condition, 0.9, -48, 0.9, -49)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
