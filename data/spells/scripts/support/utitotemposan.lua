local duration = 10 -- segundos
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, duration * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 115)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
        return doCombat(cid, combat, var)
end