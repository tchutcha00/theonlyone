local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, TRUE)

local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 30 * 1000)
setCombatCondition(combat, condition)

local condition2 = createConditionObject(CONDITION_PACIFIED)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 6 * 1000)
setCombatCondition(combat, condition2)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
