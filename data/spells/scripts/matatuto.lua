local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_STUN)

function onGetFormulaValues(cid, level, skill, attack, factor)
    local skillTotal, levelTotal = skill + attack, level / 5
    return -(skillTotal * 15.0 + levelTotal), -(skillTotal * 10.5 + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end


local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.3, 0, -0.5, 0)
setCombatCondition(combat, condition)
setCombatArea(combat, area)

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end