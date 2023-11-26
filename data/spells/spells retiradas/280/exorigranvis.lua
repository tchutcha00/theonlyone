local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1492)


setCombatParam(combat, COMBAT_PARAM_EFFECT, 4)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

addDamageCondition(condition, 10, 2000, -10000)
setCombatCondition(combat, condition)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -390, -400, -300, -280, 1, 1, 1.4, 1.1)


function onCastSpell(cid, var)

	return 
doCombat(cid, combat, var)

end
