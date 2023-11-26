local duration = 3 * 1000

local combat = createCombatObject()
        setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
	setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMGE)
	setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, duration)
	setConditionFormula(condition, -0.9, 0, -0.9, 0)
     doSendAnimatedText(getCreaturePosition(cid), "PARALYZE", TEXTCOLOR_BLUE)
	setCombatCondition(combat, condition)

function onUseWeapon(cid, item, fromPosition, itemEx, toPosition)

 doPlayerSendTextMessage(cid,19,"Este Item Pode Paralyzar!")
	return doCombat(cid, combat, var)

end