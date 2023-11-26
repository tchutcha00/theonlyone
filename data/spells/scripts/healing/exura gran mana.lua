local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 37)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 2, -15, 1.5, 0)


function onGetFormulaValues(cid, level, maglevel)
min = (level * 2 + maglevel * 3) * 2.2 - 25
max = (level * 2 + maglevel * 3) * 2.5

if min < 250 then
min = 250
end

return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end